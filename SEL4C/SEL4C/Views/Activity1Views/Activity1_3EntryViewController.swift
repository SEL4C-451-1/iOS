//
//  ViewController.swift
//  Camera
//
//  Created by Avril Hernandez Briones on 17/09/23.
//

import UIKit

class Activity1_3EntryViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {


    @IBOutlet weak var imageView: UIImageView!
    
    let imagePickerController = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePickerController.delegate = self
    }

    // MARK: - Take Photo
    
    @IBAction func onTakeFoto(_ sender: UIButton) {
        imagePickerController.sourceType = .photoLibrary
        present(imagePickerController, animated: true, completion: nil)
        
    }
    
    // MARK: - Save photo
    
    @IBAction func onSave(_ sender: Any) {
        saveImage(imageName: "test.png")
    }
    
    
    // MARK: - Go to gallery
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        imagePickerController.dismiss(animated: true, completion: nil)
        imageView.image = info[.originalImage] as? UIImage
        print(imageView.image?.pngData())
    }
    
    // MARK: - Save image method
    func saveImage(imageName: String) {
        //Crear instancia del FileManager
        let fileManager = FileManager.default
        //Obtener el path de la imagen
        let imagePath = (NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true) [0] as NSString).appendingPathComponent(imageName)
        //obtener la imagen que tomamos con la cámara
        let image = imageView.image!
        //Obtener los datos PNG de la imagen
        let data = image.pngData()
        fileManager.createFile(atPath: imagePath, contents: data, attributes: nil)
    }
}

