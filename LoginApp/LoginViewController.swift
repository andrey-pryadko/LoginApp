//
//  ViewController.swift
//  LoginApp
//
//  Created by Andrey Pryadko on 05/11/2022.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet var userNameTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    
    private let password = "12345"
    private let username = "John"
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let welcomeVC = segue.destination as? WelcomeViewController else { return }
        welcomeVC.userNameFilled = userNameTextField.text
        
    }

    @IBAction func loginButtonTapped(_ sender: UIButton) {
        if userNameTextField.text != username
            || passwordTextField.text != password {
            showAlert(title: "Invalid login or password", message: "Please, enter correct login and password")
        }
    }
    
    @IBAction func forgotUserNameButtonTapped() {
        showAlert(title: "Oops!", message: "Your name is \(username)")
    }
    
    @IBAction func forgotPasswordButtonTapped() {
        showAlert(title: "Oops!", message: "Your password is \(password)")
    }
    
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        userNameTextField.text = ""
        passwordTextField.text = ""
    }
    
    private func showAlert(title: String, message: String) {
        let newAlert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okButton = UIAlertAction(title: "OK", style: .default)
        
        newAlert.addAction(okButton)
        self.present(newAlert, animated: true)
    }
    
}

