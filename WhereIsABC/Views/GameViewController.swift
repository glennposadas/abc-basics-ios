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
    
    // MARK: - Overrides
    // MARK: Functions
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    private func newGame() {
        
    }
    
    private func correct() {
        SFX.shared.playCorrect()
        delay(2) {
            self.newGame()
        }
    }
    
    private func wrong() {
        SFX.shared.playWrong()
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
        self.wrong()
        delay(2) {
            self.correct()
        }
    }
}
