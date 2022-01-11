//
//  LoginTableViewCell.swift
//  Fake Store
//
//  Created by Anton Sobolev on 12/29/21.
//

import UIKit
import SnapKit

class LoginTableViewCell: UITableViewCell {
    
    // MARK: - Private Properties

    private(set) lazy var usernameTextField: LoginTextField = {
        let textField = LoginTextField()
        textField.setLeftImage(with: AppImages.Login.profile!)
        textField.placeholder = "Username"
        textField.text = "johnd"

        return textField
    }()

    private(set) lazy var passwordTextField: LoginTextField = {
        let textField = LoginTextField()
        textField.setLeftImage(with: AppImages.Login.lock!)
        textField.placeholder = "Password"
        textField.isSecureTextEntry = true
        textField.text = "m38rmF$"

        return textField
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
        contentView.addSubview(usernameTextField)
        contentView.addSubview(passwordTextField)

        usernameTextField.snp.makeConstraints {
            $0.top.equalToSuperview().offset(22)
            $0.leading.equalToSuperview().offset(24)
            $0.trailing.equalToSuperview().offset(-24)
            $0.height.equalTo(64)
        }
        passwordTextField.snp.makeConstraints {
            $0.top.equalTo(usernameTextField.snp.bottom).offset(24)
            $0.leading.equalToSuperview().offset(24)
            $0.trailing.equalToSuperview().offset(-24)
            $0.height.equalTo(64)
            $0.bottom.equalToSuperview().offset(-22)
        }
    }

}
