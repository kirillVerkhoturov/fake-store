//
//  PagingCollectionViewCell.swift
//  Fake Store
//
//  Created by Anton Sobolev on 1/14/22.
//

import UIKit
import SnapKit

class PagingCollectionViewCell: UICollectionViewCell {

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

    // MARK: - Initializers

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
        layoutIfNeeded()
        setupCirles()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Public Methods

    func setContent(title: String, body: String, buttonTitle: String) {
        titleLabel.text = title
        bodyLabel.text = body
        actionButton.setTitle(buttonTitle, for: .normal)
    }

    // MARK: - Private Methods

    private func setupLayout() {
        contentView.backgroundColor = AppColor.pageContentOrange
        contentView.layer.cornerRadius = 8
        contentView.clipsToBounds = true

        contentView.addSubview(titleLabel)
        contentView.addSubview(bodyLabel)
        contentView.addSubview(actionButton)
        contentView.addSubview(orangeCircleView)
        contentView.addSubview(blueCircleView)
        contentView.addSubview(imageContent)

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

    private func setupCirles() {
        orangeCircleView.layer.cornerRadius = orangeCircleView.frame.size.height / 2
        blueCircleView.layer.cornerRadius = blueCircleView.frame.size.height / 2
    }
    
}
