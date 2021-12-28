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

    // MARK: - Private Properties

    private let viewModelFactory: ViewModelFactoryProtocol

    // MARK: - Initializers

    init(viewModelFactory: ViewModelFactoryProtocol) {
        self.viewModelFactory = viewModelFactory
    }

    // MARK: - Public Methods
    
    func makeHomeModule() -> HomeViewController {
        HomeViewController(viewModel: viewModelFactory.makeHomeViewModel())
    }

    func makeWishlistModule() -> WishlistViewController {
        WishlistViewController(/*viewModel: viewModelFactory.makeWishlistViewModel()*/)
    }

    func makeCartModule() -> CartViewController {
        CartViewController(/*viewModel: viewModelFactory.makeCartViewModel()*/)
    }

    func makeProfileModule() -> ProfileViewController {
        ProfileViewController(/*viewModel: viewModelFactory.makeProfileViewModel()*/)
    }

}

