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
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func OnTap(_ sender: Any) {
        // hide keyboard
        view.endEditing(true)
        
    }
    
    @IBAction func calculateTip(_ sender: Any) {
        
        // Get the bill amount
        let billAmt = Double(billAmountInput.text!) ?? 0
        
        
        // Calculate the tip
        let tipPercentages = [0.1, 0.18, 0.2]
        
        
        let tip = billAmt * tipPercentages[tipControl.selectedSegmentIndex]
        let totalBill = billAmt + tip
        
        // Update the tip and total labels
        tipLabel.text = String(format: "$%.2f", tip)
        totalBillAmount.text = String(format:"$%.2f", totalBill)
        
    }
    
}

