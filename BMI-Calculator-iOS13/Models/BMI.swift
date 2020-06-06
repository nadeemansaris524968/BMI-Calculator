//
//  BMI.swift
//  BMI-Calculator-iOS13
//
//  Created by Nadeem Ansari on 6/6/20.
//  Copyright © 2020 Nadeem Ansari. All rights reserved.
//

import UIKit

struct BMI {
    let value: Float
    let advice: String
    let color: UIColor
    
    init(value: Float, advice: String, color: UIColor) {
        self.value = value
        self.advice = advice
        self.color = color
    }
}
