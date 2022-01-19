//
//  UIViewController+Ext.swift
//  Fake Store
//
//  Created by Anton Sobolev on 1/19/22.
//

import UIKit

extension UIViewController {

    func presentAlert(with data: UIAlertControllerInputData) {
        let alert = UIAlertController(inputData: data)
        DispatchQueue.main.async { [weak self] in
            self?.present(alert, animated: true)
        }
    }
}
