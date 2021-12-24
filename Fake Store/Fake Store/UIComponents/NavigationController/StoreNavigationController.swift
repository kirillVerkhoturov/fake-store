//
//  StoreNavigationController.swift
//  Fake Store
//
//  Created by Anton Sobolev on 12/23/21.
//

import UIKit

class StoreNavigationController: UINavigationController {

    // MARK: - Initializers

    init() {
        super.init(nibName: nil, bundle: nil)
        self.setNavBar()
    }
    override init(rootViewController: UIViewController) {
        super.init(rootViewController: rootViewController)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Private methods

    private func setNavBar() {
        // TODO: change arrows

        let navBarAppearence = UINavigationBarAppearance()

        navBarAppearence.configureWithOpaqueBackground()
        navBarAppearence.titleTextAttributes = [.foregroundColor: AppColor.primaryBlack, .font: UIFont.systemFont(ofSize: 16)]

        navBarAppearence.backgroundColor = AppColor.primaryWhite
        //        navBarAppearence.setBackIndicatorImage(<#T##backIndicatorImage: UIImage?##UIImage?#>, transitionMaskImage: <#T##UIImage?#>)
        navBarAppearence.shadowColor = AppColor.primaryWhite

        navigationBar.tintColor = AppColor.primaryBlack
        navigationBar.standardAppearance = navBarAppearence
        navigationBar.scrollEdgeAppearance = navBarAppearence
        navigationBar.isTranslucent = true
    }
    
}


