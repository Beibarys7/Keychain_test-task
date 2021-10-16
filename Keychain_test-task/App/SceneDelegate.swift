//
//  SceneDelegate.swift
//  Keychain_test-task
//
//  Created by Beibarys Shaggy on 15.10.2021.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc: UIViewController
        
        if Singleton.shared.getValue(forKey: .isUserLogin) == nil {
            vc = storyboard.instantiateViewController(withIdentifier: "LoginViewController")
        } else {
            vc = storyboard.instantiateViewController(withIdentifier: "MainViewController")
        }
        
        let nav = UINavigationController(rootViewController: vc)
        window.rootViewController = nav
        self.window = window
        window.makeKeyAndVisible()
    }
}
