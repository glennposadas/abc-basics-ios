//
//  GameViewController.swift
//  WhereIsABC
//
//  Created by Glenn Posadas on 12/17/20.
//

import AVFoundation
import UIKit

class GameViewController: BaseViewController {
    
    // MARK: - Properties
    
    private var audioPlayer: AVAudioPlayer?
    
    // MARK: - Overrides
    // MARK: Functions
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    private func newGame() {
        
    }
    
    private func playCorrect() {
        playFile("correct2.mp3")
        delay(2) {
            self.newGame()
        }
    }
    
    private func playWrong() {
        playFile("wrong.mp3")
    }
    
    private func playFile(_ fileName: String) {
        let soundFilePath = "\(Bundle.main.resourcePath ?? "")/\(fileName)"
        let soundFileURL = URL(fileURLWithPath: soundFilePath)
        
        audioPlayer = try? AVAudioPlayer(contentsOf: soundFileURL)
        audioPlayer?.play()
    }
    
    @IBAction func exit(_ sender: Any) {
        alert(
            title: "Are you sure you want to exit?",
            message: nil,
            okayButtonTitle: "YES",
            cancelButtonTitle: "NO") { (didTapOk) in
            if didTapOk {
                self.dismiss()
            }
        }
    }
    
    @IBAction func repeatQuestion(_ sender: Any) {
        self.playWrong()
        delay(2) {
            self.playCorrect()
        }
    }
}
