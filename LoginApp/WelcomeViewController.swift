//
//  WelcomeViewController.swift
//  LoginApp
//
//  Created by Максим Бондаренко on 02.04.2023.
//

import UIKit
import QuartzCore

class WelcomeViewController: UIViewController {

    @IBOutlet var welcomeUserLabel: UILabel!
    
    var welcomeUser: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        welcomeUserLabel.text = welcomeUser
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = view.bounds
        gradientLayer.colors = [
            UIColor.orange.cgColor,
            UIColor.systemMint.cgColor
        ]
        view.layer.insertSublayer(gradientLayer, at: 0)
    }
}
