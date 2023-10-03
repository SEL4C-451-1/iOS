//
//  Activity1_2UploadViewController.swift
//  SEL4C
//
//  Created by Esther Ramírez on 28/09/23.
//

import UIKit
import AVFoundation
import MobileCoreServices

class Activity1_2UploadViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    @IBOutlet weak var playerView: UIView!
    let imagePickerController = UIImagePickerController()
    var videoURL: URL?

    override func viewDidLoad() {
        super.viewDidLoad()
        imagePickerController.delegate = self
    }

    // MARK: - Capture Video
    @IBAction func onCaptureVideo(_ sender: UIButton) {
        imagePickerController.sourceType = .camera
        imagePickerController.mediaTypes = [kUTTypeMovie as String]
        present(imagePickerController, animated: true, completion: nil)
    }

    // MARK: - Save Video
    @IBAction func onSaveVideo(_ sender: Any) {
        if let videoURL = videoURL {
            saveVideo(videoURL: videoURL, videoName: "test.mp4")
        } else {
            print("No hay video para guardar.")
        }
    }

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        imagePickerController.dismiss(animated: true, completion: nil)
        if let videoURL = info[.mediaURL] as? URL {
            playVideo(videoURL: videoURL)
            self.videoURL = videoURL
        }
    }

    // MARK: - Save video method
    func saveVideo(videoURL: URL, videoName: String) {
        let fileManager = FileManager.default
        let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        let destinationURL = documentsDirectory.appendingPathComponent(videoName)

        do {
            try fileManager.moveItem(at: videoURL, to: destinationURL)
            print("Video guardado en: \(destinationURL.path)")
        } catch {
            print("Error al guardar el video: \(error.localizedDescription)")
        }
    }

    // MARK: - Play video method
    func playVideo(videoURL: URL) {
        let player = AVPlayer(url: videoURL)
            let playerLayer = AVPlayerLayer(player: player)
            playerLayer.frame = playerView.bounds
            playerView.layer.addSublayer(playerLayer)
            player.play()
    }
}
