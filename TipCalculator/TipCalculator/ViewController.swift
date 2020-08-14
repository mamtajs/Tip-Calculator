//
//  ViewController.swift
//  TipCalculator
//
//  Created by Mamta Shah on 8/13/20.
//  Copyright © 2020 Mamta Shah. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billAmountInput: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalBillAmount: UILabel!
    
    @IBOutlet weak var tipPercentLabel: UILabel!
    @IBOutlet weak var slider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        billAmountInput.becomeFirstResponder()
       
        let defaults = UserDefaults.standard
        let token = defaults.string(forKey: "tipPercent")
        
        if(token == nil){
            let defaultValue = ["tipPercent" : 10]
            defaults.register(defaults: defaultValue)
        }
        
        var percent:Int = defaults.integer(forKey: "tipPercent")
        //print(percent)
        if(percent == 0){
            percent = 10
        }
        slider.value = Float(percent)
        
        tipPercentLabel.text = String.init(format: "%d%%", percent )
    }
    
    
    @IBAction func sliderValueChanged(_ sender: UISlider) {
        
        //print(sender.value)
        tipPercentLabel.text = String.init(format: "%d%%", Int(sender.value))
        
        let defaults = UserDefaults.standard
        
        defaults.set(sender.value, forKey: "tipPercent")
        
        self.calculateTip()
    }
    
    @IBAction func OnTap(_ sender: Any) {
        // hide keyboard
        view.endEditing(true)
        
    }
    
    @IBAction func calculateTip() {
        
        // Get the bill amount
        let billAmt = Float(billAmountInput.text!) ?? 0
        
        
        // Calculate the tip
        print(Int(slider.value))
        let tipMultiplier = floor(slider.value)/100
        print(tipMultiplier)
        let tip = billAmt * tipMultiplier
        print(tip)
        let totalBill = billAmt + tip
        
        // Update the tip and total labels
        tipLabel.text = String(format: "$%.2f", tip)
        totalBillAmount.text = String(format:"$%.2f", totalBill)
        
    }
    
}

