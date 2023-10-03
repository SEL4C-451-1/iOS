//
//  Activity3_2UploadViewController.swift
//  SEL4C
//
//  Created by Esther Ramírez on 28/09/23.
//

import UIKit
import AVFoundation
import Foundation

class Activity3_2UploadViewController: UIViewController, AVAudioPlayerDelegate, AVAudioRecorderDelegate {

    @IBOutlet weak var reproducirBTN: UIButton!
    
    @IBOutlet weak var grabarBTN: UIButton!
    
    var soundRecorder = AVAudioRecorder()
    var soundPlayer = AVAudioPlayer()
    var audioFileURL: URL!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupRecorder()

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func setupRecorder() {
            let audioFilename = getDocumentsDirectory().appendingPathComponent("audioRecording.m4a")
                
            let recordSettings: [String: Any] = [
                AVEncoderAudioQualityKey: AVAudioQuality.max.rawValue,
                AVEncoderBitRateKey: 320000,
                AVNumberOfChannelsKey: 2,
                AVSampleRateKey: 44100.0,
                AVFormatIDKey: kAudioFormatMPEG4AAC // Utiliza el formato AAC para mayor compatibilidad
            ]
            
            do {
                soundRecorder = try AVAudioRecorder(url: audioFilename, settings: recordSettings)
                soundRecorder.delegate = self
                soundRecorder.prepareToRecord()
            } catch {
                print("Error al configurar el grabador de audio: \(error.localizedDescription)")
            }
        }
    
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        if flag {
            // La reproducción ha finalizado exitosamente
            print("Reproducción exitosa")
        } else {
            // Hubo un error en la reproducción
            print("Error en la reproducción")
        }
    }
    
    func audioRecorderDidFinishRecording(_ recorder: AVAudioRecorder, successfully flag: Bool) {
        if flag {
            // La grabación ha finalizado exitosamente
            print("Grabación exitosa")
        } else {
            // Hubo un error en la grabación
            print("Error en la grabación")
        }
    }
    
    @IBAction func grabar(_ sender: Any) {
        if !soundRecorder.isRecording {
               soundRecorder.record()
               grabarBTN.setTitle("Detener", for: .normal)
           } else {
               soundRecorder.stop()
               grabarBTN.setTitle("Grabar", for: .normal)
           }
       }
 
    
    @IBAction func reproducir(_ sender: Any) {
        do {
            soundPlayer = try AVAudioPlayer(contentsOf: soundRecorder.url)
            soundPlayer.delegate = self
            soundPlayer.play()
        } catch {
            print("Error al reproducir el audio: \(error.localizedDescription)")
        }
    }
    func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
}

