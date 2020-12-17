//
//  AppDelegate.swift
//  WhereIsABC
//
//  Created by Glenn Posadas on 12/6/20.
//

import Firebase
import UIKit

let mainSB = UIStoryboard(name: "Main", bundle: nil)

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
     
        FirebaseApp.configure()
        
        return true
    }
}

