//
//  BaseViewController.swift
//  WhereIsABC
//
//  Created by Glenn Posadas on 12/11/20.
//

import UIKit

class BaseViewController: UIViewController {
    
    // MARK: - Properties
    
    override var prefersStatusBarHidden: Bool {
        true
    }
    
    // MARK: - Overrides
    // MARK: Functions
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    /// Start playing the bg music.
    func playBGMusic() {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        appDelegate.playBGMusic()
    }
    
    /// Stop the bg music
    func stopBGMusic() {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        appDelegate.playBGMusic()
    }
}
