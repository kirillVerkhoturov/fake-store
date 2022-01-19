//
//  AuthService.swift
//  Fake Store
//
//  Created by Anton Sobolev on 1/11/22.
//

import Foundation

protocol AuthServiceProtocol {
    func login(with data: [String: String], completion: @escaping (Result<APIClient.TokenResponse, Error>) -> ())
}

final class AuthService: AuthServiceProtocol {

    // MARK: - Private Properties

    private let authAPIClient: AuthAPIClient
    private let sessionRepository: SessionStorable
    private let userId = 1

    // MARK: - Initializers

    init(authAPIClient: AuthAPIClient, sessionRepository: SessionStorable) {
        self.authAPIClient = authAPIClient
        self.sessionRepository = sessionRepository
    }

    // MARK: - Public Methods

    func login(with data: [String: String], completion: @escaping (Result<APIClient.TokenResponse, Error>) -> ()) {
        authAPIClient.login(with: data) { [weak self] result in
            switch result {
            case .success(_):
                self?.sessionRepository.userId = self?.userId
                completion(result)
            case .failure(_):
                completion(result)
            }
        }
    }

}
