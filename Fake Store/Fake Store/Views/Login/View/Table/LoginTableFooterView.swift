//
//  LoginTableFooterView.swift
//  Fake Store
//
//  Created by Anton Sobolev on 12/30/21.
//

import UIKit
import SnapKit

class LoginTableFooterView: UITableViewHeaderFooterView {

    // MARK: - Public Properties

    static let reuseIdentifier = "LoginTableFooterView"

    // MARK: - Private Properties

    private let separateContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = AppColor.loginWhite
        view.translatesAutoresizingMaskIntoConstraints = false

        return view
    }()

    private let separateLineView: UIView = {
        let lineView = UIView()
        lineView.backgroundColor = AppColor.primaryBlack40
        lineView.translatesAutoresizingMaskIntoConstraints = false

        return lineView
    }()
    
    private let separateLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = AppColor.primaryBlack40
        label.backgroundColor = AppColor.loginWhite
        label.tintColor = AppColor.loginWhite
        label.text = " Or "
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }()

    private let facebookImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = AppImages.Login.facebook
        imageView.translatesAutoresizingMaskIntoConstraints = false

        return imageView
    }()
    private let googleImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = AppImages.Login.googlePlus
        imageView.translatesAutoresizingMaskIntoConstraints = false

        return imageView
    }()
    private let appleImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = AppImages.Login.apple
        imageView.translatesAutoresizingMaskIntoConstraints = false

        return imageView
    }()

    private let createAccountLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = AppColor.primaryBlack60
        label.text = "Don't have an account?"
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }()

    private lazy var socialStacView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [facebookImageView, googleImageView, appleImageView])
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .equalSpacing
        stackView.spacing = 9
        stackView.translatesAutoresizingMaskIntoConstraints = false

        return stackView
    }()

    // MARK: - Initializers

    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        setupLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Private Methods

    private func setupLayout() {
        contentView.addSubview(socialStacView)
        contentView.addSubview(createAccountLabel)
        contentView.addSubview(separateContainerView)

        separateContainerView.addSubview(separateLineView)
        separateContainerView.addSubview(separateLabel)
        
        separateContainerView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(6)
            $0.leading.equalToSuperview().offset(24)
            $0.trailing.equalToSuperview().offset(-24)
        }
        separateLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(2)
            $0.bottom.equalToSuperview().offset(-2)
            $0.centerX.equalToSuperview()
        }
        separateLineView.snp.makeConstraints {
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.centerY.equalTo(separateLabel.snp.centerY)
            $0.height.equalTo(1)
        }

        socialStacView.snp.makeConstraints {
            $0.top.equalTo(separateContainerView.snp.bottom).offset(24)
            $0.leading.equalToSuperview().offset(120)
            $0.trailing.equalToSuperview().offset(-120)
        }
        createAccountLabel.snp.makeConstraints {
            $0.top.equalTo(socialStacView.snp.bottom).offset(60)
            $0.centerX.equalToSuperview()
            $0.bottom.equalToSuperview().offset(-38)
        }
    }

}
