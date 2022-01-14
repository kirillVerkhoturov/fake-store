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

        register(cellClass: LoginTableViewCell.self)
        register(cellClass: SignInTableViewCell.self)
        let header = LoginTableHeaderView()
        header.translatesAutoresizingMaskIntoConstraints = false
        tableHeaderView = header
        let footer = LoginTableFooterView()
        footer.translatesAutoresizingMaskIntoConstraints = false
        tableFooterView = footer
    }

    @objc private func signInButtonDidTap() {
        onLoginButtonDidTap?()
    }

}

extension LoginTableView: UITableViewDelegate, UITableViewDataSource {

    // MARK: UITableViewDataSource

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        2
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellType = CellType(rawValue: indexPath.row)
        switch cellType {
        case .login:
            let cell = dequeue(cellClass: LoginTableViewCell.self, forIndexPath: indexPath)
            onUsernameChange?(cell.usernameTextField.text!)
            onPasswordChange?(cell.passwordTextField.text!)

            return cell
        case .signIn:
            let cell = dequeue(cellClass: SignInTableViewCell.self, forIndexPath: indexPath)
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
        headerView.frame.size.height = updateHeaderFooterHeight(for: headerView)
        headerView.translatesAutoresizingMaskIntoConstraints = true
        tableHeaderView = headerView
    }

    func updateFooterViewHeigh() {
        guard let footerView = self.tableFooterView as? LoginTableFooterView else { return }
        footerView.frame.size.height = updateHeaderFooterHeight(for: footerView)
        footerView.translatesAutoresizingMaskIntoConstraints = true
        tableFooterView = footerView
    }
}
