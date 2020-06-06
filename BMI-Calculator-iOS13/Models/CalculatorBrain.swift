//
//  CalculatorBrain.swift
//  BMI-Calculator-iOS13
//
//  Created by Nadeem Ansari on 6/6/20.
//  Copyright © 2020 Nadeem Ansari. All rights reserved.
//

import UIKit
struct CalculatorBrain {
    private static let ToInches = Float(39.3701)
    private static let ToKilos = Float(0.453592)
    private static let BMIConst = Float(703)
    private static let UNDER_WEIGHT_ADVICE = "You're underweight! Eat healthy!"
    private static let NORMAL_WEIGHT_ADVICE = "You're doing just fine. Keep at it."
    private static let OVER_WEIGHT_ADVICE = "You're overweight! Exercise and eat healthy."
    
    func calcBMI(weight: Float, height: Float) -> BMI {
        let weightPounds = weight
        let heightInches = height * CalculatorBrain.ToInches
        let bmiVal = (CalculatorBrain.BMIConst * weightPounds)/(powf(heightInches, 2))
        let bmiAdvice = getAdvice(for: bmiVal)
        let bmiColor = getColor(for: bmiVal)
        
        return BMI(value: bmiVal, advice: bmiAdvice, color: bmiColor)
    }
    
    private func getAdvice(for bmiVal: Float) -> String {
        var advice: String = ""
        if bmiVal < 18.5 {
            advice = CalculatorBrain.UNDER_WEIGHT_ADVICE
        } else if bmiVal < 24.9 {
            advice = CalculatorBrain.NORMAL_WEIGHT_ADVICE
        } else {
            advice = CalculatorBrain.OVER_WEIGHT_ADVICE
        }
        return advice
    }
    
    private func getColor(for bmiVal: Float) -> UIColor {
        var color: UIColor = UIColor()
        if bmiVal < 18.5 {
            color = #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)
        } else if bmiVal < 24.9 {
            color = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
        } else {
            color = #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)
        }
        return color
    }
    
    func convertToInches(_ heightInMeters: Float) -> Float {
        return heightInMeters * CalculatorBrain.ToInches
    }
    
    func convertToKilos(_ weightInPounds: Float) -> Float {
        return weightInPounds * CalculatorBrain.ToKilos
    }
}
