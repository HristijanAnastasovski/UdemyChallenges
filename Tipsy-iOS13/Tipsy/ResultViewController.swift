//
//  ResultViewController.swift
//  Tipsy
//
//  Created by Hristijan Anastasovski on 4/16/20.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet weak var totalValueLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var perPersonValue: Double?
    var numberOfPeople: Int?
    var splitPercentage: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let people = numberOfPeople, let split = splitPercentage, let value = perPersonValue {
            totalValueLabel.text = String(format: "%.2f", value)
            descriptionLabel.text = "Split between \(people) people, with \(split)% tip"
        }
    }
    
    @IBAction func onRecalculateClick(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }

}
