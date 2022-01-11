//
//  StoreTabBarController.swift
//  Fake Store
//
//  Created by Anton Sobolev on 12/23/21.
//

import UIKit

class StoreTabBarController: UITabBarController {

    // MARK: - Private Properties

    private let moduleFactory: ModuleFactoryProtocol
    private var isLogin: Bool = false

    // MARK: - Initializers

    init(moduleFactory: ModuleFactoryProtocol) {
        self.moduleFactory = moduleFactory
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        UITabBar.appearance().barTintColor = AppColor.primaryWhite
        UITabBar.appearance().unselectedItemTintColor = AppColor.primaryBlack40
        UITabBar.appearance().tintColor = AppColor.mainPurple
        UITabBar.appearance().backgroundColor = AppColor.primaryWhite

        initializeTabBar()
    }

    // MARK: - Private methods

    private func initializeTabBar() {
        let homeViewController = moduleFactory.makeHomeModule()
        let homeNavigationController = StoreNavigationController(rootViewController: homeViewController)
        homeNavigationController.tabBarItem = UITabBarItem(title: "Home", image: AppImages.Tabs.home, selectedImage: AppImages.Tabs.homeFilled)

        let wishlistViewController = moduleFactory.makeWishlistModule()
        let wishlistNavigationController = StoreNavigationController(rootViewController: wishlistViewController)
        wishlistNavigationController.tabBarItem = UITabBarItem(title: "Wishlist", image: AppImages.Tabs.wishlist, selectedImage: AppImages.Tabs.wishlistFilled)

        let cartViewController = moduleFactory.makeCartModule()
        let cartNavigationController = StoreNavigationController(rootViewController: cartViewController)
        cartNavigationController.tabBarItem = UITabBarItem(title: "Cart", image: AppImages.Tabs.cart, selectedImage: AppImages.Tabs.cartFilled)

        let loginViewController = moduleFactory.makeLoginModule()
        let profilelistViewController = moduleFactory.makeProfileModule()

        // TODO: Uncomment when the token/id repository will be ready
//        isLogin = loginViewController.loginViewModel.checkLoginStatus()

        loginViewController.loginViewModel.isLogin = { [weak self] login in
            self?.isLogin = login
            self?.initializeTabBar()
        }
        var profileNavigationController = StoreNavigationController(rootViewController: loginViewController)

        if isLogin {
            profileNavigationController = StoreNavigationController(rootViewController: profilelistViewController)
        }

        profileNavigationController.tabBarItem = UITabBarItem(title: "Profile", image: AppImages.Tabs.profile, selectedImage: AppImages.Tabs.profileFilled)

        viewControllers =  [homeNavigationController,
                            wishlistNavigationController,
                            cartNavigationController,
                            profileNavigationController]
    }

}
