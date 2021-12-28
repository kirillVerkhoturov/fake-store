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

    // MARK: - Initializers

    init(viewModel: HomeViewModel) {
        self.homeViewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.systemPurple

        homeViewModel.requestCategories()
        homeViewModel.requestProducts()
    }

}
