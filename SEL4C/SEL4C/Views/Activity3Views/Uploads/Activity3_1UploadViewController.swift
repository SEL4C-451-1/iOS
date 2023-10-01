//
//  Activity3_1UploadViewController.swift
//  SEL4C
//
//  Created by Esther Ramírez on 28/09/23.
//

import UIKit

class Activity3_1UploadViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    weak var dataDelegate: DataDelegate3?
    
    public var problems = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Configure the table view
        tableView.delegate = self
        tableView.dataSource = self
        
        if !UserDefaults().bool(forKey: "setup3"){
            UserDefaults().set(true, forKey: "setup3")
            UserDefaults().set(0, forKey: "A31count")
        }
        updateTable()
        
    }
    
    func updateTable(){
        guard let count2 = UserDefaults().value(forKey: "A31count") as? Int else {
            return
        }
        
        for x in 0..<count2 {
            if let newCell = UserDefaults().value(forKey: "A31ProblemasTitle_\(x+1)") as? String {
                problems.append(newCell)
            }
        }
    }
    // MARK: - UITableViewDataSource
    
    @IBAction func agregar(_ sender: Any) {
        print("Presionado el botón Agregar")
        let entryVC = storyboard?.instantiateViewController(withIdentifier: "Activity3_1EntryViewController") as? Activity3_1EntryViewController
        entryVC?.update = {
            DispatchQueue.main.async {
                self.updateTable()
            }
        }
        present(entryVC!, animated: true)
        self.updateTable()
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return problems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = problems[indexPath.row]
        return cell
    }
    
    // MARK: - UITableViewDelegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        // Obtén el índice de la observación seleccionada
        let selectedIndex3 = indexPath.row+1
        print("Seleccionado el índice \(selectedIndex3)")
        // Almacena el índice en UserDefaults
        UserDefaults.standard.set(selectedIndex3, forKey: "A31selectedProblemIndex")
        UserDefaults.standard.synchronize() // Asegúrate de que los datos se guarden inmediatamente
        
        // Inicializa el ViewController de detalle
        let detailVC = storyboard?.instantiateViewController(withIdentifier: "Activity3_1ProblemViewController") as? Activity3_1ProblemViewController
        detailVC?.selectedProblemIndex3 = selectedIndex3
        present(detailVC!, animated: true)
    }
    
    
    
}
