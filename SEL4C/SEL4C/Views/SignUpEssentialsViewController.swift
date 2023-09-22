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
    @IBOutlet weak var correoRecuperacionTextField: UITextField!
    @IBOutlet weak var contrasenaTextField: UITextField!
    @IBOutlet weak var contrasenaRecuperacionTextField: UITextField!
    
    // MARK: User Initialization
    var user: User = User(userName: "", email: "", emailRecover: "", password: "")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // MARK: Buttons with border radius
        buttonContinue.layer.cornerRadius = 35
        buttonContinue.clipsToBounds = true
        
    }
    
    // Prepare view for segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let resultVC = segue.destination as? SignUpEssentials2ViewController else {
            return
        }
        
        resultVC.user = user
    }
    
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
    
    // Función que checa los campos y determina si poder pasar a la próxima view
    @IBAction func continueButton(_ sender: Any) {
        if isNotEmpty(usuarioTextField) && isNotEmpty(correoTextField) && isNotEmpty( correoRecuperacionTextField) && isNotEmpty(contrasenaTextField) && isNotEmpty( contrasenaRecuperacionTextField){
            
            // Preparamos el mensaje de error por si alguno de los campos no es correcto
            var textUserErrors: String = ""
            var errorExists: Bool = false
            
            // El correo no cumple con el regex
            if(!isValidEmail(correoTextField.text!)){
                textUserErrors += "Correo inválido. \n"
                errorExists = true
            }
            
            // El correo de recuperación no cumple con el regex
            if(!isValidEmail(correoRecuperacionTextField.text!)){
                textUserErrors += "Correo de recuperación inválido. \n"
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
                user.emailRecover = correoRecuperacionTextField.text!
                user.password = contrasenaTextField.text!
            }
            
        } else {
            showErrorAlert("Alguno de los campos está vacío.")
        }
    }
}
