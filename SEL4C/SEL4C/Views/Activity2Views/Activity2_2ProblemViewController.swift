//
//  Activity2_2ProblemViewController.swift
//  SEL4C
//
//  Created by Esther Ramírez on 30/09/23.
//

import UIKit

class Activity2_2ProblemViewController: UIViewController {

    @IBOutlet weak var tituloLabel: UILabel!
    
    @IBOutlet weak var situacionLabel: UITextView!
    
    @IBOutlet weak var afectacionesLabel: UITextView!
    
    @IBOutlet weak var localidadLabel: UITextView!
    
    
    var selectedObservationIndex: Int = 0
    
    var selectedProblemTitulo: String?
    var selectedProblemSituacion: String?
    var selectedProblemAfectaciones: String?
    var selectedProblemLocalidad: String?
    override func viewDidLoad() {
        
        let selectedIndex2 = UserDefaults().integer(forKey: "selectedProblemIndex")
        
        
        
        let problemaTitulo = UserDefaults().string(forKey: "ProblemasTitle_\(selectedIndex2)")
        let problemaSituacion = UserDefaults().string(forKey: "ProblemasSituacion_\(selectedIndex2)")
        let problemaAfectaciones = UserDefaults().string(forKey: "ProblemasAfectacion_\(selectedIndex2)")
        let problemaLocalidad = UserDefaults().string(forKey: "ProblemasLocalidad_\(selectedIndex2)")
        // Configura la interfaz de usuario con los datos recuperados
        if let titulo = problemaTitulo {
            tituloLabel.text = titulo
        }
        if let situacion = problemaSituacion {
            situacionLabel.text = situacion
        }
        if let afectaciones = problemaAfectaciones {
            afectacionesLabel.text = afectaciones
        }
        if let localidad = problemaLocalidad {
            localidadLabel.text = localidad
        }
    }
    
    
    

}
