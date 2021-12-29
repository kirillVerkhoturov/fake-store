//
//  WishlistViewModel.swift
//  Fake Store
//
//  Created by Anton Sobolev on 12/24/21.
//

import Foundation

final class WishlistViewModel {

    // MARK: - Private Properties

    private let wishlistService: WishlistServiceProtocol?

    // MARK: - Initializers

    init(service: WishlistServiceProtocol) {
        self.wishlistService = service
    }
    
}
