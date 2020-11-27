//
//  Calculations.swift
//  Calculator
//
//  Created by Menesidis on 27/11/20.
//

import Foundation

public extension Double {

    func add() -> Double {
        return self + 1
    }
    
    func multiply() -> Double {
        return self * self
    }
    
    func subtract() -> Double {
        return self - 1
    }
    
    func clear() -> Double {
        return 0.0
    }
}
