//
//  Activity2_1UploadViewController.swift
//  SEL4C
//
//  Created by Esther Ramírez on 28/09/23.
//

import UIKit

class Activity2_1UploadViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate, UITextViewDelegate {

    // MARK: Pickers
    @IBOutlet weak var odsPicker: UIPickerView!
    @IBOutlet weak var goalPicker: UIPickerView!
    var selectedRow: Int = 0
    
    // MARK: Image
    @IBOutlet weak var odsImage: UIImageView!
    
    // MARK: Text View
    @IBOutlet weak var relationTextView: UITextView!
    
    
    // MARK: Data Persistance
    var defaults = UserDefaults.standard
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Initializing delegates
        odsPicker.delegate = self
        goalPicker.delegate = self
        relationTextView.delegate = self
        
        // Check if there is any persisted data, if there is, write it up.
        relationTextView.text = defaults.string(forKey: "relation")
        selectedRow = defaults.integer(forKey: "odsRow")
        odsPicker.selectRow(selectedRow, inComponent: 0, animated: true)
        goalPicker.selectRow(defaults.integer(forKey: "goalRow"), inComponent: 0, animated: true)
        odsImage.image = UIImage(named: ods[selectedRow].imageName)
        
        // Border radius in relationTextView
        relationTextView.setCornerRadius(15)
        
        self.hideKeyboardWhenTappedAround()
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if(pickerView == odsPicker){
            return ods[row].name
        } else{
            return ods[selectedRow].goals[row]
        }
        
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if(pickerView == odsPicker){
            selectedRow = row
            goalPicker.reloadAllComponents()
            odsImage.image = UIImage(named: ods[row].imageName)
            defaults.set(selectedRow, forKey: "odsRow")
        } else{
            defaults.set(row, forKey: "goalRow")
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if(pickerView == odsPicker){
            return ods.count
            
        }else{
            return ods[selectedRow].goals.count
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        defaults.set(textView.text, forKey: "relation")
    }
}
