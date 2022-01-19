//
//  LoginViewModel.swift
//  Fake Store
//
//  Created by Anton Sobolev on 1/9/22.
//

import Foundation

final class LoginViewModel {

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
    var onShowAlert: (() -> Void)?

    // MARK: - Private Properties

    private let authService: AuthServiceProtocol?
    private var userData = ["username": "",
                            "password": ""]

    // MARK: - Initializers

    init(service: AuthServiceProtocol) {
        self.authService = service
    }

    // MARK: - Public Methods

    func loginButtonDidTap() {
        if !userData.isEmpty {
            loginRequest()
        }
    }

    func checkLoginStatus() -> Bool {
        false
    }

    // MARK: - Private Methods

    private func loginRequest() {
        authService?.login(with: userData, completion: { [weak self] result in
            switch result {
            case .success(_):
                DispatchQueue.main.async {
                    self?.isLogin?(true)
                }
            case .failure(_):
                self?.onShowAlert?()
            }
        })
    }
    
}
