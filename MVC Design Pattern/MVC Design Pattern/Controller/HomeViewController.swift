//
//  HomeViewController.swift
//  MVC Design Pattern
//
//  Created by Abhishek Bhardwaj on 02/11/23.
//

import UIKit

class HomeViewController: UIViewController {
    var user: User!
    @IBOutlet weak var welcomeLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        user = NetworkService.shared.getLoggedInUser()
        welcomeUser()
    }
    private func welcomeUser() {
        welcomeLabel.text = "Hello, \(user.firstName) \(user.lastName)"
    }

}
