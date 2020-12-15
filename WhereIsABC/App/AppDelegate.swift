//
//  AppDelegate.swift
//  WhereIsABC
//
//  Created by Glenn Posadas on 12/6/20.
//

import AVFoundation
import Firebase
import UIKit

let mainSB = UIStoryboard(name: "Main", bundle: nil)

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var audioPlayer: AVAudioPlayer?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
     
        FirebaseApp.configure()
        
        return true
    }
    
    func playBGMusic() {
        let soundFilePath = "\(Bundle.main.resourcePath ?? "")/bg.mp3"
        let soundFileURL = URL(fileURLWithPath: soundFilePath)

        self.audioPlayer = try? AVAudioPlayer(contentsOf: soundFileURL)
        self.audioPlayer?.numberOfLoops = -1 //Infinite

        self.audioPlayer?.play()
    }
}

