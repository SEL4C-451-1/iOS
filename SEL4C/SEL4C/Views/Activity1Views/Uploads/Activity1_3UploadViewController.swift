import UIKit

class Activity1_3UploadViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    weak var dataDelegate: DataDelegate2?
    
    public var observations = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Configure the table view
        tableView.delegate = self
        tableView.dataSource = self
        
        if !UserDefaults().bool(forKey: "setup1"){
            UserDefaults().set(true, forKey: "setup1")
            UserDefaults().set(0, forKey: "A13count")
        }
        updateTable()
        
    }
    
    func updateTable(){
        guard let count1 = UserDefaults().value(forKey: "A13count") as? Int else {
            return
        }
        
        for x in 0..<count1 {
            if let newCell = UserDefaults().value(forKey: "ObservationTitle_\(x+1)") as? String {
                observations.append(newCell)
            }
        }
    }
   
    
    @IBAction func agregar(_ sender: Any) {
        print("Presionado el botón Agregar")
        let entryVC = storyboard?.instantiateViewController(withIdentifier: "Activity1_3EntryViewController") as? Activity1_3EntryViewController
        entryVC?.update = {
            DispatchQueue.main.async {
                self.updateTable()
            }
        }
        present(entryVC!, animated: true)
        self.updateTable()
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return observations.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = observations[indexPath.row]
        return cell
    }
    
    // MARK: - UITableViewDelegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        // Obtén el índice de la observación seleccionada
        let selectedIndex = indexPath.row+1
        print("Seleccionado el índice \(selectedIndex)")
        // Almacena el índice en UserDefaults
        UserDefaults.standard.set(selectedIndex, forKey: "selectedObservationIndex")
        UserDefaults.standard.synchronize() // Asegúrate de que los datos se guarden inmediatamente
        
        // Inicializa el ViewController de detalle
        let detailVC = storyboard?.instantiateViewController(withIdentifier: "Activity1_3ObservationViewController") as? Activity1_3ObservationViewController
        detailVC?.selectedObservationIndex = selectedIndex
        present(detailVC!, animated: true)
    }
    
    
    
}
