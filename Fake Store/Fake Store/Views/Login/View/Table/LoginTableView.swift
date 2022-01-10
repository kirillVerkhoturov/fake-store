//
//  LoginTableView.swift
//  Fake Store
//
//  Created by Anton Sobolev on 12/30/21.
//

import UIKit

enum CellType: Int, CaseIterable {
    case login
    case signIn
}

class LoginTableView: UITableView {

    // MARK: - Public Properties

    var onLoginButtonDidTap: (() -> Void)?
    var onUsernameChange: ((String) -> Void)?
    var onPasswordChange: ((String) -> Void)?

    // MARK: - Initializers

    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        backgroundColor = AppColor.loginWhite
        setupTableView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Private Methods

    private func setupTableView() {
        delegate = self
        dataSource = self

        register(LoginTableViewCell.self, forCellReuseIdentifier: LoginTableViewCell.reuseID)
        register(SignInTableViewCell.self, forCellReuseIdentifier: SignInTableViewCell.reuseID)

        tableHeaderView = LoginTableHeaderView()
        tableFooterView = LoginTableFooterView()
    }

    @objc private func signInButtonDidTap() {
        onLoginButtonDidTap?()
    }

}

extension LoginTableView: UITableViewDelegate, UITableViewDataSource {

    // MARK: UITableViewDataSource

    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        2
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellType = CellType(rawValue: indexPath.row)
        switch cellType {
        case .login:
            let cell = dequeueReusableCell(withIdentifier: LoginTableViewCell.reuseID) as! LoginTableViewCell
            onUsernameChange?(cell.usernameTextField.text!)
            onPasswordChange?(cell.passwordTextField.text!)

            return cell
        case .signIn:
            let cell = dequeueReusableCell(withIdentifier: SignInTableViewCell.reuseID) as! SignInTableViewCell
            cell.loginButton.addTarget(self, action: #selector(signInButtonDidTap), for: .touchUpInside)
            return cell
        case .none:
            return UITableViewCell()
        }
    }

}

extension LoginTableView {
    func updateHeaderViewHeigh() {
        guard let headerView = self.tableHeaderView as? LoginTableHeaderView else { return }
        let height = headerView.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize).height
        if headerView.frame.size.height != height {
            headerView.frame.size.height = height
            self.tableHeaderView = headerView
        }
        headerView.translatesAutoresizingMaskIntoConstraints = true
    }

    func updateFooterViewHeigh() {
        guard let footerView = self.tableFooterView as? LoginTableFooterView else { return }
        let height = footerView.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize).height
        if footerView.frame.size.height != height {
            footerView.frame.size.height = height
            self.tableFooterView = footerView
        }
        footerView.translatesAutoresizingMaskIntoConstraints = true
    }
}
