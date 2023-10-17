import UIKit

class Activity1_3EntryViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    weak var dataDelegate: DataDelegate?
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var textField: UITextField! // Agregar un UITextField
    @IBOutlet weak var titleField: UITextField!
    let imagePickerController = UIImagePickerController()
    var update: (() -> Void)?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
        imagePickerController.delegate = self
    }
    
    @IBAction func onTakePhoto(_ sender: UIButton) {
        imagePickerController.sourceType = .camera
        present(imagePickerController, animated: true, completion: nil)
    }
    
    // MARK: - Select from Gallery
    
    @IBAction func onSelectFromGallery(_ sender: UIButton) {
        imagePickerController.sourceType = .photoLibrary
        present(imagePickerController, animated: true, completion: nil)
    }
    
    // MARK: - Save photo and text
    
    @IBAction func onSave(_ sender: Any) {
        print("Presionado el botón Guardar")
        let count = UserDefaults.standard.integer(forKey: "A13count")
            if let title = titleField.text, let text = textField.text {
                saveImageAndText(imageName: "ObservationImage_\(count + 1)_Path", text: text, title: title)
                print("Guardando datos desde: \(self)")
            }
            
        }
        
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
           imagePickerController.dismiss(animated: true, completion: nil)
           if let selectedImage = info[.originalImage] as? UIImage {
               imageView.image = selectedImage
           }
       }
        
        // MARK: - Save image and text method
        
        func saveImageAndText(imageName: String, text: String, title: String) {
            let fileManager = FileManager.default
            //Obtener el path de la imagen
            let imagePath = (NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true) [0] as NSString).appendingPathComponent(imageName)
            print("[*] Path: \(imagePath)")
            //obtener la imagen que tomamos con la cámara
            let image = imageView.image!
            //Obtener los datos PNG de la imagen
            let data = image.pngData()
            fileManager.createFile(atPath: imagePath, contents: data, attributes: nil)
       
                    
            // Obtener el índice de observación actual
            let userDefaults = UserDefaults.standard
            let count = userDefaults.integer(forKey: "A13count")
                    
            // Incrementar el índice para la nueva observación
            let newCount = count + 1
            
            // Guardar la imagen en documentos
            
                    // Asegurarse de que el título y el texto no estén vacíos antes de guardarlos
                    if !title.isEmpty && !text.isEmpty {
                        userDefaults.set(newCount, forKey: "A13count")
                        userDefaults.set(title, forKey: "ObservationTitle_\(newCount)")
                        userDefaults.set(text, forKey: "ObservationText_\(newCount)")
                        userDefaults.set(imagePath, forKey: "ObservationImage_\(newCount)_Path")
                    
                    } else {
                        print("Campos de título y/o texto vacíos. No se guardó la observación.")
                    }
                    
                    // Llamar al delegado para notificar que los datos se han guardado
                    dataDelegate?.dataSaved(imageName: image, text: text, title: title)
                    
                    // Actualizar la tabla en Activity1_3UploadViewController
                    update?()
                
                guard let vc = storyboard?.instantiateViewController(withIdentifier: "Activity1_3UploadViewController") as? Activity1_3UploadViewController else {
                    return
                }
                vc.modalPresentationStyle = .fullScreen
                present(vc, animated: true)
            }
        }


protocol DataDelegate: AnyObject {
    func dataSaved(imageName: UIImage, text: String, title: String)
}
