//
//  MyProfileViewController.swift
//  SEL4C
//
//  Created by Moisés Adame Aguilar on 07/10/23.
//

import UIKit

class MyProfileViewController: UIViewController {
    
    // MARK: Demographic Labels
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var academicoLabel: UILabel!
    @IBOutlet weak var institucionLabel: UILabel!
    @IBOutlet weak var generoLabel: UILabel!
    @IBOutlet weak var edadLabel: UILabel!
    @IBOutlet weak var paisLabel: UILabel!
    @IBOutlet weak var disciplinaLabel: UILabel!
    
    // MARK: User Info
    var userInfo = UserInfo()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Adding Corner Radius to all Labels.
        userNameLabel.setCornerRadius(7.5)
        academicoLabel.setCornerRadius(7.5)
        institucionLabel.setCornerRadius(7.5)
        generoLabel.setCornerRadius(7.5)
        edadLabel.setCornerRadius(7.5)
        paisLabel.setCornerRadius(7.5)
        disciplinaLabel.setCornerRadius(7.5)
        
        
        Task{
            do{
                let response: [String: Any] = try await userInfo.getInfo()
                
                userNameLabel.text = response["full_name"]! as! String
                academicoLabel.text = response["academic_degree"]! as! String
                institucionLabel.text = response["institution"]! as! String
                generoLabel.text = response["gender"]! as! String
                edadLabel.text = String(response["age"]! as! Int)
                paisLabel.text = response["country"]! as! String
                disciplinaLabel.text = response["discipline"]! as! String
            }catch{
                showErrorAlert("Error al obtener datos de usuario.")
            }
        }
    }
}
