//
//  AppImages.swift
//  Fake Store
//
//  Created by Anton Sobolev on 12/23/21.
//

import UIKit

final class AppImages {

    enum Tabs {
        static let home = UIImage(named: "home.Stroke")
        static let homeFilled = UIImage(named: "home.Filled")

        static let wishlist = UIImage(named: "heart.Stroke")
        static let wishlistFilled = UIImage(named: "heart.Filled")

        static let cart = UIImage(named: "shopping-Cart.Stroke")
        static let cartFilled = UIImage(named: "shopping-Cart.Filled")

        static let profile = UIImage(named: "account.Stroke")
        static let profileFilled = UIImage(named: "account.Filled")
    }

    enum Login {
        static let profile = UIImage(named: "profile.Rounded.Stroke")
        static let lock = UIImage(named: "lock.Stroke")

        static let facebook = UIImage(named: "facebook.circle")
        static let googlePlus = UIImage(named: "googlePlus.circle")
        static let apple = UIImage(named: "apple.circle")
    }

    enum Navigation {
        static let leftArrow = UIImage(named: "left.Arrow")
    }

}
