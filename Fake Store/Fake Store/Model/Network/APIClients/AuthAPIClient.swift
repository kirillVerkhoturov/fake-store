//
//  AuthAPIClient.swift
//  Fake Store
//
//  Created by Anton Sobolev on 1/11/22.
//

import Foundation

protocol AuthAPIClient {
    func login(with data: [String: String], completion: @escaping (Result<APIClient.TokenResponse, Error>) -> ())
}

extension APIClient: AuthAPIClient {
    func login(with data: [String: String], completion: @escaping (Result<APIClient.TokenResponse, Error>) -> ()) {
        let request = requestBuilder
            .set(path: .auth)
            .set(method: .POST)
            .set(parameters: data)
            .build()
        performRequest(request) { (result: Result<APIClient.TokenResponse, Error>) in
            completion(result)
        }
    }
}

extension APIClient {
    struct TokenResponse: Decodable {
        let token: String
    }
}
