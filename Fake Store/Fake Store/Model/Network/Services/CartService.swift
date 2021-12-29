//
//  CartService.swift
//  Fake Store
//
//  Created by Anton Sobolev on 12/29/21.
//

import Foundation

protocol CartServiceProtocol {

}

final class CartService: CartServiceProtocol {

    // MARK: - Private Properties

    private let cartAPIClient: CartAPIClient

    // MARK: - Initializers

    init(cartAPIClient: CartAPIClient) {
        self.cartAPIClient = cartAPIClient
    }

    
}
