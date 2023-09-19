//
//  ViewController.swift
//  SEL4C
//
//  Created by Moisés Adame Aguilar on 27/08/23.
//

import UIKit

class ResultadosViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func terminar(_ sender: Any) {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "ActividadesViewController") as? ActividadesViewController else {
            print("Failed")
            return
        }
        present(vc, animated: true)
    }
    

}

