//
//  ProfileService.swift
//  Fake Store
//
//  Created by Anton Sobolev on 12/29/21.
//

import Foundation

protocol ProfileServiceProtocol {

}

final class ProfileService: ProfileServiceProtocol {

    // MARK: - Private Properties

    private let profileAPIClient: ProfileAPIClient

    // MARK: - Initializers

    init(profileAPIClient: ProfileAPIClient) {
        self.profileAPIClient = profileAPIClient
    }

}
