//
//  SignUpEssentialsViewController.swift
//  SEL4C
//
//  Created by Moisés Adame Aguilar on 27/08/23.
//

import UIKit

class SignUpEssentialsViewController: UIViewController {
    // MARK: Buttons
    @IBOutlet weak var buttonContinue: UIButton!
    
    // MARK: Text Fields
    @IBOutlet weak var usuarioTextField: UITextField!
    @IBOutlet weak var correoTextField: UITextField!
    @IBOutlet weak var contrasenaTextField: UITextField!
    @IBOutlet weak var contrasenaRecuperacionTextField: UITextField!
    
    // MARK: User Initialization
    var user: User = User(userName: "", email: "", password: "")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // MARK: Buttons with border radius
        buttonContinue.setCornerRadius(35)
        
    }
    
    // Prepare view for segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let signUpEssentisals2 = segue.destination as? SignUpEssentials2ViewController else {
            return
        }
        
        signUpEssentisals2.user = user
    }
    
    // Función que checa los campos y determina si poder pasar a la próxima view
    @IBAction func continueButton(_ sender: Any) {
        if isNotEmpty(usuarioTextField) && isNotEmpty(correoTextField) && isNotEmpty(contrasenaTextField) && isNotEmpty(contrasenaRecuperacionTextField){
            
            // Preparamos el mensaje de error por si alguno de los campos no es correcto
            var textUserErrors: String = ""
            var errorExists: Bool = false
            
            // El correo no cumple con el regex
            if(!isValidEmail(correoTextField.text!)){
                textUserErrors += "Correo inválido. \n"
                errorExists = true
            }
            
            // Las contraseñas no ciionciden
            if(contrasenaTextField.text! != contrasenaRecuperacionTextField.text!){
                textUserErrors += "Las contraseñas no coinciden. \n"
                errorExists = true
            }
            
            // Mostramos alerta.
            if(errorExists){
                // Formatemamos texto eliminando el último \n
                textUserErrors = String(textUserErrors.dropLast(2))
                showErrorAlert(textUserErrors)
                
            }else{
                user.userName = usuarioTextField.text!
                user.email = correoTextField.text!
                user.password = contrasenaTextField.text!
                var showAlert: Bool = false
                
                Task {
                    do {
                        try await showAlert = user.create()
                    }catch{
                        showAlert = true
                    }
                }
                
                if(showAlert) {
                    showErrorAlert("Error al crear usuario")
                }
            }
            
        } else {
            showErrorAlert("Alguno de los campos está vacío.")
        }
    }
}
