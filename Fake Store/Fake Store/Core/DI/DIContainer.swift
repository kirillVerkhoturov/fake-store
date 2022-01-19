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
    let configuration = URLSessionConfiguration.default
    let decoder: JSONDecoder
    let udWrapper: UserDefaults
    let sessionRepository: SessionRepository

    let requestBuilder: RequestBuilder
    let apiClient: APIClient

    lazy var homeService = HomeService(homeAPIClient: apiClient)
    lazy var wishlistService = WishlistService(wishlistAPIClient: apiClient)
    lazy var cartService = CartService(cartAPIClient: apiClient)
    lazy var profileService = ProfileService(profileAPIClient: apiClient)
    lazy var authService  = AuthService(authAPIClient: apiClient, sessionRepository: sessionRepository)

    // MARK: - Private Properties

    private let maxResponseTime: TimeInterval = 20

    // MARK: - Initializers

    init() {
        udWrapper = UserDefaults.standard
        sessionRepository = SessionRepository(udWrapper: udWrapper)
        requestBuilder = RequestBuilder()
        configuration.waitsForConnectivity = true
        configuration.timeoutIntervalForResource = maxResponseTime
        session = URLSession(configuration: configuration)
        decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        apiClient = APIClient(requestBuilder: requestBuilder, session: session, decoder: decoder)
    }
}
