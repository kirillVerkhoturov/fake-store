//
//  HomeView.swift
//  Fake Store
//
//  Created by Anton Sobolev on 1/12/22.
//

import UIKit
import SnapKit

class HomeView: UIView {
    
    // MARK: - Public Properties

    private(set) var pageContainerView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 8
        view.backgroundColor = .clear
        view.clipsToBounds = true
        return view
    }()

    // MARK: - Initializers

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemPurple
        setupLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Private Methods

    private func setupLayout() {
        addSubview(pageContainerView)

        pageContainerView.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide).offset(32)
            $0.leading.equalToSuperview().offset(24)
            $0.trailing.equalToSuperview().offset(-24)
            $0.height.equalTo(194)
        }
    }
}
