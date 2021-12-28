//
//  RequestBuilder.swift
//  Fake Store
//
//  Created by Anton Sobolev on 12/27/21.
//

import Foundation

enum Endpoint {
    case none
    case product(id: Int? = nil)
    case getProducts
    case categories
    case productsInCategory(category: String? = nil)

    var rawValue: String {
        switch self {
        case .none:
            return "/"
        case .product(id: let id):
            guard let id = id else { return "/products/" }
            return "products/\(id)"
        case .getProducts:
            return "/products/"
        case .categories:
            return "/products/categories"
        case .productsInCategory(category: let category):
            guard let category = category else { return "/products/categories" }
            return "/products/category/\(category)"
        }
    }
}

enum HTTPMethod: String {
    case POST
    case PUT
    case GET
    case DELETE
    case PATCH
}

protocol RequestBuilderProtocol {
    var host: String { get }
    var path: Endpoint { get }
    var method: HTTPMethod { get }
    var parameters: [String: Any] { get }

    func set(host: String) -> Self
    func set(path: Endpoint) -> Self
    func set(method: HTTPMethod) -> Self
    func set<T: Encodable>(parameter: T) -> Self

    func build() -> URLRequest?
}

class RequestBuilder: RequestBuilderProtocol {

    // MARK: - Private Properties

    private(set) var host: String = "https://fakestoreapi.com"
    private(set) var path: Endpoint = .none
    private(set) var method: HTTPMethod = .GET
    private(set) var parameters: [String : Any] = [:]

    // MARK: - Public Methods

    @discardableResult
    func set(host: String) -> Self {
        self.host = host
        return self
    }

    @discardableResult
    func set(path: Endpoint) -> Self {
        self.path = path
        return self
    }

    @discardableResult
    func set(method: HTTPMethod) -> Self {
        self.method = method
        return self
    }

    @discardableResult
    func set<T>(parameter: T) -> Self {
        return self
    }

    func build() -> URLRequest? {
        guard var urlComponents = URLComponents(string: host) else { return nil }
        urlComponents.path = path.rawValue

        let isGetMethod = method == .GET
        if !parameters.isEmpty, isGetMethod {
            urlComponents.queryItems = parameters.map { URLQueryItem(name: $0.key, value: $0.value as? String ) }
        }

        guard let url = urlComponents.url else { return nil }
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = method.rawValue

        return urlRequest
    }

}
