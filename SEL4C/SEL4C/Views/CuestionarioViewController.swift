//
//  CuestionarioViewController.swift
//  SEL4C
//
//  Created by Moisés Adame Aguilar on 27/08/23.
//

import UIKit

class CuestionarioViewController: UIViewController {
    // MARK: Radial Buttons
    @IBOutlet weak var radioButton1: RadioButton!
    @IBOutlet weak var radioButton2: RadioButton!
    @IBOutlet weak var radioButton3: RadioButton!
    @IBOutlet weak var radioButton4: RadioButton!
    @IBOutlet weak var radioButton5: RadioButton!
    
    // MARK: Question Labels
    @IBOutlet weak var labelQuestionNumber: UILabel!
    @IBOutlet weak var labelQuestionContent: UILabel!
    
    // MARK: Progress Bar
    @IBOutlet weak var progressBar: UIProgressView!
    
    // MARK: Answers
    var answers: Answer = Answer()
    var index: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // MARK: Initialize Radial Buttons
        radioButton1.initButton(number: 1)
        radioButton2.initButton(number: 2)
        radioButton3.initButton(number: 3)
        radioButton4.initButton(number: 4)
        radioButton5.initButton(number: 5)
        
        // MARK: Initialize Question Labels
        labelQuestionNumber.text = questions[index].title
        labelQuestionContent.text = questions[index].content
        
        // MARK: Initialization of progress bar
        progressBar.progress = Float(index + 1) / 50
    }
    
    @IBAction func radioButtonAction(_ sender: RadioButton) {
        let senderNumber: Int = sender.number
        let radios = [radioButton1, radioButton2, radioButton3, radioButton4, radioButton5]
        for index in 0...radios.count-1 {
            radios[index]!.isSelected = false
            if index + 1 == senderNumber{
                radios[index]!.isSelected = radios[index]!.isSelected ? false : true
            }
        }
    }
    
    @IBAction func buttonNext(_ sender: Any) {
        // Save the selected answer and resent buttons
        let radios = [radioButton1, radioButton2, radioButton3, radioButton4, radioButton5]
        var answer: Int = -1
        
        for radio in radios{
            if radio!.isSelected {
                answer = radio!.number
            }
        }
        
        if answer != -1 {
            // Negate all the radios
            for radio in radios{
                radio?.isSelected = false
            }
            
            // Change to next question
            index += 1
            progressBar.progress = Float(index + 1) / 50
            labelQuestionNumber.text = questions[index].title
            labelQuestionContent.text = questions[index].content
            
            // Check if it has been answered
            if index <= answers.answerArray.count-1 {
                // Negate all aswers except but the selected one.
                for radio in radios {
                    if radio?.number == answers.answerArray[index] {
                        radio?.isSelected = true
                    }else{
                        radio?.isSelected = false
                    }
                }
            }else{
                answers.answerArray.append(answer)
            }
            
            // Check if the questions have ended.
            if index == 5 {
                guard let resultados = storyboard?.instantiateViewController(withIdentifier: "ResultadosViewController") as? ResultadosViewController else {
                    return
                }
                resultados.modalPresentationStyle = .fullScreen
                resultados.answers = answers
                present(resultados, animated: true)
               
            }
        }else{
            let alertController = UIAlertController(
                title: "Error",
                message: "Selecciona una opción.",
                preferredStyle: .alert
            )
            let ok = UIAlertAction(
                title: "Salir.",
                style: .default
            )

            alertController.addAction(ok)

            present(alertController, animated: true, completion: nil)
        }
    }
    
    @IBAction func buttonBack(_ sender: UIButton) {
        // Prepare previous answer.
        if index == 0 {
            self.dismiss(animated: true, completion: nil)
            
        }else{
            let radios = [radioButton1, radioButton2, radioButton3, radioButton4, radioButton5]
            index -= 1
            progressBar.progress = Float(index + 1) / 50
            labelQuestionNumber.text = questions[index].title
            labelQuestionContent.text = questions[index].content
            
            // Negate all aswers except but the selected one.
            for radioIndex in 0...radios.count-1 {
                if radioIndex + 1 == answers.answerArray[index] {
                    radios[radioIndex]?.isSelected = true
                }else{
                    radios[radioIndex]?.isSelected = false
                }
            }
        }
    }
}
