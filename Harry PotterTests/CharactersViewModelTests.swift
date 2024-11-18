//
//  CharactersViewModelTests.swift
//  Harry PotterTests
//
//  Created by Fatih Can on 13.11.2024.
//

import XCTest
@testable import Harry_Potter

class CharactersViewModelTests: XCTestCase {
    
    var viewModel: CharactersViewModel!
    var mockService: MockCharactersService!
    
    override func setUp() {
        super.setUp()
        mockService = MockCharactersService()
        viewModel = CharactersViewModel()

    }
    
    override func tearDown() {
        viewModel = nil
        mockService = nil
        super.tearDown()
    }
    
    func testFetchCharactersSuccess() {
        // Arrange
        let mockCharacter = Character(id: "1",
                                      name: "Harry Potter",
                                      alternateNames: ["The Boy Who Lived"],
                                      species: "human",
                                      gender: .male,
                                      house: .gryffindor,
                                      dateOfBirth: "31-07-1980",
                                      yearOfBirth: 1980,
                                      wizard: true,
                                      ancestry: .halfBlood,
                                      eyeColour: .green,
                                      hairColour: .black,
                                      wand: Wand(wood: "holly", core: .phoenixFeather, length: 11),
                                      patronus: .stag,
                                      hogwartsStudent: true,
                                      hogwartsStaff: false,
                                      actor: "Daniel Radcliffe",
                                      alternateActors: [],
                                      alive: true,
                                      image: "")
        
        mockService.isSuccess = true
        mockService.mockCharacters = [mockCharacter]

        // Act
        let expectation = XCTestExpectation(description: "Fetch characters successfully")
        viewModel.fetchCharacters()

        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            // Assert
            XCTAssertFalse(self.viewModel.isLoading)
            XCTAssertNil(self.viewModel.errorMessage)
            XCTAssertEqual(self.viewModel.characters.count, 1)
            XCTAssertEqual(self.viewModel.characters.first?.name, "Harry Potter")
            expectation.fulfill()
        }

        wait(for: [expectation], timeout: 2.0)
    }
    
    func testFetchCharactersFailure() {
        // Arrange
        mockService.isSuccess = false
        mockService.mockError = NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "Network Error"])

        // Act
        let expectation = XCTestExpectation(description: "Fetch characters failure")
        viewModel.fetchCharacters()

        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            // Assert
            XCTAssertFalse(self.viewModel.isLoading)
            XCTAssertNotNil(self.viewModel.errorMessage)
            XCTAssertEqual(self.viewModel.errorMessage, "Network Error")
            XCTAssertTrue(self.viewModel.characters.isEmpty)
            expectation.fulfill()
        }

        wait(for: [expectation], timeout: 2.0)
    }
    
    func testSearchFilter() {
        // Arrange
        let character1 = Character(id: "1", name: "Harry Potter", alternateNames: [], species: "", gender: .male, house: .gryffindor, dateOfBirth: nil, yearOfBirth: nil, wizard: true, ancestry: .halfBlood, eyeColour: .green, hairColour: .black, wand: Wand(wood: "", core: .empty, length: nil), patronus: .stag, hogwartsStudent: true, hogwartsStaff: false, actor: "", alternateActors: [], alive: true, image: "")
        let character2 = Character(id: "2", name: "Hermione Granger", alternateNames: [], species: "", gender: .female, house: .gryffindor, dateOfBirth: nil, yearOfBirth: nil, wizard: true, ancestry: .muggleborn, eyeColour: .brown, hairColour: .brown, wand: Wand(wood: "", core: .empty, length: nil), patronus: .otter, hogwartsStudent: true, hogwartsStaff: false, actor: "", alternateActors: [], alive: true, image: "")
        
        viewModel.characters = [character1, character2]
        viewModel.searchText = "Harry"
        
        // Act
        let filteredCharacters = viewModel.characters.filter { character in
            viewModel.searchText.isEmpty || character.name.lowercased().contains(viewModel.searchText.lowercased())
        }
        
        // Assert
        XCTAssertEqual(filteredCharacters.count, 1)
        XCTAssertEqual(filteredCharacters.first?.name, "Harry Potter")
    }
}
