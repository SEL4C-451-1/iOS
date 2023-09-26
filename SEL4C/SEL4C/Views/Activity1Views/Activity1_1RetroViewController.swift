//
//  Activity1_1RetroViewController.swift
//  SEL4C
//
//  Created by Moisés Adame Aguilar on 25/09/23.
//

import UIKit

class Activity1_1RetroViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    var retroText: String?
    // MARK: Data Persistance
    var defaults = UserDefaults.standard
    override func viewDidLoad() {
        super.viewDidLoad()
        let functionURL = "https://http-word-cloud.azurewebsites.net/api/word_cloud?code=-Yh3m32xkYHlf2Xrz9m9NSrn1LT3AhHS_vgu7VlWOpgSAzFulWrlFQ=="
        
        let json: [String: Any?] = [
            "text": retroText
        ]
        
        guard let jsonData = try? JSONSerialization.data(withJSONObject: json) else {
            return
        }

        var request = URLRequest(url: URL(string: functionURL)!)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = jsonData

        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print("Error: \(error.localizedDescription)")
                return
            }

            if let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 {
                print("Azure Function executed successfully.")

                if let imageData = data, let image = UIImage(data: imageData) {
                    DispatchQueue.main.async {
                        self.imageView.image = image
                    }
                }
            } else {
                print("Error: Azure Function returned a non-200 status code.")
            }
        }.resume()
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
