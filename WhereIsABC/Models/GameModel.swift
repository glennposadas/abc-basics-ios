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
    
    private func getRandomNumbers(maxNumber: Int, listSize: Int) -> [Int] {
        var randomNumbers = Set<Int>()
        while randomNumbers.count < listSize {
            let randomNumber = Int.random(in: 1..<maxNumber + 1)
            randomNumbers.insert(randomNumber)
        }
        
        return Array(randomNumbers)
    }
    
    /// Returns the correct answer and all of the options in a tuple.
    func newGame() -> (answer: Letter, options: [Letter]) {
        var letters = [Letter]()
        
        letters = getRandomNumbers(maxNumber: 4, listSize: 4)
            .compactMap { Letter(intValue: $0) }
        
        let answerIndex = Int.random(in: 1..<5)
        let answer = letters[answerIndex - 1]
        
        return (answer, letters)
    }
}
