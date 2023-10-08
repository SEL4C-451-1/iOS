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
    
    // MARK: Buttons
    @IBOutlet weak var editButton: UIButton!
    
    
    // MARK: User Info
    var userInfo = UserInfo()
    
    override func viewDidAppear(_ animated: Bool) {
        Task{
            do{
                let response: [String: Any] = try await userInfo.getInfo()
                userInfo.setvalues(response)
                
                userNameLabel.text = userInfo.full_name
                academicoLabel.text = userInfo.academic_degree
                institucionLabel.text = userInfo.institution
                generoLabel.text = userInfo.gender
                edadLabel.text = String(userInfo.age)
                paisLabel.text = userInfo.country
                disciplinaLabel.text = userInfo.discipline
                editButton.isEnabled = true
            }catch{
                showErrorAlert("Error al obtener datos de usuario.")
                editButton.isEnabled = false
                
            }
        }
        
        // Hide Tab Bar
        tabBarController?.tabBar.isHidden = false
    }
    
    // Prepare view for segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let updateVC = segue.destination as? UpdateMyProfileViewController else {
            return
        }
        
        updateVC.userInfo = userInfo
    }
    
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
                userInfo.setvalues(response)
                
                userNameLabel.text = userInfo.full_name
                academicoLabel.text = userInfo.academic_degree
                institucionLabel.text = userInfo.institution
                generoLabel.text = userInfo.gender
                edadLabel.text = String(userInfo.age)
                paisLabel.text = userInfo.country
                disciplinaLabel.text = userInfo.discipline
                editButton.isEnabled = true
            }catch{
                showErrorAlert("Error al obtener datos de usuario.")
                editButton.isEnabled = false
            }
        }
    }
}
