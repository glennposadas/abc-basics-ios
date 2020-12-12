//
//  String+GameIcon.swift
//  WhereIsABC
//
//  Created by Glenn Posadas on 12/13/20.
//

import UIKit

extension String {
    var isALetter: Bool {
        return !isEmpty && range(of: "[^a-zA-Z]", options: .regularExpression) == nil
    }
    
    func gameIcon() -> UIImage? {
        guard self.isALetter else { return nil }
        
        return UIImage(named: self)
    }
}
