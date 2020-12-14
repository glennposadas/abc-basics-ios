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
        
        animatePlayButton()
    }
    
    private func setupViews() {
        
    }
    
    private func animatePlayButton() {
        button_Play.transform = CGAffineTransform(scaleX: 0.6, y: 0.6)
        
        UIView.animate(
            withDuration: 2.0,
            delay: 0,
            usingSpringWithDamping: 0.20,
            initialSpringVelocity: 6.0,
            options: .allowUserInteraction,
            animations: {
                self.button_Play.transform = CGAffineTransform.identity
        }) { (complete) in
            if complete {
                self.animatePlayButton()
            }
        }
    }
    
    @IBAction func useZedSwitchDidChange(_ sender: Any) {
        UserDefaults.standard.set(switch_UseZed.isOn, forKey: "DEFAULT_USE_ZED")
    }
}
