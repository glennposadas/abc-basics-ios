//
//  GameModel.swift
//  WhereIsABC
//
//  Created by Glenn Posadas on 12/17/20.
//

import UIKit

class GameModel {
    
    // MARK: - Properties
    
    // MARK: - Overrides
    // MARK: Functions
    
    private func image(for letter: Letter) -> UIImage {
        UIImage(named: letter.stringValue.lowercased())!
    }
    
    func generateImages(for letters: [Letter]) -> [UIImage] {
        letters.map { image(for: $0) }
    }
    
    func newGame() -> [Letter] {
        var letters = [Letter]()
        
        for _ in 1..<5 {
            let letterIndex = Int.random(in: 1..<27)
            let newLetter = Letter(intValue: letterIndex)!
            letters.append(newLetter)
        }
        
        return letters
    }
}
