//
//  ViewController.swift
//  LoginApp
//
//  Created by Andrey Pryadko on 05/11/2022.
//


import UIKit

class LoginViewController: UIViewController {
    
// MARK: - IB Outlets

    @IBOutlet var userNameTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    
    private let password = "12345"
    private let username = "John"

    
// MARK: - override methods
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let welcomeVC = segue.destination as? WelcomeViewController else { return }
        welcomeVC.userNameFilled = username
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    
// MARK: - IB Actions

    @IBAction func loginButtonTapped() {
        if userNameTextField.text != username
            || passwordTextField.text != password {
            showAlert(title: "Invalid login or password",
                      message: "Please, enter correct login and password",
                      textField: passwordTextField)
  
        } else {
            performSegue(withIdentifier: "openWelcomeVC", sender: nil)
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
}


// MARK: - showAlert

extension LoginViewController {
    private func showAlert(title: String, message: String, textField: UITextField? = nil) {
        let newAlert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okButton = UIAlertAction(title: "OK", style: .default) { _ in
            textField?.text = ""
        }
        
        newAlert.addAction(okButton)
        present(newAlert, animated: true)
    }
}
