//
//  ActividadesViewController.swift
//  SEL4C
//
//  Created by Esther Ramírez on 11/09/23.
//

import UIKit

class ActividadesViewController: UIViewController {

    @IBOutlet weak var imgA1: UIImageView!
    @IBOutlet weak var imgA2: UIImageView!
    @IBOutlet weak var imgA3: UIImageView!
    @IBOutlet weak var imgA4: UIImageView!
    @IBOutlet weak var imgEC: UIImageView!
    @IBOutlet weak var imgEF: UIImageView!
    @IBOutlet weak var buttonA1: UIButton!
    @IBOutlet weak var buttonA2: UIButton!
    @IBOutlet weak var buttonA3: UIButton!
    @IBOutlet weak var buttonA4: UIButton!
    @IBOutlet weak var buttonEC: UIButton!
    @IBOutlet weak var buttonEF: UIButton!
    @IBOutlet weak var stackView1: UIStackView!
    @IBOutlet weak var stackView2: UIStackView!
    @IBOutlet weak var stackView3: UIStackView!
    @IBOutlet weak var stackView4: UIStackView!
    @IBOutlet weak var stackView5: UIStackView!
    @IBOutlet weak var stackView6: UIStackView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        Task{
            do {
                print("[*] ENTER DO ")
                let activity = try ActivityResponse(string_response: "")
                try await activity.getStatus()
            }catch{
                
                print("[*] ENTER CTACH ")
                
                if UserDefaults.standard.bool(forKey: "actividadTerminada1") {
                    // Cambiar la imagen de imgA1 a "circle.dashed.inset.filled" en verde
                    imgA1.image = UIImage(systemName: "circle.dashed.inset.filled")
                    imgA1.tintColor = .green
                }
                
                if UserDefaults.standard.bool(forKey: "actividadTerminada2") {
                    // Cambiar la imagen de imgA1 a "circle.dashed.inset.filled" en verde
                    imgA2.image = UIImage(systemName: "circle.dashed.inset.filled")
                    imgA2.tintColor = .green
                }
                
                if UserDefaults.standard.bool(forKey: "actividadTerminada3") {
                    // Cambiar la imagen de imgA1 a "circle.dashed.inset.filled" en verde
                    imgA3.image = UIImage(systemName: "circle.dashed.inset.filled")
                    imgA3.tintColor = .green
                }
                
                if UserDefaults.standard.bool(forKey: "actividadTerminada4") {
                    // Cambiar la imagen de imgA1 a "circle.dashed.inset.filled" en verde
                    imgA4.image = UIImage(systemName: "circle.dashed.inset.filled")
                    imgA4.tintColor = .green
                }
                
                if UserDefaults.standard.bool(forKey: "actividadTerminada5") {
                    // Cambiar la imagen de imgA1 a "circle.dashed.inset.filled" en verde
                    imgEF.image = UIImage(systemName: "circle.dashed.inset.filled")
                    imgEF.tintColor = .green
                }
                
                if UserDefaults.standard.bool(forKey: "evaluacionFinalTerminada") {
                    // Cambiar la imagen de imgA1 a "circle.dashed.inset.filled" en verde
                    imgEC.image = UIImage(systemName: "circle.dashed.inset.filled")
                    imgEC.tintColor = .green
                }
            }
        }
        
        stackView1.layer.cornerRadius = 20 // Radio de redondeo deseado
        stackView1.clipsToBounds = true
        stackView2.layer.cornerRadius = 20 // Radio de redondeo deseado
        stackView2.clipsToBounds = true
        stackView3.layer.cornerRadius = 20 // Radio de redondeo deseado
        stackView3.clipsToBounds = true
        stackView4.layer.cornerRadius = 20 // Radio de redondeo deseado
        stackView4.clipsToBounds = true
        stackView5.layer.cornerRadius = 20 // Radio de redondeo deseado
        stackView5.clipsToBounds = true
        stackView6.layer.cornerRadius = 20 // Radio de redondeo deseado
        stackView6.clipsToBounds = true
        let font = UIFont(name: "AndaleMono", size: 38)
            let blackColor = UIColor.black

            buttonA1.titleLabel?.font = font
            buttonA1.setTitleColor(blackColor, for: .normal)

            buttonA2.titleLabel?.font = font
            buttonA2.setTitleColor(blackColor, for: .normal)

            buttonA3.titleLabel?.font = font
            buttonA3.setTitleColor(blackColor, for: .normal)

            buttonA4.titleLabel?.font = font
            buttonA4.setTitleColor(blackColor, for: .normal)

            buttonEC.titleLabel?.font = font
            buttonEC.setTitleColor(blackColor, for: .normal)

            buttonEF.titleLabel?.font = font
            buttonEF.setTitleColor(blackColor, for: .normal)
        
    }
    
    @IBAction func buttonA1Tapped(_ sender: UIButton) {
        let VC = storyboard?.instantiateViewController(withIdentifier: "Activity1_1MainViewController") as? Activity1_1MainViewController
        present(VC!, animated: true)
    }
    
    @IBAction func buttonA2Tapped(_ sender: UIButton) {
        // Verificar si la actividad 1 está terminada antes de avanzar
        if UserDefaults.standard.bool(forKey: "actividadTerminada1") {
            let VC = storyboard?.instantiateViewController(withIdentifier: "Activity2_1MainViewController") as? Activity2_1MainViewController
            present(VC!, animated: true)
        } else {
            let alertController = UIAlertController(title: "Actividad no terminada", message: "Debes completar la actividad 1 antes de continuar.", preferredStyle: .alert)
                    
                    let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
                    alertController.addAction(okAction)
                    
                    present(alertController, animated: true, completion: nil)
        }
    }

    @IBAction func buttonA3Tapped(_ sender: UIButton) {
        // Verificar si la actividad 1 está terminada antes de avanzar
        if UserDefaults.standard.bool(forKey: "actividadTerminada2") {
            let VC = storyboard?.instantiateViewController(withIdentifier: "Activity3_1MainViewController") as? Activity3_1MainViewController
            present(VC!, animated: true)
        } else {
            let alertController = UIAlertController(title: "Actividad no terminada", message: "Debes completar la actividad 2 antes de continuar.", preferredStyle: .alert)
                    
                    let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
                    alertController.addAction(okAction)
                    
                    present(alertController, animated: true, completion: nil)
        }
    }

    @IBAction func buttonA4Tapped(_ sender: UIButton) {
        // Verificar si la actividad 1 está terminada antes de avanzar
        if UserDefaults.standard.bool(forKey: "actividadTerminada3") {
            let VC = storyboard?.instantiateViewController(withIdentifier: "Activity4_1MainViewController") as? Activity4_1MainViewController
            present(VC!, animated: true)
        } else {
            let alertController = UIAlertController(title: "Actividad no terminada", message: "Debes completar la actividad 3 antes de continuar.", preferredStyle: .alert)
                    
                    let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
                    alertController.addAction(okAction)
                    
                    present(alertController, animated: true, completion: nil)
        }
    }

    @IBAction func buttonECTapped(_ sender: UIButton) {
        // Verificar si la actividad 1 está terminada antes de avanzar
        if UserDefaults.standard.bool(forKey: "actividadTerminada4") {
            let VC = storyboard?.instantiateViewController(withIdentifier: "CuestionarioViewController") as? CuestionarioViewController
            VC?.isInitial = false
            present(VC!, animated: true)
        } else {
            let alertController = UIAlertController(title: "Actividad no terminada", message: "Debes completar la actividad 4 antes de continuar.", preferredStyle: .alert)
                    
                    let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
                    alertController.addAction(okAction)
                    
                    present(alertController, animated: true, completion: nil)
        }
    }

    @IBAction func buttonEFTapped(_ sender: UIButton) {
        // Verificar si la actividad 1 está terminada antes de avanzar
        if UserDefaults.standard.bool(forKey: "actividadTerminada4") {
            let VC = storyboard?.instantiateViewController(withIdentifier: "Activity5MainViewController") as? Activity5MainViewController
            present(VC!, animated: true)
        } else {
            let alertController = UIAlertController(title: "Actividad no terminada", message: "Debes completar la evaluación de cierre antes de continuar.", preferredStyle: .alert)
                    
                    let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
                    alertController.addAction(okAction)
                    
                    present(alertController, animated: true, completion: nil)
        }
    }


}
