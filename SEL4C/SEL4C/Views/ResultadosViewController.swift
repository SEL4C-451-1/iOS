//
//  ViewController.swift
//  SEL4C
//
//  Created by Moisés Adame Aguilar on 27/08/23.
//

import UIKit

class ResultadosViewController: UIViewController {
    // MARK: Answers & User Initialization
    var answers: Answer = Answer()
    var user: User = User(userName: "", email: "", password: "")
    
    // MARK: Progress Bar
    @IBOutlet weak var autocontrolProgress: UIProgressView!
    @IBOutlet weak var liderazgoProgress: HeightProgressBar!
    @IBOutlet weak var concienciaSocialProgress: HeightProgressBar!
    @IBOutlet weak var innovacionSocialFinancieraProgress: HeightProgressBar!
    @IBOutlet weak var pensamientoSistemicoProgress: HeightProgressBar!
    @IBOutlet weak var pensamientoCriticoProgress: HeightProgressBar!
    @IBOutlet weak var pensamientoCientificoProgress: HeightProgressBar!
    @IBOutlet weak var pensamientoInnovadorProgress: HeightProgressBar!
    
    // MARK: Labels Porcentage
    @IBOutlet weak var autocontrolPorcentage: UILabel!
    @IBOutlet weak var liderazgoPorcentage: UILabel!
    @IBOutlet weak var concienciaSocialPorcentage: UILabel!
    @IBOutlet weak var innovacionSocialFinancieraPorcentage: UILabel!
    @IBOutlet weak var pensamientoSistemicoPorcentage: UILabel!
    @IBOutlet weak var pensamientoCriticoPorcentage: UILabel!
    @IBOutlet weak var pensamientoCientificoPorcentage: UILabel!
    @IBOutlet weak var pensamientoInnovadorPorcentage: UILabel!
    
    // MARK: Stacks Results
    @IBOutlet weak var autocontrolStack: UIStackView!
    @IBOutlet weak var liderazgoStack: UIStackView!
    @IBOutlet weak var concienciaSocialStack: UIStackView!
    @IBOutlet weak var innovacionSocialFinancieraStack: UIStackView!
    @IBOutlet weak var pensamientoSistemicoStack: UIStackView!
    @IBOutlet weak var pensamientoCriticoStack: UIStackView!
    @IBOutlet weak var pensamientoCientificoStack: UIStackView!
    @IBOutlet weak var pensamientoInnovadorStack: UIStackView!
    
    // MARK: Button terminate
    @IBOutlet weak var terminateButton: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Autocontrol Card Border Radius and Grade
        autocontrolPorcentage.setCornerRadius()
        autocontrolStack.setCornerRadius(20)
        autocontrolPorcentage.text = "\(String(Int(answers.autocontrolGrade)))%"
        autocontrolProgress.progress = answers.autocontrolGrade / 100
        
        // Liderazgo Card Border Radius and Grade
        liderazgoPorcentage.setCornerRadius()
        liderazgoStack.setCornerRadius(20)
        liderazgoPorcentage.text = "\(String(Int(answers.liderazgolGrade)))%"
        liderazgoProgress.progress = answers.liderazgolGrade / 100
        
        // Conciencia y Valor Social Card Border Radius and Grade
        concienciaSocialPorcentage.setCornerRadius()
        concienciaSocialStack.setCornerRadius(20)
        concienciaSocialPorcentage.text = "\(String(Int(answers.concienciaSocialGrade)))%"
        concienciaSocialProgress.progress = answers.concienciaSocialGrade / 100
        
        // Innovación Social y Estabilidad Financiera Border Radius and Grade
        innovacionSocialFinancieraPorcentage.setCornerRadius()
        innovacionSocialFinancieraStack.setCornerRadius(20)
        innovacionSocialFinancieraPorcentage.text = "\(String(Int(answers.innovacionSocialFinancieraGrade)))%"
        innovacionSocialFinancieraProgress.progress = answers.innovacionSocialFinancieraGrade / 100
        
        // Pensamiento Sistémico Border Radius and Grade
        pensamientoSistemicoPorcentage.setCornerRadius()
        pensamientoSistemicoStack.setCornerRadius(20)
        pensamientoSistemicoPorcentage.text = "\(String(Int(answers.pensamientoSistemicoGrade)))%"
        pensamientoSistemicoProgress.progress = answers.pensamientoSistemicoGrade / 100
        
        // Pensamiento Crítico Border Radius and Grade
        pensamientoCriticoPorcentage.setCornerRadius()
        pensamientoCriticoStack.setCornerRadius(20)
        pensamientoCriticoPorcentage.text = "\(String(Int(answers.pensamientoCriticoGrade)))%"
        pensamientoCriticoProgress.progress = answers.pensamientoCriticoGrade / 100
        
        // Pensamiento Científico Border Radius and Grade
        pensamientoCientificoPorcentage.setCornerRadius()
        pensamientoCientificoStack.setCornerRadius(20)
        pensamientoCientificoPorcentage.text = "\(String(Int(answers.pensamientoCientificoGrade)))%"
        pensamientoCientificoProgress.progress = answers.pensamientoCientificoGrade / 100
        
        // Pensamiento Innovador Border Radius and Grade
        pensamientoInnovadorPorcentage.setCornerRadius()
        pensamientoInnovadorStack.setCornerRadius(20)
        pensamientoInnovadorPorcentage.text = "\(String(Int(answers.pensamientoInnovadorGrade)))%"
        pensamientoInnovadorProgress.progress = answers.pensamientoInnovadorGrade / 100
        
        // Terminate Button Border Radius
        terminateButton.setCornerRadius(35)
    }
    
    
    @IBAction func sendUserInfo(_ sender: Any) {
        // TODO: Enviar a API resultados de cuestionario inicial y datos de usuario
        
        // Go to activities menu.
        guard let main = storyboard?.instantiateViewController(withIdentifier: "ActividadesViewController") as? ActividadesViewController else {
            return
        }
        
        main.modalPresentationStyle = .fullScreen
        present(main, animated: true)
    }
}
