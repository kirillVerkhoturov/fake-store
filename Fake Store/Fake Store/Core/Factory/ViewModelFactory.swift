//
//  ViewModelFactory.swift
//  Fake Store
//
//  Created by Anton Sobolev on 12/24/21.
//

import Foundation

protocol ViewModelFactoryProtocol {
    func makeHomeViewModel() -> HomeViewModel
    func makeWishlistViewModel() -> WishlistViewModel
    func makeCartViewModel() -> CartViewModel
    func makeProfileViewModel() -> ProfileViewModel
}

final class ViewModelFactory: ViewModelFactoryProtocol {

    // MARK: - Private Properties

    private lazy var container = DIContainer()

    // MARK: - Public Methods
    
    func makeHomeViewModel() -> HomeViewModel {
        HomeViewModel(service: container.homeService)
    }

    func makeWishlistViewModel() -> WishlistViewModel {
        WishlistViewModel()
    }

    func makeCartViewModel() -> CartViewModel {
        CartViewModel()
    }

    func makeProfileViewModel() -> ProfileViewModel {
        ProfileViewModel()
    }

}
