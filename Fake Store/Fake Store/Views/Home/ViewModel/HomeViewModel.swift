//
//  HomeViewModel.swift
//  Fake Store
//
//  Created by Anton Sobolev on 12/24/21.
//

import Foundation

final class HomeViewModel {

    // MARK: - Private Properties

    private let homeService: HomeServiceProtocol?

    // MARK: - Initializers

    init(service: HomeServiceProtocol) {
        self.homeService = service
    }

    func requestCategories() {
        homeService?.categories(completion: { result in
            switch result {
            case .success(let categories):
                debugPrint(categories)
            case .failure(let error):
                debugPrint(error)
            }
        })
    }
    func requestProducts() {
        homeService?.getAllProducts(completion: { result in
            switch result {
            case .success(let products):
                debugPrint(products)
            case .failure(let error):
                debugPrint(error)
            }
        })
    }
    
}

