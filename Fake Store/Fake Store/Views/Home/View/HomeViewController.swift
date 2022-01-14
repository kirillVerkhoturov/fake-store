//
//  HomeViewController.swift
//  Fake Store
//
//  Created by Anton Sobolev on 12/23/21.
//

import UIKit

class HomeViewController: UIViewController {

    // MARK: - Public Properties

    let homeViewModel: HomeViewModel

    // MARK: - Private Properties

    private lazy var homeView = HomeView()
    private let pageVC = CustomPagingViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil,
                                                    content: [PageContent(title: "Payday Deals!", body: "Get up to 80% discount only on 25-30 May.", buttonTitle: "Get Now"),
                                                             PageContent(title: "Sales!!", body: "Black friday - 80% discount only on 20 May.", buttonTitle: "Want it")])

    // MARK: - Initializers

    init(viewModel: HomeViewModel) {
        self.homeViewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Lifecycle

    override func loadView() {
        view = homeView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        add(childVC: pageVC, to: homeView.pageContainerView)
    }

    // MARK: - Private Methods

    private func add(childVC: UIViewController, to containerView: UIView) {
        addChild(childVC)
        containerView.addSubview(childVC.view)
        childVC.view.frame = containerView.bounds
        childVC.didMove(toParent: self)
    }

}
