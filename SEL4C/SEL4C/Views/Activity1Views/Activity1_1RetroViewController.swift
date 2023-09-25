//
//  Activity1_1RetroViewController.swift
//  SEL4C
//
//  Created by Moisés Adame Aguilar on 25/09/23.
//

import UIKit

class Activity1_1RetroViewController: UIViewController {
    // MARK: Data Persistance
    var defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    struct Phrase: Codable{
        let quote: String
    }
    
    @IBAction func backButton(_ sender: Any) {
        Task { @MainActor in
            let urlKanye = URL(string: "https://http-word-cloud.azurewebsites.net/api/word_cloud?code=-Yh3m32xkYHlf2Xrz9m9NSrn1LT3AhHS_vgu7VlWOpgSAzFulWrlFQ==")
            
            let (data, response) = try await URLSession.shared.data(from: urlKanye!)
            
            let jsonDecoder = JSONDecoder()
            
            if let httpResponse = response as? HTTPURLResponse,
               httpResponse.statusCode == 200,
               let phrase = try? jsonDecoder.decode(Phrase.self, from: data){
                print(phrase.quote)
            }
        }
    }
}
