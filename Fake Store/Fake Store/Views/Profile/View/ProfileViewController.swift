//
//  ProfileViewController.swift
//  Fake Store
//
//  Created by Anton Sobolev on 12/23/21.
//

import UIKit

class ProfileViewController: UIViewController {

    // MARK: - Public Properties

    let profileViewModel: ProfileViewModel

    // MARK: - Initializers

    init(viewModel: ProfileViewModel) {
        self.profileViewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.systemBlue
    }

}
