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
    var username: String = ""
    var password: String = ""

    // MARK: - Initializers

    init() {
    }

    // MARK: - Public Properties

    func loginButtonDidTap() {
        if !username.isEmpty && !password.isEmpty {
            isLogin?(true)
        }
    }

    func checkLoginStatus() -> Bool {
        false
    }
    
}
