//
//  ProfileViewModel.swift
//  Fake Store
//
//  Created by Anton Sobolev on 12/24/21.
//

import Foundation

final class ProfileViewModel {

    // MARK: - Private Properties

    private let profileService: ProfileServiceProtocol?

    // MARK: - Initializers

    init(service: ProfileServiceProtocol) {
        self.profileService = service
    }

}
