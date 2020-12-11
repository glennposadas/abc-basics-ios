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
    
    @IBOutlet weak var label_Title1: LTMorphingLabel!
    @IBOutlet weak var label_Title2: LTMorphingLabel!
    
    // MARK: - Overrides
    // MARK: Functions
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupLabels()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        animateLabels(withDelay: 1)
    }
    
    private func setupLabels() {
        let title1FontScale: CGFloat = 0.2
        let title2FontScale: CGFloat = 0.4
        
        let screenHeight = self.view.frame.height
        
        label_Title1.adjustsFontSizeToFitWidth = true
        label_Title2.adjustsFontSizeToFitWidth = true
        
        label_Title1.font = UIFont(name: "Beachday", size: screenHeight * title1FontScale)
        label_Title2.font = UIFont(name: "Beachday", size: screenHeight * title2FontScale)
    }
    
    private func animateLabels(withDelay delay: Int = 0) {
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(delay)) {
            self.label_Title1.morphingEffect = .fall
            self.label_Title1.text = "Where is"
            
            self.label_Title2.morphingEffect = .scale
            self.label_Title2.text = "ABC"
        }
    }
}
