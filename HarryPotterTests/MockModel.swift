//
//  MockModel.swift
//  HarryPotterTests
//
//  Created by Fatih Can on 18.11.2024.
//

import Foundation

// MARK: - Character
class MockCharacter: Codable {
    let name: String
    let actor: String

    enum CodingKeys: String, CodingKey {
        case name
        case actor
    }

    init(name: String, actor: String) {
        self.name = name
        self.actor = actor
    }
}

typealias Characters = [MockCharacter]
