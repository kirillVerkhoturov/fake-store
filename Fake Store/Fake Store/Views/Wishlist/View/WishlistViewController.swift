//
//  WishlistViewController.swift
//  Fake Store
//
//  Created by Anton Sobolev on 12/23/21.
//

import UIKit

class WishlistViewController: UIViewController {

    // MARK: - Public Properties

    let wishlistiewModel: WishlistViewModel

    // MARK: - Initializers

    init(viewModel: WishlistViewModel) {
        self.wishlistiewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.systemYellow
    }

}
