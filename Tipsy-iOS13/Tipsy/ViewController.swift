//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var totalBillTextField: UITextField!
    @IBOutlet weak var zeroPercentTipBtn: UIButton!
    @IBOutlet weak var tenPercentTipBtn: UIButton!
    @IBOutlet weak var twentyPercentTipBtn: UIButton!
    @IBOutlet weak var splitValue: UILabel!
    
    var selectedTipPercent = 10
    var totalBill: Double?
    var numberOfPeople: Double = 2
    
    
    @IBAction func onTipPercentClick(_ sender: UIButton) {
        var tipPercent = sender.title(for: .normal)!
        tipPercent = String(tipPercent.dropLast())
        selectedTipPercent = Int(tipPercent)!
        updateSelectedTipUI()
        view.endEditing(true)
    }
    
    @IBAction func splitValueClick(_ sender: UIStepper) {
        splitValue.text = String(format: "%.0f", sender.value)
        numberOfPeople = sender.value
    }
    
    @IBAction func calculateButtonPressed(_ sender: Any) {
        guard totalBillTextField != nil else {
            return
        }
        
        totalBill = Double(totalBillTextField.text!)!
        performSegue(withIdentifier: "toResultSegue", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toResultSegue" {
            let resultController = segue.destination as! ResultViewController
            resultController.numberOfPeople = Int(splitValue.text!)
            resultController.splitPercentage = selectedTipPercent
            resultController.perPersonValue =  totalBill! * (1 + Double(selectedTipPercent)/100) / numberOfPeople
            
        }
    }
    
    func resetButtonsUI(){
        zeroPercentTipBtn.isSelected = false
        tenPercentTipBtn.isSelected = false
        twentyPercentTipBtn.isSelected = false
    }
    
    func updateSelectedTipUI(){
        resetButtonsUI()
        switch selectedTipPercent {
        case 0:
            zeroPercentTipBtn.isSelected = true
        case 10:
            tenPercentTipBtn.isSelected = true
        default:
            twentyPercentTipBtn.isSelected = true
        }
    }
}

