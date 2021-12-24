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
    
    func makeHomeViewModel() -> HomeViewModel {
        HomeViewModel()
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
