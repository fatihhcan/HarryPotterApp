//
//  CharactersRepositoryTests.swift
//  Harry PotterTests
//
//  Created by Fatih Can on 13.11.2024.
//

import XCTest
import Alamofire
@testable import Harry_Potter

final class CharactersRepositoryTests: XCTestCase {
    
    var repository: CharactersRepository!
    
    override func setUp() {
        super.setUp()
        repository = CharactersRepository()
    }
    
    override func tearDown() {
        repository = nil
        super.tearDown()
    }
    
    func testFetchCharactersFromAPI() {
        let expectation = self.expectation(description: "Fetch Characters API")
        
        repository.fetchChareters { result in
            switch result {
            case .success(let characters):
                XCTAssertNotNil(characters)
                XCTAssertGreaterThan(characters.count, 0)
                expectation.fulfill()
            case .failure(let error):
                XCTFail("Failed to fetch characters: \(error.localizedDescription)")
            }
        }
        
        waitForExpectations(timeout: 5.0)
    }
}
