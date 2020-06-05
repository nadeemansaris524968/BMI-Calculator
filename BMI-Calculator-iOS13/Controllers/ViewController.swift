//
//  ViewController.swift
//  BMI-Calculator-iOS13
//
//  Created by Nadeem Ansari on 6/4/20.
//  Copyright © 2020 Nadeem Ansari. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var heightLabelMeters: UILabel!
    @IBOutlet weak var heightLabelInches: UILabel!
    @IBOutlet weak var weightLabelPounds: UILabel!
    @IBOutlet weak var weightLabelKilos: UILabel!
    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var weightSlider: UISlider!
    @IBOutlet weak var calcButton: UIButton!
    
    let toInches = Float(39.3701)
    let toKilos = Float(0.45)
    let bmiConst = Float(703)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        calcButton.layer.cornerRadius = 10
    }
    
    @IBAction func heightChanged(_ sender: UISlider) {
        let heightMeters = sender.value
        let heightInches = heightMeters * toInches
        heightLabelMeters.text = String(format: "%.2f m", heightMeters)
        heightLabelInches.text = String(format: "%.2f in", heightInches)
    }
    
    @IBAction func weightChanged(_ sender: UISlider) {
        let weightPounds = sender.value
        let weightKilos = weightPounds * toKilos
        weightLabelPounds.text = String(format: "%.1f lbs", weightPounds)
        weightLabelKilos.text = String(format: "%.1f Kgs", weightKilos)
    }
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        let weightPounds = weightSlider.value
        let heightInches = heightSlider.value * toInches
        let bmi = (bmiConst * weightPounds)/(powf(heightInches, 2))
        print("BMI: \(String(format: "%.2f", bmi))")
    }
}
