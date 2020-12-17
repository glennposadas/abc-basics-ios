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
    
    var gameModel: GameModel!
    
    @IBOutlet var buttons: [UIButton]!
    
    var letters: [Letter]!
    var images: [UIImage]!
    
    // MARK: - Overrides
    // MARK: Functions
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        gameModel = GameModel()
        newGame()
    }
    
    private func newGame() {
        letters = gameModel.newGame()
        images = gameModel.generateImages(for: letters)
        
        for (index, button) in buttons.enumerated() {
            button.tag = letters[index].intValue!
            button.setBackgroundImage(images[index], for: .normal)
        }
    }
    
    private func correct() {
        SFX.shared.playCorrect()
        delay(3) {
            self.newGame()
        }
    }
    
    private func wrong() {
        SFX.shared.playWrong()
    }
    
    // MARK - IBActions
    
    @IBAction func selectAnswer(_ sender: Any) {
        
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
