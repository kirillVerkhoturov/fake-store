//
//  ModuleFactory.swift
//  Fake Store
//
//  Created by Anton Sobolev on 12/24/21.
//

import Foundation

protocol ModuleFactoryProtocol: AnyObject {

    func makeHomeModule() -> HomeViewController
    func makeWishlistModule() -> WishlistViewController
    func makeCartModule() -> CartViewController
    func makeProfileModule() -> ProfileViewController
}

final class ModuleFactory: ModuleFactoryProtocol {
    func makeHomeModule() -> HomeViewController {
        HomeViewController(/*viewModel: HomeViewModel()*/)
    }

    func makeWishlistModule() -> WishlistViewController {
        WishlistViewController(/*viewModel: WishlistViewModel()*/)
    }

    func makeCartModule() -> CartViewController {
        CartViewController(/*viewModel: CartViewModel()*/)
    }

    func makeProfileModule() -> ProfileViewController {
        ProfileViewController(/*viewModel: ProfileViewModel()*/)
    }

}

