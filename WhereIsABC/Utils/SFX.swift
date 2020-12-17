//
//  SFX.swift
//  WhereIsABC
//
//  Created by Glenn Posadas on 12/17/20.
//

import AVFoundation
import Foundation

class SFX {
    
    // MARK: - Properties

    static let shared = SFX()
    private var bgPlayer: AVAudioPlayer?
    private var player: AVAudioPlayer?
    
    // MARK: - Overrides
    // MARK: Functions
    
    private init() {
        
    }
    
    private func playFile(_ fileName: String) {
        let soundFilePath = "\(Bundle.main.resourcePath ?? "")/\(fileName)"
        let soundFileURL = URL(fileURLWithPath: soundFilePath)
        
        player = try? AVAudioPlayer(contentsOf: soundFileURL)
        player?.volume = 1.0
        player?.play()
    }
    
    // MARK: - Questions
    
    func playQuestionForLetter(_ letter: Letter) {
        let useZed = AppDefaults.getObjectWithKey(.useZed, type: Bool.self) ?? false
        let fileName = (useZed ? "UK_" : "US_") + letter.stringValue.uppercased() + ".mp3"
        playFile(fileName)
    }
    
    // MARK: - Result
    
    func playCorrect() {
        playFile("correct2.mp3")
    }
    
    func playWrong() {
        playFile("wrong.mp3")
    }
    
    // MARK: - BG
    
    func playBGMusic() {
        let soundFilePath = "\(Bundle.main.resourcePath ?? "")/bg.mp3"
        let soundFileURL = URL(fileURLWithPath: soundFilePath)

        bgPlayer = try? AVAudioPlayer(contentsOf: soundFileURL)
        bgPlayer?.numberOfLoops = -1 //Infinite

        bgPlayer?.play()
    }
    
    func stopBGMusic() {
        bgPlayer?.stop()
    }
}
