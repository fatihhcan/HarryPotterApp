//
//  MockCharactersAPIClient.swift
//  HarryPotterTests
//
//  Created by Fatih Can on 18.11.2024.
//

import Foundation

class MockCharactersAPIClient {
    private let networkingService: NetworkingService
    private let baseURL = "https://hp-api.onrender.com/api/characters"
    
    init(networkingService: NetworkingService) {
        self.networkingService = networkingService
    }
    
    func fetchCharactersData(completion: @escaping (Result<[MockCharacter], Error>) -> Void) {
        guard let url = URL(string: baseURL) else {
            return
        }
        networkingService.fetchData(url: url) { data, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            let decoder = JSONDecoder()
            do {
                let character = try decoder.decode([MockCharacter].self, from: data!)
                completion(.success(character))
            } catch {
                completion(.failure(error))
            }
        }
    }
}
