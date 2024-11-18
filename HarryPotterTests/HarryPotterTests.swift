//
//  HarryPotterTests.swift
//  HarryPotterTests
//
//  Created by Fatih Can on 16.11.2024.
//

import XCTest

final class HarryPotterTests: XCTestCase {
    var apiClient: MockCharactersAPIClient!
    
        override func setUp() {
            super.setUp()
            let mockNetworkingService = MockNetworkingService()
            apiClient = MockCharactersAPIClient(networkingService: mockNetworkingService)
        }
    
        override func tearDown() {
            apiClient = nil
            super.tearDown()
        }
    
        func testFetchCharactersData() {
            let expectation = self.expectation(description: "Fetch characters data")
            apiClient.fetchCharactersData { result in
                switch result {
                case .success(let character):
                    XCTAssertEqual(character[0].name, "Harry Potter")
                    XCTAssertEqual(character[0].actor, "Daniel Radcliffe")
                case .failure(let error):
                    XCTFail("Error: \(error.localizedDescription)")
                }
                expectation.fulfill()
            }
            wait(for: [expectation], timeout: 5.0)
        }
}
