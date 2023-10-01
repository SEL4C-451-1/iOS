//
//  Activity4_2MainViewController.swift
//  SEL4C
//
//  Created by Esther Ramírez on 28/09/23.
//

import UIKit

class Activity4_2MainViewController: UIViewController {

    @IBOutlet weak var instruccionesLabel: UILabel!
    @IBOutlet weak var bulletsLabel: UILabel!
    @IBOutlet weak var entregaLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Assign instructions to it's label
        instruccionesLabel.text = activities[3].subactivities[1].instructions.text
        instruccionesLabel.numberOfLines = 0
        
        // Format bullets
        var bulletsText: String = ""
        for bullet in activities[3].subactivities[1].instructions.bullets {
            bulletsText += "• " + bullet + "\n"
        }
        
        // Assign bullets to their label
        bulletsLabel.text = String(bulletsText.dropLast(1))
        bulletsLabel.numberOfLines = 0
        
        // Assign deliverable to it's label
        entregaLabel.text = activities[3].subactivities[1].deliverable
        entregaLabel.numberOfLines = 0
        
    }

}
