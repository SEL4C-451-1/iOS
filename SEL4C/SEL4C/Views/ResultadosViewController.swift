//
//  ViewController.swift
//  SEL4C
//
//  Created by Moisés Adame Aguilar on 27/08/23.
//

import UIKit

class ResultadosViewController: UIViewController {
    // MARK: Answers
    var answers: Answer = Answer()

    @IBOutlet weak var autocontrolProgress: UIProgressView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        autocontrolProgress.transform = CGAffineTransformScale(autocontrolProgress.transform, 1, 1.25)
    }
}
