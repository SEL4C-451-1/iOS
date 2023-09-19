//
//  SignUpEssentialsViewController.swift
//  SEL4C
//
//  Created by Moisés Adame Aguilar on 27/08/23.
//

import UIKit

class SignUpEssentialsViewController: UIViewController {
    @IBOutlet weak var buttonContinue: UIButton!
    
    @IBOutlet weak var acceptButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        buttonContinue.layer.cornerRadius = 35
        buttonContinue.clipsToBounds = true
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func acceptAction(_ sender: UIButton) {
        if sender.tag == 1 {
            acceptButton.isSelected = true
        }
    }
    
    @IBAction func avanzarCuestionario(_ sender: Any) {
        let accepted = acceptButton
        
        if accepted!.isSelected {
            
            guard let cuestionario = storyboard?.instantiateViewController(withIdentifier: "CuestionarioViewController") as? CuestionarioViewController else {
                print("Failed")
                return
            }
            present(cuestionario, animated: true)
            
        } else {
            let alertController = UIAlertController(
                title: "Error",
                message: "Es necesario aceptar el aviso de privacidad.",
                preferredStyle: .alert
            )
            let ok = UIAlertAction(
                title: "Salir.",
                style: .default
            )

            alertController.addAction(ok)

            present(alertController, animated: true, completion: nil)
        }
    }
}
