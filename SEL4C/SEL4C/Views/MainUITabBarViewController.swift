//
//  MainUITabBarViewController.swift
//  SEL4C
//
//  Created by Moisés Adame Aguilar on 07/10/23.
//

import UIKit

class MainUITabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        if(item.title! == "Log Out"){
            UserDefaults.standard.reset()
        }
    }
}
