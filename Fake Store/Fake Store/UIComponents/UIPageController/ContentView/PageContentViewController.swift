//
//  PageContentViewController.swift
//  Fake Store
//
//  Created by Anton Sobolev on 1/12/22.
//

import UIKit

class PageContentViewController: UIViewController {

    // MARK: - Public Properties

    var onButtonDidTap: (() -> Void)?

    // MARK: - Private Properties

    private(set) lazy var discountView = PageContentView()
    private var content: PageContent

    // MARK: - Initializers

    init(content: PageContent) {
        self.content = content
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle

    override func loadView() {
        view = discountView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        discountView.setContent(title: content.title, body: content.body, buttonTitle: content.buttonTitle)
        setupBindigs()
    }

    // MARK: - Private Methods

    private func setupBindigs() {
        discountView.onButtonDidTap = { [unowned self] in
            self.onButtonDidTap?()
        }
    }
}
