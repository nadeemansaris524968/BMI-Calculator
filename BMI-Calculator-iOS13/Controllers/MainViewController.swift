//
//  MainViewController.swift
//  BMI-Calculator-iOS13
//
//  Created by Nadeem Ansari on 6/4/20.
//  Copyright © 2020 Nadeem Ansari. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    @IBOutlet weak var heightLabelMeters: UILabel!
    @IBOutlet weak var heightLabelInches: UILabel!
    @IBOutlet weak var weightLabelPounds: UILabel!
    @IBOutlet weak var weightLabelKilos: UILabel!
    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var weightSlider: UISlider!
    @IBOutlet weak var calcButton: UIButton!
    
    var bmi: Float? = nil
    
    let calculatorBrain = CalculatorBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        calcButton.layer.cornerRadius = 10
    }
    
    @IBAction func heightChanged(_ sender: UISlider) {
        let heightMeters = sender.value
        let heightInches = calculatorBrain.convertToInches(heightMeters)
        heightLabelMeters.text = String(format: "%.2f m", heightMeters)
        heightLabelInches.text = String(format: "%.2f in", heightInches)
    }
    
    @IBAction func weightChanged(_ sender: UISlider) {
        let weightPounds = sender.value
        let weightKilos = calculatorBrain.convertToKilos(weightPounds)
        weightLabelPounds.text = String(format: "%.2f lbs", weightPounds)
        weightLabelKilos.text = String(format: "%.2f Kgs", weightKilos)
    }
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        bmi = calculatorBrain.calcBMI(weight: weightSlider.value, height: heightSlider.value)
        self.performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            guard let destinationVC = segue.destination as? ResultViewController else { return }
            destinationVC.bmiValue = bmi
        }
    }
}
