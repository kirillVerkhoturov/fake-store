//
//  UITableView+Ext.swift
//  Fake Store
//
//  Created by Anton Sobolev on 1/10/22.
//

import UIKit

extension UITableView {

    func updateHeaderFooterHeight(for view: UIView) -> CGFloat {
        let height = view.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize).height
        if view.frame.size.height != height {
            return height
        } else {
            return view.frame.size.height
        }
    }

    func register<T: UITableViewCell>(cellClass: T.Type) {
        register(cellClass, forCellReuseIdentifier: cellClass.reuseIdentifier)
    }

    func dequeue<T: UITableViewCell>(cellClass: T.Type) -> T? {
        return dequeueReusableCell(withIdentifier: cellClass.reuseIdentifier) as? T
    }

    func dequeue<T: UITableViewCell>(cellClass: T.Type, forIndexPath indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(
            withIdentifier: cellClass.reuseIdentifier, for: indexPath) as? T else {
                fatalError(
                    "Error: cell with id: \(cellClass.reuseIdentifier) for indexPath: \(indexPath) is not \(T.self)")
            }
        return cell
    }
}
