//
//  LoginTextField.swift
//  Fake Store
//
//  Created by Anton Sobolev on 12/29/21.
//

import UIKit

class LoginTextField: UITextField {

    // MARK: - Private Properties

    private let textPadding = UIEdgeInsets(top: 0, left: 64, bottom: 0, right: 5)
//    private let imagePadding = UIEdgeInsets(top: 21, left: 25, bottom: 21, right: 320)

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Public Methods

    func setLeftImage(with image: UIImage) {
        let imageView = UIImageView(frame: CGRect(x: 25, y: 0, width: 22, height: 22))
        imageView.image = image
        let imageContainerView: UIView = UIView(frame: CGRect(x: 25, y: 0, width: 47, height: 22))
        imageContainerView.addSubview(imageView)
        leftView = imageContainerView
        tintColor = AppColor.primaryBlack30

    }

    // MARK: - Private methods

    private func setup() {
        layer.cornerRadius = 20

        textColor = AppColor.primaryBlack
        textAlignment = .left
        font = UIFont.systemFont(ofSize: 16)
        backgroundColor = AppColor.primaryWhite

        autocorrectionType = .no
        returnKeyType = .go
        leftViewMode = .always

        translatesAutoresizingMaskIntoConstraints = false
    }

    override func textRect(forBounds bounds: CGRect) -> CGRect {
        bounds.inset(by: textPadding)
    }
    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        bounds.inset(by: textPadding)
    }
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        bounds.inset(by: textPadding)
    }
//    override func leftViewRect(forBounds bounds: CGRect) -> CGRect {
//        bounds.inset(by: imagePadding)
//    }

}
