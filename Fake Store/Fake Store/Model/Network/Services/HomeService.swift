//
//  ProductService.swift
//  Fake Store
//
//  Created by Anton Sobolev on 12/27/21.
//

import Foundation

protocol HomeServiceProtocol {
    func getProduct(by id: Int, completion: @escaping (Result<Product, Error>) -> ())
    func categories(completion: @escaping (Result<[String], Error>) -> ())
    func getAllProducts(completion: @escaping (Result<[Product], Error>) -> ())
}

final class HomeService: HomeServiceProtocol {

    // MARK: - Private Properties

    private let homeAPIClient: HomeAPIClient

    // MARK: - Initializers

    init(homeAPIClient: HomeAPIClient) {
        self.homeAPIClient = homeAPIClient
    }

    // MARK: - Public Methods

    func categories(completion: @escaping (Result<[String], Error>) -> ()) {
        homeAPIClient.categories { result in
            completion(result)
        }
    }

    func getProduct(by id: Int, completion: @escaping (Result<Product, Error>) -> ()) {
        homeAPIClient.product(by: id) { product in
            completion(product)
        }
    }

    func getAllProducts(completion: @escaping (Result<[Product], Error>) -> ()) {
        homeAPIClient.getProducts { result in
            completion(result)
        }
    }
    
}
