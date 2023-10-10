//
//  Activity5MainViewController.swift
//  SEL4C
//
//  Created by Esther Ramírez on 05/10/23.
//

import UIKit

class Activity5MainViewController: UIViewController {
    // MARK: Labels
    @IBOutlet weak var instruccionesLabel: UILabel!
    @IBOutlet weak var bulletsLabel: UILabel!
    @IBOutlet weak var entregaLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Assign instructions to it's label
        instruccionesLabel.text = activities[4].subactivities[0].instructions.text
        instruccionesLabel.numberOfLines = 0
        
        // Format bullets
        var bulletsText: String = ""
        for bullet in activities[4].subactivities[0].instructions.bullets {
            bulletsText += "• " + bullet + "\n"
        }
        
        // Assign bullets to their label
        bulletsLabel.text = String(bulletsText.dropLast(1))
        bulletsLabel.numberOfLines = 0
        
        // Assign deliverable to it's label
        entregaLabel.text = activities[4].subactivities[0].deliverable
        entregaLabel.numberOfLines = 0
    }
}
