//
//  UITableViewCell+Ext.swift
//  Fake Store
//
//  Created by Anton Sobolev on 1/10/22.
//

import UIKit

extension UITableViewCell {

    static var reuseIdentifier: String {
        return NSStringFromClass(self)
    }
}
