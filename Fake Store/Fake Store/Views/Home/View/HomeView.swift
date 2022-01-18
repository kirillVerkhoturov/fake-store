//
//  HomeView.swift
//  Fake Store
//
//  Created by Anton Sobolev on 1/14/22.
//

import UIKit
import SnapKit

class HomeView: UIView {
    
    // MARK: - Private Properties

    private(set) var pagingView: PageContentView = {
        let view = PageContentView()
        view.translatesAutoresizingMaskIntoConstraints = false

        return view
    }()
    
    // MARK: - Initializers

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = AppColor.mainPurple
        setupLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Private Methods

    private func setupLayout() {
        addSubview(pagingView)

        pagingView.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide).offset(0)
            $0.leading.equalToSuperview().offset(0)
            $0.trailing.equalToSuperview().offset(0)
            $0.height.equalTo(194)
        }
    }

}

