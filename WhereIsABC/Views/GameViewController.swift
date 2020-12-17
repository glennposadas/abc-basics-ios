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
    
    var answer: Letter!
    var letters: [Letter]!
    var images: [UIImage]!
    
    var confettiView: SAConfettiView!
    
    // MARK: - Overrides
    // MARK: Functions
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        gameModel = GameModel()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        newGame()
    }
    
    private func setupView() {
        
    }
    
    private func addConfetti() {
        confettiView = SAConfettiView(frame: self.view.bounds)
        confettiView.intensity = 0.5
        confettiView.type = .image(UIImage(named: "ic_star")!)
        view.addSubview(confettiView)
        confettiView.startConfetti()
    }
    
    private func newGame() {
        let newGame = gameModel.newGame()
        letters = newGame.options
        answer = newGame.answer
        
        images = gameModel.generateImages(for: letters)
        
        for (index, button) in buttons.enumerated() {
            button.tag = letters[index].intValue!
            button.setBackgroundImage(images[index], for: .normal)
        }
        
        SFX.shared.playQuestionForLetter(answer)
    }
    
    private func correct() {
        if confettiView != nil {
            confettiView.removeFromSuperview()
        }
        
        addConfetti()
        
        SFX.shared.playCorrect()
        
        delay(3) {
            if self.confettiView != nil {
                self.confettiView.stopConfetti()
                self.confettiView.removeFromSuperview()
            }
            
            self.newGame()
        }
    }
    
    private func wrong() {
        SFX.shared.playWrong()
    }
    
    // MARK - IBActions
    
    @IBAction func selectAnswer(_ button: UIButton) {
        let letter = Letter(intValue: button.tag)
        
        if letter == answer {
            self.correct()
        } else {
            self.wrong()
        }
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
        SFX.shared.playQuestionForLetter(answer)
    }
}
