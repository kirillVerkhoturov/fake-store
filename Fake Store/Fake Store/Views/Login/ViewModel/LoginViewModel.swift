//
//  LoginViewModel.swift
//  Fake Store
//
//  Created by Anton Sobolev on 1/9/22.
//

import Foundation

final class LoginViewModel {

    // MARK: - Private Properties

    private let authService: AuthServiceProtocol?
    private var userData = ["username": "",
                            "password": ""]

    // MARK: - Public Properties

    var isLogin: ((Bool) -> Void)?
    var username: String? {
        didSet {
            userData["username"] = username
        }
    }
    var password: String? {
        didSet {
            userData["password"] = password
        }
    }

    // MARK: - Initializers

    init(service: AuthServiceProtocol) {
        self.authService = service
    }

    // MARK: - Public Properties

    func loginButtonDidTap() {
        if !userData.isEmpty {
            authService?.login(with: userData, completion: { [weak self] result in
                switch result {
                case .success(_):
                    DispatchQueue.main.async {
                        self?.isLogin?(true)
                    }
                case let .failure(error):
                    print("‼️\(error)")
                }
            })
        }
    }

    func checkLoginStatus() -> Bool {
        false
    }
    
}
