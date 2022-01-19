//
//  UIAlertControllerInputData.swift
//  Fake Store
//
//  Created by Anton Sobolev on 1/19/22.
//

import Foundation

struct UIAlertControllerInputData {

    let title: String?
    let message: String?
    let buttons: [Button]

    init(title: String? = nil, message: String? = nil,
        buttons: [UIAlertControllerInputData.Button]) {
        self.title = title
        self.message = message
        self.buttons = buttons
    }
}

extension UIAlertControllerInputData {

    struct Button {
        let title: String

        init(title: String) {
            self.title = title
        }
    }
}
