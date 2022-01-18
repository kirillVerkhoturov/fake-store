//
//  PagingFlowLayout.swift
//  Fake Store
//
//  Created by Anton Sobolev on 1/14/22.
//

import UIKit

class PagingFlowLayout: UICollectionViewFlowLayout {

    // MARK: - Lifecycle

    let padding: CGFloat = 24

    override func prepare() {
        super.prepare()

        guard let collectionView = collectionView else { return }

        let availibleWidth = collectionView.bounds.inset(by: UIEdgeInsets(top: 8, left: padding, bottom: 8, right: padding)).width
        let cellWidth = availibleWidth

        self.sectionInset = UIEdgeInsets(top: 0, left: padding, bottom: 0, right: padding)
        self.itemSize = CGSize(width: cellWidth, height: collectionView.bounds.height)
        self.minimumLineSpacing = padding * 2
        self.scrollDirection = .horizontal
        self.collectionView?.isPagingEnabled = true
    }

}
