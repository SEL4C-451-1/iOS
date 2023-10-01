//
//  LogInViewController.swift
//  SEL4C
//
//  Created by Moisés Adame Aguilar on 27/08/23.
//

import UIKit

class LogInViewController: UIViewController {
    // MARK: Buttons
    @IBOutlet weak var buttonLogIn: UIButton!
    
    // MARK: Text Fields
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Button Log In Border Radius
        buttonLogIn.setCornerRadius(35)
        
    }
    
    @IBAction func logIn(_ sender: Any) {
        if isNotEmpty(emailTextField) && isNotEmpty(passwordTextField) || true {
            // Preparamos el mensaje de error por si alguno de los campos no es correcto
            var textUserErrors: String = ""
            var errorExists: Bool = false
            
            // El correo no cumple con el regex
            if(!isValidEmail(emailTextField.text!) && false ){
                textUserErrors += "Correo inválido. \n"
                errorExists = true
            }else{
                // TODO: Mandar credenciales a API y autenticar usuario
                print("Proceso de Autenticación")
            }
            
            if(errorExists){
                // Formatemamos texto eliminando el último \n
                textUserErrors = String(textUserErrors.dropLast(2))
                
                showErrorAlert(textUserErrors)
            }else{
                guard storyboard?.instantiateViewController(withIdentifier: "ActividadesViewController") is ActividadesViewController else {
                    return
                }
            }
            
        }else{
            showErrorAlert("Alguno de los campos está vacío.")
        }
    }
}
