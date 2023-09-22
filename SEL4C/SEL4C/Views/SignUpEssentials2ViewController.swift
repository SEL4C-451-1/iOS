//
//  SignUpEssentials2ViewController.swift
//  SEL4C
//
//  Created by Moisés Adame Aguilar on 20/09/23.
//

import UIKit

class SignUpEssentials2ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    // MARK: Buttons
    @IBOutlet weak var acceptButton: RadioButton!
    @IBOutlet weak var buttonContinue: UIButton!
    
    // MARK: Picker View
    // Grado académico
    let academicoPickerData: [String] = ["Pregrado", "Posgrado", "Educación Continua"]
    @IBOutlet weak var academicoPicker: UIPickerView!
    // Institución
    let institucionPickerData: [String] = ["Tecnológico de Monterrey", "Otros"]
    @IBOutlet weak var institucionPicker: UIPickerView!
    // Disciplina
    let disciplinaPickerData: [String] = ["Ingeniería y Ciencias", "Humanidades y Educación", "Ciencias Sociales", "Ciencias de la Salud", "Arquitectura, Arte y Diseño", "Negocios"]
    @IBOutlet weak var disciplinaPicker: UIPickerView!
    // Género
    let generoPickerData: [String] = ["Masculino", "Femenino", "No binario", "Prefiero no decir"]
    @IBOutlet weak var generoPicker: UIPickerView!
    // Edad
    let edadPickerData: [Int] = Array(1...120)
    @IBOutlet weak var edadPicker: UIPickerView!
    // País
    let paisPickerData: [String] = countries
    @IBOutlet weak var paisPicker: UIPickerView!
    
    // MARK: User Initialization
    var user: User = User(userName: "", email: "", emailRecover: "", password: "")
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // MARK: Initialize Radial Button
        acceptButton.initButton(number: 0)
        
        // MARK: Buttons with border radius
        buttonContinue.layer.cornerRadius = 35
        buttonContinue.clipsToBounds = true
        
        // MARK: Delegation for Picker View
        academicoPicker.delegate = self
        institucionPicker.delegate = self
        disciplinaPicker.delegate = self
        generoPicker.delegate = self
        edadPicker.delegate = self
        paisPicker.delegate = self
    }
    
    // Function that changes the state of the radial button.
    @IBAction func markAsRead(_ sender: Any) {
        acceptButton.isSelected = acceptButton.isSelected ? false : true
    }
    
    // MARK: Picker View Functions
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    // Función que asigna número de filas a los items de los Picker View
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if(pickerView == academicoPicker){
            return academicoPickerData.count
            
        }else if(pickerView == institucionPicker){
            return institucionPickerData.count
            
        }else if(pickerView == disciplinaPicker){
            return disciplinaPickerData.count
            
        }else if(pickerView == generoPicker){
            return generoPickerData.count
            
        }else if(pickerView == generoPicker){
            return generoPickerData.count
            
        }else if(pickerView == edadPicker){
            return edadPickerData.count
            
        }else if(pickerView == paisPicker){
            return paisPickerData.count
            
        }else{
            return 0
        }
    }
    
    // Función que asigna nombres a los items de los Picker View
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if(pickerView == academicoPicker){
            return academicoPickerData[row]
            
        }else if(pickerView == institucionPicker){
            return institucionPickerData[row]
            
        }else if(pickerView == disciplinaPicker){
            return disciplinaPickerData[row]
            
        }else if(pickerView == generoPicker){
            return generoPickerData[row]
            
        }else if(pickerView == edadPicker){
            return String(edadPickerData[row])
            
        }else if(pickerView == paisPicker){
            return paisPickerData[row]
            
        }else{
            return ""
        }
    }
    
    // Función que altera el user según su selección el los Picker View
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if(pickerView == academicoPicker){
            user.academicDegree = academicoPickerData[row]
            
        }else if(pickerView == institucionPicker){
            user.institution = institucionPickerData[row]
            
        }else if(pickerView == disciplinaPicker){
            user.discipline = disciplinaPickerData[row]
            
        }else if(pickerView == generoPicker){
            user.gender = generoPickerData[row]
            
        }else if(pickerView == edadPicker){
            user.age = edadPickerData[row]
            
        }else if(pickerView == paisPicker){
            user.country = paisPickerData[row]
            
        }
    }
    
    @IBAction func continueButton(_ sender: Any) {
        // If terms and conditions are accepted, we go to the next view.
        if acceptButton.isSelected {
            guard let cuestionario = storyboard?.instantiateViewController(withIdentifier: "CuestionarioViewController") as? CuestionarioViewController else {
                return
            }
            cuestionario.user = user
            cuestionario.modalPresentationStyle = .fullScreen
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
