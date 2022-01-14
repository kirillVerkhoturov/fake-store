//
//  PageContentView.swift
//  Fake Store
//
//  Created by Anton Sobolev on 1/12/22.
//

import UIKit
import SnapKit

class PageContentView: UIView {

    // MARK: - Public Properties

    var onButtonDidTap: (() -> Void)?

    // MARK: - Private Properties

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        label.textColor = AppColor.primaryWhite
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }()

    private let bodyLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = AppColor.primaryWhite
        label.textAlignment = .left
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }()

    private(set) var actionButton: UIButton = {
        let button = UIButton(type: .system)
        button.layer.cornerRadius = 4
        button.backgroundColor = AppColor.primaryWhite
        button.setTitleColor(AppColor.mainPurple, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        button.addTarget(self, action: #selector(buttonDidTap), for: .touchUpInside)

        return button
    }()

    private let orangeCircleView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = AppColor.primaryWhite.withAlphaComponent(0.3)

        return view
    }()
    private let blueCircleView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = AppColor.mainBlue

        return view
    }()

    private let imageContent: UIImageView = {
        let imageView = UIImageView()
        imageView.image = AppImages.InAppImages.bottles
        imageView.translatesAutoresizingMaskIntoConstraints = false

        return imageView
    }()

    @objc private func buttonDidTap() {
        onButtonDidTap?()
    }

    // MARK: - Initializers

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = AppColor.pageContentOrange
        clipsToBounds = true
        setupLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        setupCirles()
    }

    // MARK: - Public Methods

    func setContent(title: String, body: String, buttonTitle: String) {
        titleLabel.text = title
        bodyLabel.text = body
        actionButton.setTitle(buttonTitle, for: .normal)
    }

    // MARK: - Private Methods

    private func setupCirles() {
        orangeCircleView.layer.cornerRadius = orangeCircleView.frame.size.height / 2
        blueCircleView.layer.cornerRadius = blueCircleView.frame.size.height / 2
    }

    private func setupLayout() {
        addSubview(titleLabel)
        addSubview(bodyLabel)
        addSubview(actionButton)
        addSubview(orangeCircleView)
        addSubview(blueCircleView)
        addSubview(imageContent)

        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(24)
            $0.leading.equalToSuperview().offset(24)
        }
        bodyLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(8)
            $0.leading.equalTo(titleLabel.snp.leading)
            $0.width.equalTo(194)
        }
        actionButton.snp.makeConstraints {
            $0.top.equalTo(bodyLabel.snp.bottom).offset(16)
            $0.leading.equalToSuperview().offset(24)
            $0.width.equalTo(72)
        }
        orangeCircleView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(45)
            $0.trailing.equalToSuperview().offset(30)
            $0.height.equalTo(180)
            $0.width.equalTo(180)
        }
        blueCircleView.snp.makeConstraints {
            $0.centerX.equalTo(orangeCircleView.snp.centerX)
            $0.centerY.equalTo(orangeCircleView.snp.centerY)
            $0.height.equalTo(150)
            $0.width.equalTo(150)
        }
        imageContent.snp.makeConstraints {
            $0.top.equalToSuperview().multipliedBy(1.1)
            $0.trailing.equalToSuperview()
        }
    }

}

