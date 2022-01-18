//
//  UICollectionViewCell+Ext.swift
//  Fake Store
//
//  Created by Anton Sobolev on 1/17/22.
//

import UIKit

extension UICollectionViewCell {

    static var reuseIdentifier: String {
        return NSStringFromClass(self)
    }
}
