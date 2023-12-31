import UIKit

class Activity2_3UploadViewController: UIViewController {
    
    @IBOutlet weak var causesCollectionView: UICollectionView!
    @IBOutlet weak var consequencesCollectionView: UICollectionView!
    @IBOutlet weak var problemLabel: UILabel!
    
    private var causes: [String] = []
    private var consequences: [String] = []
    
    private let cellWidth = UIScreen.main.bounds.width / 6
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let savedCauses = UserDefaults.standard.stringArray(forKey: "causes") {
                causes = savedCauses
            }

            // Cargar las consecuencias
            if let savedConsequences = UserDefaults.standard.stringArray(forKey: "consequences") {
                consequences = savedConsequences
            }

            // Cargar el problema
            if let savedProblem = UserDefaults.standard.string(forKey: "problem") {
                problemLabel.text = savedProblem
            }
        
        causesCollectionView.backgroundColor = UIColor.clear
        consequencesCollectionView.backgroundColor = UIColor.clear
        
        causesCollectionView.dataSource = self
        causesCollectionView.delegate = self
        consequencesCollectionView.dataSource = self
        consequencesCollectionView.delegate = self
        
        causesCollectionView.register(UINib(nibName: "RootCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "root")
        consequencesCollectionView.register(UINib(nibName: "LeafCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "leaf")
        
        let gesture = UILongPressGestureRecognizer(target: self, action: #selector(handleLongPressGesture(_:)))
        
        causesCollectionView.addGestureRecognizer(gesture)
        consequencesCollectionView.addGestureRecognizer(gesture)
    }
    
    @objc func handleLongPressGesture(_ gesture: UILongPressGestureRecognizer) {
        if gesture.view == causesCollectionView {
            handleLongPressGesture(gesture, collectionView: causesCollectionView)
        } else if gesture.view == consequencesCollectionView {
            handleLongPressGesture(gesture, collectionView: consequencesCollectionView)
        }
    }
    
    @objc func handleLongPressGesture(_ gesture: UILongPressGestureRecognizer, collectionView: UICollectionView) {
        switch gesture.state {
        case .began:
            guard let targetIndexPath = collectionView.indexPathForItem(at: gesture.location(in: collectionView)) else { return }
            collectionView.beginInteractiveMovementForItem(at: targetIndexPath)
        case .changed:
            collectionView.updateInteractiveMovementTargetPosition(gesture.location(in: collectionView))
        case .ended:
            collectionView.endInteractiveMovement()
        default:
            collectionView.cancelInteractiveMovement()
        }
    }
    
    @IBAction func addCause(_ sender: Any) {
        presentAddElementAlert(title: "Añade una causa", placeholder: "Causa") { [weak self] newElement in
            self?.causes.append(newElement)
            self?.causesCollectionView.reloadData()
            UserDefaults.standard.set(self?.causes, forKey: "causes")
        }
    }
    
    @IBAction func addProblem(_ sender: Any) {
        presentAddElementAlert(title: "Añade tu problema", placeholder: "Problema") { [weak self] newElement in
            self?.problemLabel.text = newElement
            UserDefaults.standard.set(self?.problemLabel.text, forKey: "problem")
        }
    }
    
    @IBAction func addConsequence(_ sender: Any) {
        presentAddElementAlert(title: "Añade una consecuencia", placeholder: "Consecuencia") { [weak self] newElement in
            self?.consequences.append(newElement)
            self?.consequencesCollectionView.reloadData()
            UserDefaults.standard.set(self?.consequences, forKey: "consequences")
        }
    }
    
    private func presentAddElementAlert(title: String, placeholder: String, completion: @escaping (String) -> Void) {
        let alertController = UIAlertController(title: title, message: "Ingresa un elemento:", preferredStyle: .alert)
        
        alertController.addTextField { (textField) in
            textField.placeholder = placeholder
        }
        
        let addAction = UIAlertAction(title: "Añadir", style: .default) { (_) in
            if let textField = alertController.textFields?.first, let newElement = textField.text, !newElement.isEmpty {
                completion(newElement)
            }
        }
        
        let cancelAction = UIAlertAction(title: "Cancelar", style: .cancel, handler: nil)
        
        alertController.addAction(addAction)
        alertController.addAction(cancelAction)
        
        present(alertController, animated: true, completion: nil)
    }
}

extension Activity2_3UploadViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == causesCollectionView {
            return causes.count
        } else if collectionView == consequencesCollectionView {
            return consequences.count
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == causesCollectionView {
            let cell = causesCollectionView.dequeueReusableCell(withReuseIdentifier: "root", for: indexPath) as? RootCollectionViewCell
            return cell!
        } else if collectionView == consequencesCollectionView {
            let cell = consequencesCollectionView.dequeueReusableCell(withReuseIdentifier: "leaf", for: indexPath) as? LeafCollectionViewCell
            return cell!
        }
        return UICollectionViewCell()
    }
}

extension Activity2_3UploadViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        var itemToDisplay = ""
        if collectionView == causesCollectionView {
            itemToDisplay = causes[indexPath.row]
        } else if collectionView == consequencesCollectionView {
            itemToDisplay = consequences[indexPath.row]
        }
        
        let alertController = UIAlertController(title: "Tu selección", message: itemToDisplay, preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(okAction)
        
        present(alertController, animated: true, completion: nil)
    }
}

extension Activity2_3UploadViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.section == 0 {
            return CGSize(width: cellWidth, height: cellWidth)
        }
        return CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.width)
    }
    
    func collectionView(_ collectionView: UICollectionView, canMoveItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func collectionView(_ collectionView: UICollectionView, moveItemAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        if collectionView == causesCollectionView {
            let cause = causes.remove(at: sourceIndexPath.row)
            causes.insert(cause, at: destinationIndexPath.row)
        } else if collectionView == consequencesCollectionView {
            let consequence = consequences.remove(at: sourceIndexPath.row)
            consequences.insert(consequence, at: destinationIndexPath.row)
        }
    }
}
