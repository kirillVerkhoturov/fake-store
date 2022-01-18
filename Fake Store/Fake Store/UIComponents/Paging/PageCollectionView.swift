//
//  PageCollectionView.swift
//  Fake Store
//
//  Created by Anton Sobolev on 1/14/22.
//

import UIKit

class PageCollectionView: UICollectionView {

    // MARK: - Public Properties

    var onActionButtonDidTap: ((Int) -> Void)?
    var onPositionChanged: ((CGFloat) -> Void)?

    // MARK: - Private Properties

    private var pageContent: [PageContent] = []

    // MARK: - Initializers

    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
        backgroundColor = .clear
        setupCollectionView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Public Methods

    func setContent(with content: [PageContent]) {
        pageContent = content
        reloadData()
    }

    // MARK: - Private Methods

    private func setupCollectionView() {
        delegate = self
        dataSource = self
        register(cellClass: PagingCollectionViewCell.self)
    }

    @objc private func actionButtonDidTap(_ sender: UIButton) {
        let buttonPosition = sender.convert(sender.bounds.origin, to: self)
        guard let indexPath = indexPathForItem(at: buttonPosition) else { return }
        onActionButtonDidTap?(indexPath.row)
    }

}

extension PageCollectionView: UICollectionViewDataSource, UICollectionViewDelegate {

    // MARK: - UICollectionViewDataSource

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        pageContent.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let content = pageContent[indexPath.item]
        let cell = dequeue(cellClass: PagingCollectionViewCell.self, forIndexPath: indexPath)
        cell.setContent(title: content.title, body: content.body, buttonTitle: content.buttonTitle)
        cell.actionButton.addTarget(self, action: #selector(actionButtonDidTap(_:)), for: .touchUpInside)
        return cell
    }

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        onPositionChanged?(scrollView.contentOffset.x)
    }

}
