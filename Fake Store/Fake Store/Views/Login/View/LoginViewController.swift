//
//  LoginViewController.swift
//  Fake Store
//
//  Created by Anton Sobolev on 12/29/21.
//

import UIKit

class LoginViewController: UIViewController {

    // MARK: - Public Properties

    let loginViewModel: LoginViewModel

    // MARK: - Private Properties

    private lazy var loginView = LoginView()

    // MARK: - Initializers

    init(viewModel: LoginViewModel) {
        self.loginViewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Lifecycle

    override func loadView() {
        view = loginView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupBindings()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
    }

    override func viewDidLayoutSubviews() {
        loginView.loginTableView.updateHeaderViewHeigh()
        loginView.loginTableView.updateFooterViewHeigh()
    }

    // MARK: - Private Methods

    private func setupBindings() {
        loginView.loginTableView.onLoginButtonDidTap = { [weak self] in
            self?.loginViewModel.loginButtonDidTap()
        }
        loginView.loginTableView.onUsernameChange = { [unowned self] username in
            self.loginViewModel.username = username
        }
        loginView.loginTableView.onPasswordChange = { [unowned self] password in
            self.loginViewModel.password = password
        }

        loginViewModel.onShowAlert = { [weak self] in
            self?.showErrorAlert()
        }
    }

    private func showErrorAlert() {
        let data = UIAlertControllerInputData (title: "Unable to perform action",
                                               message: "Sorry, action you trying to perform is not possible at the moment. Please try again later.",
                                               buttons: [.init(title: "OK")])
        let alert = UIAlertController(inputData: data)
        DispatchQueue.main.async { [weak self] in
            self?.present(alert, animated: true)
        }
    }

}
