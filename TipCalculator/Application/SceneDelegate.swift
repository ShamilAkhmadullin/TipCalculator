//
//  SceneDelegate.swift
//  TipCalculator
//
//  Created by Shamil on 24/8/2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    // MARK: - Properties

    var window: UIWindow?
    
    // MARK: - Scene session lifecycle

    func scene(_ scene: UIScene,
               willConnectTo session: UISceneSession,
               options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)
        let viewController = CalculatorViewController()
        window.rootViewController = viewController
        self.window = window
        window.makeKeyAndVisible()
    }
}
