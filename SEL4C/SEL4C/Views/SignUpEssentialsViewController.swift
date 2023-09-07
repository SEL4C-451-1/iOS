//
//  SignUpEssentialsViewController.swift
//  SEL4C
//
//  Created by Moisés Adame Aguilar on 27/08/23.
//

import UIKit

class SignUpEssentialsViewController: UIViewController {
    @IBOutlet weak var buttonContinue: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buttonContinue.layer.cornerRadius = 35
        buttonContinue.clipsToBounds = true

        // Do any additional setup after loading the view.
    }
}
