//
//  TextFieldProcessingForViewController.swift
//  SEL4C
//
//  Created by Moisés Adame Aguilar on 22/09/23.
//

import Foundation
import UIKit

extension UIViewController {
    // Función que checa si email es válido.
    func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
    
    // Función que checa si Text Field no está vacío
    func isNotEmpty(_ field: UITextField) -> Bool {
        return !field.text!.isEmpty
    }
    
    // Función que genera una alerta
    func showErrorAlert(_ message: String){
        let alertController = UIAlertController(
            title: "Error",
            message: message,
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
