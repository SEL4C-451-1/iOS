//
//  LogInSignUpViewController.swift
//  SEL4C
//
//  Created by Moisés Adame Aguilar on 27/08/23.
//

import UIKit

class LogInSignUpViewController: UIViewController {
    // MARK: Buttons
    @IBOutlet weak var buttonLogIn: UIButton!
    @IBOutlet weak var buttonSignUp: UIButton!
    
    // MARK: Log in
    var token: String = ""
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if(UserDefaults.standard.string(forKey: "token") != nil){
            // Navegar a HomeScreen
            let actividadesVC = self.storyboard?
                .instantiateViewController(withIdentifier: "MainUITabBarViewController")
                as! MainUITabBarViewController
            
            self.navigationController?.pushViewController(actividadesVC, animated: true)
        }
        
        
        // Hide Tab Bar
        tabBarController?.tabBar.isHidden = true
        
        // Buttons Border Radius
        buttonLogIn.setCornerRadius(35)
        buttonSignUp.setCornerRadius(35)
        
    }
}
