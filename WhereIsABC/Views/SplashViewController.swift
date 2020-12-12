//
//  SplashViewController.swift
//  WhereIsABC
//
//  Created by Glenn Posadas on 12/10/20.
//

import MorphingLabel
import UIKit

class SplashViewController: BaseViewController {

    // MARK: - Properties
    
    @IBOutlet weak var constraint_Top: NSLayoutConstraint!
    @IBOutlet weak var constraint_Bottom: NSLayoutConstraint!
    
    // MARK: - Overrides
    // MARK: Functions
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        self.animateViews()
    }
    
    private func setupViews() { }
    
    private func animateViews() {
        UIView.animate(withDuration: 1, delay: 1, usingSpringWithDamping: 0.5, initialSpringVelocity: 5, options: .curveEaseInOut, animations: {
            self.constraint_Top.constant = 50
            self.constraint_Bottom.constant = 50
            self.view.layoutIfNeeded()
        })
    }
}
