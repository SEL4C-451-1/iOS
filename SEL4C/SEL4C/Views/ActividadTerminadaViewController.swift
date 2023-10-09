import UIKit

class ActividadTerminadaViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Establecer el valor booleano en UserDefaults como true
        if self.restorationIdentifier == "Terminada1" {
            // Establecer el valor booleano en UserDefaults como true
            Task {
                do {
                    var activity: ActivityResponse = try ActivityResponse(string_response: "complete")
                    try await activity.setStatus(activityNumber: "1")
                }catch{
                    showErrorAlert("Error mandando estatus.")
                }
            }
            UserDefaults.standard.set(true, forKey: "actividadTerminada1")
        } else if self.restorationIdentifier == "Terminada2" {
            // Establecer el valor booleano en UserDefaults como true
            Task {
                do {
                    var activity: ActivityResponse = try ActivityResponse(string_response: "complete")
                    try await activity.setStatus(activityNumber: "2")
                }catch{
                    showErrorAlert("Error mandando estatus.")
                }
            }
            UserDefaults.standard.set(true, forKey: "actividadTerminada2")
        } else if self.restorationIdentifier == "Terminada3" {
            // Establecer el valor booleano en UserDefaults como true
            Task {
                do {
                    var activity: ActivityResponse = try ActivityResponse(string_response: "complete")
                    try await activity.setStatus(activityNumber: "3")
                }catch{
                    showErrorAlert("Error mandando estatus.")
                }
            }
            UserDefaults.standard.set(true, forKey: "actividadTerminada3")
        } else if self.restorationIdentifier == "Terminada4" {
            // Establecer el valor booleano en UserDefaults como true
            Task {
                do {
                    var activity: ActivityResponse = try ActivityResponse(string_response: "complete")
                    try await activity.setStatus(activityNumber: "4")
                }catch{
                    showErrorAlert("Error mandando estatus.")
                }
            }
            UserDefaults.standard.set(true, forKey: "actividadTerminada4")
        } else if self.restorationIdentifier == "Terminada5" {
            // Establecer el valor booleano en UserDefaults como true
            Task {
                do {
                    var activity: ActivityResponse = try ActivityResponse(string_response: "complete")
                    try await activity.setStatus(activityNumber: "5")
                }catch{
                    showErrorAlert("Error mandando estatus.")
                }
            }
            UserDefaults.standard.set(true, forKey: "actividadTerminada5")
        }
    }
}
