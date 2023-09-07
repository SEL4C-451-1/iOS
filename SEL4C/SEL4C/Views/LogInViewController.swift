//
//  LogInViewController.swift
//  SEL4C
//
//  Created by Moisés Adame Aguilar on 27/08/23.
//

import UIKit

class LogInViewController: UIViewController {
    @IBOutlet weak var buttonLogIn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buttonLogIn.layer.cornerRadius = 35
        buttonLogIn.clipsToBounds = true
        
    }
}
