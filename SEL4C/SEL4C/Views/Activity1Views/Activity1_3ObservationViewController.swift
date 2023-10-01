//
//  Activity1_3ObservationViewController.swift
//  SEL4C
//
//  Created by Esther Ramírez on 30/09/23.
//

import UIKit

class Activity1_3ObservationViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var textView: UITextView!
    
    var selectedObservationIndex: Int = 0
    
    var selectedObservationTitulo: String?
    var selectedObservationText: String?
    var selectedObservationImage: UIImage?
    override func viewDidLoad() {
        
        let selectedIndex = UserDefaults().integer(forKey: "selectedObservationIndex")
        
        
        let observationTitle = UserDefaults().string(forKey: "ObservationTitle_\(selectedIndex)")
        let observationText = UserDefaults().string(forKey: "ObservationText_\(selectedIndex)")
        if let imagePath = UserDefaults.standard.string(forKey: "ObservationImage_\(selectedIndex)_Path"),
            let image = UIImage(contentsOfFile: imagePath) {
            imageView.image = image
        }
        // Configura la interfaz de usuario con los datos recuperados
        if let titulo = observationTitle {
            titleLabel.text = titulo
        }
        if let text = observationText {
            textView.text = text
        }
        
    }
    
}
