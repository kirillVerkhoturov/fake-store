//
//  LoginView.swift
//  Fake Store
//
//  Created by Anton Sobolev on 12/29/21.
//

import UIKit
import SnapKit

class LoginView: UIView {

    // MARK: - Private Properties

    private(set) lazy var loginTableView: LoginTableView = {
        let tableView = LoginTableView()
        tableView.separatorStyle = .none
        tableView.estimatedRowHeight = 100
        tableView.rowHeight = UITableView.automaticDimension

        tableView.translatesAutoresizingMaskIntoConstraints = false

        return tableView
    }()

    // MARK: - Initializers

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemGray6
        setupLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Private Methods

    private func setupLayout() {
        addSubview(loginTableView)
        loginTableView.snp.makeConstraints {
            $0.edges.equalTo(self).inset(UIEdgeInsets(top: 0,
                                                      left: 0,
                                                      bottom: 0,
                                                      right: 0))
        }
    }

}
