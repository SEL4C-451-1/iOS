//
//  Activity2_1UploadViewController.swift
//  SEL4C
//
//  Created by Esther Ramírez on 28/09/23.
//

import UIKit

class Activity2_1UploadViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    
    let odsPickerData: [String] = ["1 Fin de la Pobreza", "2 Hambre Cero", "3 Salud y Bienestar", "4 Educación de Calidad", "5 Igualdad de Genero", "6 Agua Limpia", "7 Energia Asequible y no Contaminante", "8 Trabajo Descente y Crecimiento Económico", "9 Industria Inovación E Infraestructura", "10 Reducción de las Desigualdades", "11 Ciudades y Comunidades Sostenibles", "12 Producción y Consumismo Responsable", "13 Acción por el Clima", "14 Vida Submarina", "15 Vida de Ecosistemas Terrestres", "16 Paz, Justicia e Instituciones Sólidas", "17 Alianzas para Lograr los Objetivos"]
    
    @IBOutlet weak var odsPicker: UIPickerView!
    override func viewDidLoad() {
        super.viewDidLoad()
        odsPicker.delegate = self
        
        // Do any additional setup after loading the view.
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if(pickerView == odsPicker){
            return odsPickerData[row]
            
        } else{
            return ""
        }
        
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if(pickerView == odsPicker){
            return odsPickerData.count
            
        }else{
            return 0
        }
    }
}
