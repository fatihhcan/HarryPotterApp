//
//  CharactersViewModel.swift
//  Harry Potter
//
//  Created by Fatih Can on 13.11.2024.
//

import SwiftUI
import Combine

class CharactersViewModel: ObservableObject {
    @Published var characters: [Character] = []
    @Published var isLoading: Bool = false
    @Published var errorMessage: String? = nil
    @Published var searchText = ""
    @Published var columns = [
        GridItem(.flexible(), spacing: 30),
        GridItem(.flexible(), spacing: 30)
    ]

    private let charactersRepository = CharactersRepository()
    
    func fetchCharacters() {
        isLoading = true
        charactersRepository.fetchChareters { [weak self] result in
            DispatchQueue.main.async {
                self?.isLoading = false
                switch result {
                case .success(let fetchedCharacters):
                    self?.characters = fetchedCharacters
                    print("Fetched Characters: \(fetchedCharacters)")
                case .failure(let error):
                    self?.errorMessage = error.localizedDescription
                    print("Failed to fetch characters: \(error.localizedDescription)")
                }
            }
        }
    }
}
