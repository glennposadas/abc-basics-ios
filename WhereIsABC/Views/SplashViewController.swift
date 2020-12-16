//
//  SplashViewController.swift
//  WhereIsABC
//
//  Created by Glenn Posadas on 12/10/20.
//

import UIKit

class SplashViewController: BaseViewController {

    // MARK: - Properties
    
    @IBOutlet weak var constraint_Top: NSLayoutConstraint!
    @IBOutlet weak var constraint_Bottom: NSLayoutConstraint!
    @IBOutlet weak var imageView_SplashIcon: UIImageView!
    
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
        })  {_ in
            UIView.animate(withDuration: 0.5, delay: 1, animations: {
                self.imageView_SplashIcon.alpha = 0
            }) { _ in
                self.goToHome()
            }
        }
    }
    
    // MARK: - Navigations
    
    private func goToHome() {
        let homeVC = mainSB.instantiateViewController(identifier: "HomeViewController")
            as! HomeViewController
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
              let sceneDelegate = windowScene.delegate as? SceneDelegate,
              let window = sceneDelegate.window else { return }
        
        window.rootViewController = homeVC
        
        UIView.transition(
            with: window,
            duration: 1.0,
            options: [.transitionCrossDissolve],
            animations: { },
            completion: nil
        )
    }
}
