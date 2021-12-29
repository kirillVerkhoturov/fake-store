//
//  DIContainer.swift
//  Fake Store
//
//  Created by Anton Sobolev on 12/28/21.
//

import Foundation

final class DIContainer {

    // MARK: - Public Properties

    let session: URLSession
    let decoder: JSONDecoder

    let requestBuilder: RequestBuilder
    let apiClient: APIClient

    lazy var homeService = HomeService(homeAPIClient: apiClient)
    lazy var wishlistService = WishlistService(wishlistAPIClient: apiClient)
    lazy var cartService = CartService(cartAPIClient: apiClient)
    lazy var profileService = ProfileService(profileAPIClient: apiClient)

    // MARK: - Initializers

    init() {
        requestBuilder = RequestBuilder()
        session = URLSession.shared
        decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        apiClient = APIClient(requestBuilder: requestBuilder, session: session, decoder: decoder)
    }
}
