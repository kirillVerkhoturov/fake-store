//
//  SignInTableViewCell.swift
//  Fake Store
//
//  Created by Anton Sobolev on 12/29/21.
//

import UIKit
import SnapKit

class SignInTableViewCell: UITableViewCell {

    // MARK: - Private Properties

    private lazy var forgotLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = AppColor.primaryBlack
        label.textAlignment = .center
        label.text = "Forgot password?"
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }()

    private(set) lazy var loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.layer.cornerRadius = 20
        button.backgroundColor = AppColor.mainPurple
        button.setTitleColor(AppColor.primaryWhite, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        button.setTitle("Login", for: .normal)

        return button
    }()


    // MARK: - Initializers

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = AppColor.loginWhite
        selectionStyle = .none
        setup()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Private Methods

    private func setup() {
        contentView.addSubview(forgotLabel)
        contentView.addSubview(loginButton)

        forgotLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(11)
            $0.leading.equalToSuperview().offset(24)
            $0.trailing.equalToSuperview().offset(-24)
            $0.height.equalTo(22)
        }
        loginButton.snp.makeConstraints {
            $0.top.equalTo(forgotLabel.snp.bottom).offset(24)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(64)
            $0.width.equalTo(366)
            $0.bottom.equalToSuperview().offset(-11)
        }
    }

}
