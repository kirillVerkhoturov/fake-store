//
//  UIPageViewController+Ext.swift
//  Fake Store
//
//  Created by Anton Sobolev on 1/13/22.
//

import UIKit

extension UIPageViewController {
    func getIndex(of viewController: UIViewController?, in controllers: [UIViewController]) -> Int {
        guard let viewController = viewController else { return 0 }
        guard let index = controllers.firstIndex(of: viewController) else { return 0 }
        return index
    }
}
