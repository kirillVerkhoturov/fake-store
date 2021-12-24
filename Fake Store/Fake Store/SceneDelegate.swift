//
//  SceneDelegate.swift
//  Fake Store
//
//  Created by Kirill Verkhoturov on 20.12.2021.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        runUI()
    }

    private func runUI() {
        let viewModelFactory = ViewModelFactory()
        let moduleFactory = ModuleFactory(viewModelFactory: viewModelFactory)
        window?.rootViewController = StoreTabBarController(moduleFactory: moduleFactory)
        window?.makeKeyAndVisible()
    }

}

