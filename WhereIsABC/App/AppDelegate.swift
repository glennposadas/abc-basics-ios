//
//  AppDelegate.swift
//  WhereIsABC
//
//  Created by Glenn Posadas on 12/6/20.
//

import AVFoundation
import Firebase
import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var audioPlayer: AVAudioPlayer?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
     
        FirebaseApp.configure()
        
        return true
    }
}

