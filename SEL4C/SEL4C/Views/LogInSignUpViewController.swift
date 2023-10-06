//
//  LogInSignUpViewController.swift
//  SEL4C
//
//  Created by Moisés Adame Aguilar on 27/08/23.
//

import UIKit

class LogInSignUpViewController: UIViewController {
    @IBOutlet weak var buttonLogIn: UIButton!
    @IBOutlet weak var buttonSignUp: UIButton!
    
    
    override func viewDidAppear(_ animated: Bool) {
        // Delete user defaults if there was already a token.
        if(UserDefaults.standard.string(forKey: "token") != nil){
            UserDefaults.standard.reset()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Hide Tab Bar
        tabBarController?.tabBar.isHidden = true
        
        // Buttons Border Radius
        buttonLogIn.setCornerRadius(35)
        buttonSignUp.setCornerRadius(35)
    }
}
