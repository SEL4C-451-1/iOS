//
//  Activity1_1UploadViewController.swift
//  SEL4C
//
//  Created by Moisés Adame Aguilar on 24/09/23.
//

import UIKit

class Activity1_1UploadViewController: UIViewController, UITextViewDelegate {
    // MARK: Text Field
   
    @IBOutlet weak var conclusionTextField: UITextView!
    
    // MARK: Data Persistance
    var defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Adding shadow to UITextView
        conclusionTextField.clipsToBounds = false
        conclusionTextField.layer.shadowOpacity = 0.4
        conclusionTextField.layer.shadowOffset = CGSizeMake(3, 3)
        
        // Chechk if there is any persisted data, if there is, write it up.
        conclusionTextField.text = defaults.string(forKey: "conclusion")
        
        // Use UITextView's delegate.
        conclusionTextField.delegate = self;
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let retroViewController = segue.destination as? Activity1_1RetroViewController {
                retroViewController.retroText = conclusionTextField.text
            }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        defaults.set(textView.text, forKey: "conclusion")
    }
}
