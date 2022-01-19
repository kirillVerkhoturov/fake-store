//
//  UIAlertViewController+Init.swift
//  Fake Store
//
//  Created by Anton Sobolev on 1/19/22.
//

import UIKit

extension UIAlertController {

    convenience init(inputData: UIAlertControllerInputData) {
        self.init(title: inputData.title, message: inputData.message, preferredStyle: .alert)
        inputData.buttons
            .map { button in UIAlertAction(title: button.title, style: .default) }
            .forEach { self.addAction($0) }
    }

}
