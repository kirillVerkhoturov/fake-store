//
//  PageContentView.swift
//  Fake Store
//
//  Created by Anton Sobolev on 1/18/22.
//

import UIKit
import SnapKit

class PageContentView: UIView {

    // MARK: - Public Properties

    var onActionButtonDidTap: ((Int) -> Void)?

    // MARK: - Private Properties

    private(set) lazy var collectionPage: PageCollectionView = {
        let layout = PagingFlowLayout()
        let collection = PageCollectionView(frame: self.bounds, collectionViewLayout: layout)
        collection.showsVerticalScrollIndicator = false
        collection.showsHorizontalScrollIndicator = false
        collection.translatesAutoresizingMaskIntoConstraints = false

        return collection
    }()

    private(set) var pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.pageIndicatorTintColor = AppColor.primaryBlack40
        pageControl.currentPageIndicatorTintColor = AppColor.primaryWhite
        pageControl.translatesAutoresizingMaskIntoConstraints = false

        return pageControl
    }()

    private var countOfPages: Int = 0

    // MARK: - Initializers

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
        setupBindigs()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Public Methods

    func setContent(with content: [PageContent]) {
        collectionPage.setContent(with: content)
        countOfPages = content.count
        pageControl.numberOfPages = countOfPages
    }

    // MARK: - Private Methods

    private func setupLayout() {
        addSubview(collectionPage)
        addSubview(pageControl)

        collectionPage.snp.makeConstraints {
            $0.edges.equalTo(self).inset(UIEdgeInsets(top: 0,
                                                      left: 0,
                                                      bottom: 0,
                                                      right: 0))
        }
        pageControl.snp.makeConstraints {
            $0.top.equalToSuperview().offset(164).priority(.low)
            $0.leading.equalToSuperview().offset(24)
            $0.bottom.equalToSuperview().offset(-24)
        }
    }

    private func setupBindigs() {
        collectionPage.onActionButtonDidTap = { [unowned self] id in
            self.onActionButtonDidTap?(id)
        }
        collectionPage.onPositionChanged = { [weak self] xPosition in
            guard let self = self else { return }
            if xPosition != 0.0, self.frame.width != 0.0 {
                let scrollPos = Double(xPosition / self.frame.width).rounded()
                self.pageControl.currentPage = Int(scrollPos)
            }
        }
    }

}
