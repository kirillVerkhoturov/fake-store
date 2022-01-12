//
//  LoginTableHeaderView.swift
//  Fake Store
//
//  Created by Anton Sobolev on 12/30/21.
//

import UIKit
import SnapKit

class LoginTableHeaderView: UIView {

    // MARK: - Private Properties

    private let avatarImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "avatarPlaceholder")
        imageView.translatesAutoresizingMaskIntoConstraints = false

        return imageView
    }()

    private let loginLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20)
        label.textColor = AppColor.primaryBlack
        label.text = "Login to Shop"
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }()

    // MARK: - Initializers

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Private Methods

    private func setupLayout() {
        addSubview(avatarImageView)
        addSubview(loginLabel)

        avatarImageView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(36)
            $0.centerX.equalToSuperview()
        }
        loginLabel.snp.makeConstraints {
            $0.top.equalTo(avatarImageView.snp.bottom).offset(64)
            $0.centerX.equalToSuperview()
            $0.bottom.equalToSuperview().offset(-11)
        }
    }

}
