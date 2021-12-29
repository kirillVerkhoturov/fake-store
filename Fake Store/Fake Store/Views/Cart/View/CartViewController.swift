//
//  CartViewController.swift
//  Fake Store
//
//  Created by Anton Sobolev on 12/23/21.
//

import UIKit

class CartViewController: UIViewController {

    // MARK: - Public Properties

    let cartViewModel: CartViewModel

    // MARK: - Initializers

    init(viewModel: CartViewModel) {
        self.cartViewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.systemRed
    }

}
