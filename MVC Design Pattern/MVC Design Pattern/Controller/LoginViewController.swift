//
//  ViewController.swift
//  MVC Design Pattern
//
//  Created by Abhishek Bhardwaj on 02/11/23.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var loginBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        emailField.addTarget(self, action: #selector(validateFields), for: .editingChanged)
        passwordField.addTarget(self, action: #selector(validateFields), for: .editingChanged)
        loginBtn.isEnabled = false
        
    }
    @objc private func validateFields() {
        loginBtn.isEnabled = emailField.text != "" && passwordField.text != ""
    }
    
    @IBAction func loginBtnPressed(_ sender: UIButton) {
        if let email = emailField.text, let password = passwordField.text {
            NetworkService.shared.login(email: email, password: password) { success in
                if success {
                    self.showHomeViewController()
                }
                else {
                    self.showAlert(title: "Try Again", message: "Email and Password is incorrect.")
                }
            }
        }
    }
    private func showHomeViewController() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let homeViewController = storyboard.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
        self.present(homeViewController, animated: true)
    }
    private func showAlert(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)

                let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)

                alertController.addAction(okAction)

                present(alertController, animated: true, completion: nil)
            }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
}

