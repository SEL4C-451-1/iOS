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
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        buttonLogIn.layer.cornerRadius = 35
        buttonLogIn.clipsToBounds = true
        
        buttonSignUp.layer.cornerRadius = 35
        buttonSignUp.clipsToBounds = true
        
        // Do any additional setup after loading the view.
    }
}
