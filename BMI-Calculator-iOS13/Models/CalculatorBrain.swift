//
//  CalculatorBrain.swift
//  BMI-Calculator-iOS13
//
//  Created by Nadeem Ansari on 6/6/20.
//  Copyright © 2020 Nadeem Ansari. All rights reserved.
//

import Foundation
struct CalculatorBrain {
    private static let ToInches = Float(39.3701)
    private static let ToKilos = Float(0.453592)
    private static let BMIConst = Float(703)
    
    func calcBMI(weight: Float, height: Float) -> Float {
        let weightPounds = weight
        let heightInches = height * CalculatorBrain.ToInches
        let bmi = (CalculatorBrain.BMIConst * weightPounds)/(powf(heightInches, 2))
        return bmi
    }
    
    func convertToInches(_ heightInMeters: Float) -> Float {
        return heightInMeters * CalculatorBrain.ToInches
    }
    
    func convertToKilos(_ weightInPounds: Float) -> Float {
        return weightInPounds * CalculatorBrain.ToKilos
    }
}
