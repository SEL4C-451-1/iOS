//
//  Activity3_1ProblemViewController.swift
//  SEL4C
//
//  Created by Esther Ramírez on 30/09/23.
//

import UIKit

class Activity3_1ProblemViewController: UIViewController {
    
    @IBOutlet weak var tituloLabel: UILabel!
    
    @IBOutlet weak var problemaLabel: UITextView!
    
    @IBOutlet weak var afectacionesLabel: UITextView!
    
    @IBOutlet weak var justificacionLabel: UITextView!
    
    
    var selectedProblemIndex3: Int = 0
    
    var selectedProblemTitulo: String?
    var selectedProblemProblema: String?
    var selectedProblemAfectaciones: String?
    var selectedProblemJustificacion: String?
    override func viewDidLoad() {
        
        let selectedIndex3 = UserDefaults().integer(forKey: "A31selectedProblemIndex")
        
        
        
        let a31problemaTitulo = UserDefaults().string(forKey: "A31ProblemasTitle_\(selectedIndex3)")
        let a31problemaProblema = UserDefaults().string(forKey: "A31ProblemasProblema_\(selectedIndex3)")
        let a31problemaAfectaciones = UserDefaults().string(forKey: "A31ProblemasAfectacion_\(selectedIndex3)")
        let a31problemaJustificacion = UserDefaults().string(forKey: "A31ProblemasJustificacion_\(selectedIndex3)")

        // Configura la interfaz de usuario con los datos recuperados
        if let titulo = a31problemaTitulo {
            tituloLabel.text = titulo
        }
        if let problema = a31problemaProblema {
            problemaLabel.text = problema
        }
        if let afectaciones = a31problemaAfectaciones {
            afectacionesLabel.text = afectaciones
        }
        if let justificacion = a31problemaJustificacion {
            justificacionLabel.text = justificacion
        }
    }
    
    
    

}
