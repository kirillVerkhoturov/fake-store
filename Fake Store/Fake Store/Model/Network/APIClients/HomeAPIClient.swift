//
//  HomeAPIClient.swift
//  Fake Store
//
//  Created by Anton Sobolev on 12/27/21.
//

import Foundation

protocol HomeAPIClient {
    func product(by id: Int, completion: @escaping (Result<Product, Error>) -> ())
    func getProducts(completion: @escaping (Result<[Product], Error>) -> ())
    func categories(completion: @escaping (Result<[String], Error>) -> ())
}

extension APIClient: HomeAPIClient {

    // MARK: - Public Methods

    func categories(completion: @escaping (Result<[String], Error>) -> ()) {
        let request = requestBuilder
            .set(path: .categories)
            .set(method: .GET)
            .build()
        performRequest(request) { (result: Result<[String], Error>) in
            completion(result)
        }
    }

    func product(by id: Int, completion: @escaping (Result<Product, Error>) -> ()) {
        let request = requestBuilder
            .set(path: .product(id: id))
            .set(method: .GET)
            .build()
        performRequest(request) { (result: Result<Product, Error>) in
            completion(result)
        }
    }

    func getProducts(completion: @escaping (Result<[Product], Error>) -> ()) {
        let request = requestBuilder
            .set(path: .getProducts)
            .set(method: .GET)
            .build()
        performRequest(request) { (result: Result<[Product], Error>) in
            completion(result)
        }
    }

}
