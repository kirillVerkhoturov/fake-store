//
//  APIClient.swift
//  Fake Store
//
//  Created by Anton Sobolev on 12/27/21.
//

import Foundation

enum HTTPError: Error, LocalizedError {
    case invalidURLRequest
    case badServerResponse
    case unknown

    var errorDescription: String? {
        switch self {
        case .invalidURLRequest:
            return NSLocalizedString("nil in URLRequest", comment: "invalidURLRequest")
        case .badServerResponse:
            return NSLocalizedString("Server status code >299", comment: "badServerResponse")
        case .unknown:
            return NSLocalizedString("Unknown error", comment: "unknown")
        }
    }
}

class APIClient {

    // MARK: - Public Properties

    let requestBuilder: RequestBuilderProtocol

    // MARK: - Private Properties

    private let session: URLSession
    private let decoder: JSONDecoder

    // MARK: - Initializers

    init(requestBuilder: RequestBuilderProtocol, session: URLSession, decoder: JSONDecoder) {
        self.requestBuilder = requestBuilder
        self.session = session
        self.decoder = decoder
    }

    // MARK: - Public Methods

    func performRequest<T: Decodable>(_ request: URLRequest?, completion: @escaping (Result<T, Error>) -> ()) {
        guard let request = request else { return }

        session.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            guard let response = response as? HTTPURLResponse, (200..<300) ~= response.statusCode else {
                completion(.failure(HTTPError.badServerResponse))
                return
            }
            guard let data = data else { return }

            do {
                let result = try self.decoder.decode(T.self, from: data)
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }

}
