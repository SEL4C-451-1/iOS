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
    
    // MARK: Login credentials
    var token: String = ""
    var tokenIsObtained: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Button Log In Border Radius
        buttonLogIn.setCornerRadius(35)
        
    }
    
    @IBAction func logIn(_ sender: Any) {
        if isNotEmpty(emailTextField) && isNotEmpty(passwordTextField){
            // Preparamos el mensaje de error por si alguno de los campos no es correcto
            var textUserErrors: String = ""
            var errorExists: Bool = false
            
            // El correo no cumple con el regex
            if(!isValidEmail(emailTextField.text!)){
                textUserErrors += "Correo inválido. \n"
                errorExists = true
            }else{
                // Mandar credenciales a API y autenticar usuario
                // Create a centila user for login
                let user = User(userName: "", email: emailTextField.text!, password: passwordTextField.text!)

                Task {
                    do{
                        self.token = try await user.getToken()
                        
                        if(self.token == "") {
                            showErrorAlert("Credenciales inválidas.")
                        }else{
                            UserDefaults.standard.set(self.token, forKey: "token")
                            
                            guard let actividades = storyboard?.instantiateViewController(withIdentifier: "MainTabBar") as? UITabBarController else {
                                return
                            }
                            
                            actividades.modalPresentationStyle = .fullScreen
                            present(actividades, animated: true)
                        }
                    }catch{
                        showErrorAlert("Credenciales inválidas.")
                    }
                }
            }
            
            if(errorExists){
                // Formatemamos texto eliminando el último \n
                textUserErrors = String(textUserErrors.dropLast(2))
                
                showErrorAlert(textUserErrors)
            }
            
        }else{
            showErrorAlert("Alguno de los campos está vacío.")
        }
    }
}
