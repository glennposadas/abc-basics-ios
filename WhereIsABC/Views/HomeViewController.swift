//
//  HomeViewController.swift
//  WhereIsABC
//
//  Created by Glenn Posadas on 12/11/20.
//

import UIKit

class HomeViewController: BaseViewController {

    // MARK: - Properties
    
    @IBOutlet weak var button_Play: UIButton!
    @IBOutlet weak var switch_UseZed: UISwitch!
    
    // MARK: - Overrides
    // MARK: Functions
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        
        playBGMusic()
        animatePlayButton()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        stopBGMusic()
    }
    
    private func setupViews() {
        
    }
    
    private func animatePlayButton() {
        button_Play.transform = CGAffineTransform(scaleX: 0.4, y: 0.4)
        
        UIView.animate(
            withDuration: 10.0,
            delay: 0,
            usingSpringWithDamping: 0.20,
            initialSpringVelocity: 5.0,
            options: .allowUserInteraction,
            animations: {
                self.button_Play.transform = CGAffineTransform.identity
            }) { (complete) in
            if complete {
                self.animatePlayButton()
            }
        }
    }
    
    @IBAction func play(_ sender: Any) {
        let gameController = mainSB.instantiateViewController(identifier: "GameViewController")
            as! GameViewController
        gameController.modalPresentationStyle = .fullScreen
        gameController.modalTransitionStyle = .crossDissolve
        self.present(gameController, animated: true, completion: nil)
    }
    
    @IBAction func useZedSwitchDidChange(_ sender: Any) {
        UserDefaults.standard.set(switch_UseZed.isOn, forKey: "DEFAULT_USE_ZED")
    }
}
