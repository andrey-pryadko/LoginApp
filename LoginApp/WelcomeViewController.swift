//
//  WelcomeViewController.swift
//  LoginApp
//
//  Created by Andrey Pryadko on 05/11/2022.
//

import UIKit

class WelcomeViewController: UIViewController {

    @IBOutlet var welcomeLabel: UILabel!
    
    var userNameFilled: String!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        welcomeLabel.text = "Welcome, \(userNameFilled ?? "User")"
    }
    

    @IBAction func logoutButtonTapped() {
        dismiss(animated: true)
    }
    
}
