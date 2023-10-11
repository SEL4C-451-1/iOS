//
//  UpdateMyProfileViewController.swift
//  SEL4C
//
//  Created by Moisés Adame Aguilar on 07/10/23.
//

import UIKit

class UpdateMyProfileViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate, UITextFieldDelegate {
    
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
    var userInfo: UserInfo = UserInfo()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.hideKeyboardWhenTappedAround()

        // Delegation for Picker View
        academicoPicker.delegate = self
        institucionPicker.delegate = self
        disciplinaPicker.delegate = self
        generoPicker.delegate = self
        edadPicker.delegate = self
        paisPicker.delegate = self
        
        // Delegation for Text Field
        userNameLabel.delegate = self
        
        // Set the previously selected picks
        academicoPicker.selectRow(academicoPickerData.firstIndex(of: userInfo.academic_degree)!, inComponent: 0, animated: false)
        institucionPicker.selectRow(institucionPickerData.firstIndex(of: userInfo.institution)!, inComponent: 0, animated: false)
        disciplinaPicker.selectRow(disciplinaPickerData.firstIndex(of: userInfo.discipline)!, inComponent: 0, animated: false)
        generoPicker.selectRow(generoPickerData.firstIndex(of: userInfo.gender)!, inComponent: 0, animated: false)
        edadPicker.selectRow(edadPickerData.firstIndex(of: userInfo.age)!, inComponent: 0, animated: false)
        paisPicker.selectRow(paisPickerData.firstIndex(of: userInfo.country)!, inComponent: 0, animated: false)
        
        // Initialize UITextField's placeholder as the User Name
        userNameLabel.placeholder = userInfo.full_name
        
        // Border radius in PickerViews
        academicoPicker.setCornerRadius(7.5)
        institucionPicker.setCornerRadius(7.5)
        disciplinaPicker.setCornerRadius(7.5)
        academicoPicker.setCornerRadius(7.5)
        generoPicker.setCornerRadius(7.5)
        edadPicker.setCornerRadius(7.5)
        paisPicker.setCornerRadius(7.5)
        
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
            userInfo.academic_degree = academicoPickerData[row]
            
        }else if(pickerView == institucionPicker){
            userInfo.institution = institucionPickerData[row]
            
        }else if(pickerView == disciplinaPicker){
            userInfo.discipline = disciplinaPickerData[row]
            
        }else if(pickerView == generoPicker){
            userInfo.gender = generoPickerData[row]
            
        }else if(pickerView == edadPicker){
            userInfo.age = edadPickerData[row]
            
        }else if(pickerView == paisPicker){
            userInfo.country = paisPickerData[row]
            
        }
    }
    
    // Función que altera el user según su edición en userNameLabel
    func textFieldDidEndEditing(_ textField: UITextField) {
        userInfo.full_name = userNameLabel.text!
    }
    
    @IBAction func cofirmChanges(_ sender: Any) {
        Task {
            do {
                try await userInfo.putInfo()
                
                guard let profileVC = storyboard?.instantiateViewController(withIdentifier: "MainUITabBarViewController") as? MainUITabBarViewController else {
                    return
                }
                
                profileVC.modalPresentationStyle = .fullScreen
                present(profileVC, animated: true)
            }catch{
                showErrorAlert("Error actualizando usuario.")
            }
        }
    }
}
