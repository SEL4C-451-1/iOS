//
//  UpdateMyProfileViewController.swift
//  SEL4C
//
//  Created by Moisés Adame Aguilar on 07/10/23.
//

import UIKit

class UpdateMyProfileViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    // MARK: Text Field
    @IBOutlet weak var userNameLabel: UITextField!
    
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
    let edadPickerData: [Int] = Array(15...120)
    @IBOutlet weak var edadPicker: UIPickerView!
    
    // País
    let paisPickerData: [String] = countries
    @IBOutlet weak var paisPicker: UIPickerView!
    
    // MARK: User Initialization
    var user: User = User(userName: "", email: "", password: "")
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Delegation for Picker View
        academicoPicker.delegate = self
        institucionPicker.delegate = self
        disciplinaPicker.delegate = self
        generoPicker.delegate = self
        edadPicker.delegate = self
        paisPicker.delegate = self
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
    
}
