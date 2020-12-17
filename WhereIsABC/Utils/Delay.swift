//
//  Delay.swift
//  WhereIsABC
//
//  Created by Glenn Posadas on 12/17/20.
//

import Foundation

func delay(_ seconds: Int, block: @escaping (()->())) {
    DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(seconds), execute: block)
}
