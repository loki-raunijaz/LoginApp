//
//  ViewController.swift
//  LoginApp
//
//  Created by Максим Бондаренко on 02.04.2023.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet var usernameTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginButton.layer.cornerRadius = 4
        
        usernameTextField.layer.borderWidth = 0.3
        usernameTextField.layer.cornerRadius = 4
        
        passwordTextField.layer.borderWidth = 0.3
        passwordTextField.layer.cornerRadius = 4
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let welcomeVC = segue.destination as? WelcomeViewController else {
            return
        }
        welcomeVC.welcomeUser = """
            Welcome, \(usernameTextField.text ?? "user")
            \u{1F389}
        """
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        usernameTextField.autocorrectionType = .no
        usernameTextField.smartQuotesType = .no
        
        passwordTextField.autocorrectionType = .no
        passwordTextField.smartQuotesType = .no
        passwordTextField.isSecureTextEntry = true
        
        self.view.endEditing(true)
    }
    
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        usernameTextField.text = ""
        passwordTextField.text = ""
    }
    
    @IBAction func loginButtonTapped() {
        let username = usernameTextField.text ?? ""
        let password = passwordTextField.text ?? ""
        
        if username.isEmpty || password.isEmpty {
            let alert = UIAlertController(
                title: "Error",
                message: "Please enter your username and password",
                preferredStyle: .alert
            )
            let okAction = UIAlertAction(
                title: "OK",
                style: .default,
                handler: nil
            )
            alert.addAction(okAction)
            present(alert, animated: true, completion: nil)
        } else {
            if username == "user" && password == "password" {
                performSegue(withIdentifier: "showWelcomeScreen", sender: self)
            } else {
                let alert = UIAlertController(
                    title: "Error",
                    message: "Incorrect username or password",
                    preferredStyle: .alert
                )
                let okAction = UIAlertAction(
                    title: "OK",
                    style: .default,
                    handler: nil
                )
                alert.addAction(okAction)
                present(alert, animated: true, completion: nil)
            }
        }
    }
    
    @IBAction func userNameButtonTapped() {
        let alert = UIAlertController(
            title: "Username",
            message: "user",
            preferredStyle: .alert
        )
        let okAction = UIAlertAction(title: "OK", style: .default)
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func passwordButtonTapped() {
        let alert = UIAlertController(
            title: "Password",
            message: "password",
            preferredStyle: .alert
        )
        let okAction = UIAlertAction(title: "OK", style: .default)
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }
}
