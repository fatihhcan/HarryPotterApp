//
//  MockCharactersRepository.swift
//  HarryPotterTests
//
//  Created by Fatih Can on 18.11.2024.
//

import Foundation
import Alamofire


protocol NetworkingService {
    func fetchData(url: URL, completion: @escaping (Data?, Error?) -> Void)
}

class MockNetworkingService: NetworkingService {
    func fetchData(url: URL, completion: @escaping (Data?, Error?) -> Void) {
        let jsonString = """
            [{
                "name": "Harry Potter",
                "actor": "Daniel Radcliffe"
            }]
        """
        if let data = jsonString.data(using: .utf8) {
            completion(data, nil)
        } else {
            let error = NSError(domain: "MockNetworkingServiceErrorDomain", code: -1, userInfo: nil)
            completion(nil, error)
        }
    }
}
