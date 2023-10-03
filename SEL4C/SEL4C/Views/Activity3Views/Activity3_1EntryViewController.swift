//
//  Activity3_1EntryViewController.swift
//  SEL4C
//
//  Created by Esther Ramírez on 30/09/23.
//

import UIKit

class Activity3_1EntryViewController: UIViewController, UINavigationControllerDelegate {
    weak var dataDelegate: DataDelegate3?
    @IBOutlet weak var titulo: UITextField!
    
    @IBOutlet weak var problema: UITextField!
    
    @IBOutlet weak var afectacion: UITextField!
    
    @IBOutlet weak var justificacion: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
    }
    
    var update: (() -> Void)?
    
    @IBAction func guardar(_ sender: Any) {
        print("Botón Guardar presionado")
               if let titulo = titulo.text,
                  let problema = problema.text,
                  let afectacion = afectacion.text,
                  let justificacion = justificacion.text {
                   save(titulo: titulo, problema: problema, afectacion: afectacion, justificacion: justificacion)
                   print("Guardando datos desde: \(self)")
               }
            
        }
        
        func save(titulo: String, problema: String, afectacion: String, justificacion: String) {
            print("Si entra a la función")
                    guard let count3 = UserDefaults().value(forKey: "A31count") as? Int else {
                        print("entra al else")
                        return
                    }
                    let newCount3 = count3 + 1
                

                    // Asegúrate de que todos los campos estén completos antes de guardar
                    if !titulo.isEmpty && !problema.isEmpty && !afectacion.isEmpty && !justificacion.isEmpty {
                        UserDefaults().set(newCount3, forKey: "A31count")
                        UserDefaults().set(titulo, forKey: "A31ProblemasTitle_\(newCount3)")
                        UserDefaults().set(problema, forKey: "A31ProblemasProblema_\(newCount3)")
                        UserDefaults().set(afectacion, forKey: "A31ProblemasAfectacion_\(newCount3)")
                        UserDefaults().set(justificacion, forKey: "A31ProblemasJustificacion_\(newCount3)")
                        
                        dataDelegate?.dataSaved(titulo: titulo, problema: problema, afectacion: afectacion, justificacion: justificacion)
                        update?()
                        print("Guardado")
                        // Regresa a la vista de Activity2_2UploadViewController
                        guard let vc = storyboard?.instantiateViewController(withIdentifier: "Activity3_1UploadViewController") as? Activity3_1UploadViewController else {
                            return
                        }
                        vc.modalPresentationStyle = .fullScreen
                        present(vc, animated: true)
                    } else {
                        print("Campos de título y/o texto vacíos. No se guardó la observación.")
                    }
                }
    }
    
protocol DataDelegate3: AnyObject {
    func dataSaved(titulo: String, problema: String, afectacion: String, justificacion: String)
}
