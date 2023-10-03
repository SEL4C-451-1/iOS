import UIKit

class Activity2_2EntryViewController: UIViewController, UINavigationControllerDelegate {
    weak var dataDelegate: DataDelegate2?
    @IBOutlet weak var titulo: UITextField!
    
    @IBOutlet weak var situacion: UITextField!
    
    @IBOutlet weak var afectacion: UITextField!
    
    @IBOutlet weak var localidad: UITextField!
    
    override func viewDidLoad() {
        self.hideKeyboardWhenTappedAround()
        super.viewDidLoad()
    }
    
    var update: (() -> Void)?
    
    @IBAction func guardar(_ sender: Any) {
        print("Botón Guardar presionado")
               if let title = titulo.text,
                  let situacion = situacion.text,
                  let afectacion = afectacion.text,
                  let localidad = localidad.text {
                   save(titulo: title, situacion: situacion, afectacion: afectacion, localidad: localidad)
                   print("Guardando datos desde: \(self)")
               }
            
        }
        
        func save(titulo: String, situacion: String, afectacion: String, localidad: String) {
            print("Si entra a la función")
                    guard let count2 = UserDefaults().value(forKey: "A22count") as? Int else {
                        print("entra al else")
                        return
                    }
                    let newCount2 = count2 + 1
                    
                    print("titulo: \(titulo)")
                    print("situacion: \(situacion )")
                    print("afectacion: \(afectacion )")
                    print("localidad: \(localidad )")

                    // Asegúrate de que todos los campos estén completos antes de guardar
                    if !titulo.isEmpty && !situacion.isEmpty && !afectacion.isEmpty && !localidad.isEmpty {
                        UserDefaults().set(newCount2, forKey: "A22count")
                        UserDefaults().set(titulo, forKey: "ProblemasTitle_\(newCount2)")
                        UserDefaults().set(situacion, forKey: "ProblemasSituacion_\(newCount2)")
                        UserDefaults().set(afectacion, forKey: "ProblemasAfectacion_\(newCount2)")
                        UserDefaults().set(localidad, forKey: "ProblemasLocalidad_\(newCount2)")
                        
                        dataDelegate?.dataSaved(titulo: titulo, situacion: situacion, afectacion: afectacion, localidad: localidad)
                        update?()
                        print("Guardado")
                        // Regresa a la vista de Activity2_2UploadViewController
                        guard let vc = storyboard?.instantiateViewController(withIdentifier: "Activity2_2UploadViewController") as? Activity2_2UploadViewController else {
                            return
                        }
                        vc.modalPresentationStyle = .fullScreen
                        present(vc, animated: true)
                    } else {
                        print("Campos de título y/o texto vacíos. No se guardó la observación.")
                    }
                }
    }
    
protocol DataDelegate2: AnyObject {
    func dataSaved(titulo: String, situacion: String, afectacion: String, localidad: String)
}
