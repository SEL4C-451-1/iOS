//
//  ActividadTerminadaViewController.swift
//  SEL4C
//
//  Created by Esther Ramírez on 30/09/23.
//

import UIKit

class ActividadTerminadaViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func siguiente(_ sender: Any) {
        let actividadVC = storyboard?.instantiateViewController(withIdentifier: "ActividadesViewController") as? ActividadesViewController

        present(actividadVC!, animated: true)
    }
    
   
}
