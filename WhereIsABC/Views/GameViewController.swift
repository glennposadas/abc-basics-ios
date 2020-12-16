//
//  GameViewController.swift
//  WhereIsABC
//
//  Created by Glenn Posadas on 12/17/20.
//

import UIKit

class GameViewController: BaseViewController {
    
    // MARK: - Properties
    
    // MARK: - Overrides
    // MARK: Functions
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
        
    }
}
