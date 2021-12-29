//
//  WishlistService.swift
//  Fake Store
//
//  Created by Anton Sobolev on 12/29/21.
//

import Foundation

protocol WishlistServiceProtocol {

}

final class WishlistService: WishlistServiceProtocol {

    // MARK: - Private Properties

    private let wishlistAPIClient: WishlistAPIClient

    // MARK: - Initializers

    init(wishlistAPIClient: WishlistAPIClient) {
        self.wishlistAPIClient = wishlistAPIClient
    }
    
}
