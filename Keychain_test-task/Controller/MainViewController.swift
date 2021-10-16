//
//  MainViewController.swift
//  Keychain_test-task
//
//  Created by Beibarys Shaggy on 15.10.2021.
//

import UIKit

final class MainViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Main"
    }
    
    @IBAction func logOut(_ sender: UIButton) {
        Singleton.shared.removeValue(forKey: .isUserLogin)
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let loginVC = storyboard.instantiateViewController(withIdentifier: "LoginViewController")
        navigationController?.setViewControllers([loginVC], animated: true)
    }
}
