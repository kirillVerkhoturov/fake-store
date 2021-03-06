//
//  CartViewModel.swift
//  Fake Store
//
//  Created by Anton Sobolev on 12/24/21.
//

import Foundation

final class CartViewModel {

    // MARK: - Private Properties

    private let cartService: CartServiceProtocol?

    // MARK: - Initializers

    init(service: CartServiceProtocol) {
        self.cartService = service
    }

}

