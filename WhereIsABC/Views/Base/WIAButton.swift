//
//  WIAButton.swift
//  WhereIsABC
//
//  Created by Glenn Posadas on 12/14/20.
//

import UIKit

class WIAButton: UIButton {

    // MARK: - Properties
    
    private(set) var letter: String!
    private(set) var image: UIImage!
    
    // MARK: - Overrides
    // MARK: Functions
    
    private override init(frame: CGRect) {
        super.init(frame: .zero)
    }
    
    init(letter: String) {
        super.init(frame: .zero)
        
        self.letter = letter
        self.image = letter.gameIcon()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
