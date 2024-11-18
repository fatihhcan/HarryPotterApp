//
//  CharactersRepository.swift
//  Harry Potter
//
//  Created by Fatih Can on 13.11.2024.
//

import Foundation
import Alamofire

protocol CharactersServiceProtocol {
    func fetchChareters(completion: @escaping (Result<[Character], Error>) -> Void)
}

class CharactersRepository: CharactersServiceProtocol {
    private let baseURL = "\(Base.URL.rawValue)/\(Base.character.rawValue)"
    
    func fetchChareters(completion: @escaping (Result<[Character], Error>) -> Void) {
        AF.request(baseURL).responseDecodable(of: [Character].self) { response in
            switch response.result {
            case .success(let character):
                completion(.success(character))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
