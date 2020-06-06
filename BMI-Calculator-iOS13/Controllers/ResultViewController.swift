//
//  ResultViewController.swift
//  BMI-Calculator-iOS13
//
//  Created by Nadeem Ansari on 6/4/20.
//  Copyright © 2020 Nadeem Ansari. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    @IBOutlet weak var bmiLabel: UILabel!
    @IBOutlet weak var suggestionLabel: UILabel!
    @IBOutlet weak var recalculateBtn: UIButton!
    
    var bmiValue: Float? = nil
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        guard let bmiVal = bmiValue else { return }
        recalculateBtn.layer.cornerRadius = 10
        bmiLabel.text = String(format: "%.2f", bmiVal)
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
