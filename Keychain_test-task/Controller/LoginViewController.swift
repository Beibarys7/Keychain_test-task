//
//  LoginViewController.swift
//  Keychain_test-task
//
//  Created by Beibarys Shaggy on 15.10.2021.
//

import UIKit

final class LoginViewController: UIViewController {
    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Login"
    }

    @IBAction func signIn(_ sender: UIButton) {
        guard let login = loginTextField.text,
              !login.isEmpty,
              let password = passwordTextField.text,
              !password.isEmpty else {
            let alertVC = UIAlertController(title: "Fill the text fields", message: nil, preferredStyle: .alert)
            let closeAction = UIAlertAction(title: "Close", style: .cancel, handler: nil)
            alertVC.addAction(closeAction)
            present(alertVC, animated: true, completion: nil)
            return
        }
        Singleton.shared.save(true.description, forKey: .isUserLogin)
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let mainVC = storyboard.instantiateViewController(withIdentifier: "MainViewController")
        navigationController?.setViewControllers([mainVC], animated: true)
    }
}

extension LoginViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
        return true
    }
}
