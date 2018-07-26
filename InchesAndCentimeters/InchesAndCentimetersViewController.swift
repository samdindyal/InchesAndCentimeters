//
//  InchesAndCentimetersViewController.swift
//  InchesAndCentimeters
//
//  Created by Sam Dindyal on 2018-07-26.
//  Copyright © 2018 Sam Dindyal. All rights reserved.
//

import UIKit

class InchesAndCentimetersViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet var inchField: UITextField!
    @IBOutlet var centimeterField: UITextField!
    @IBOutlet var inchLabel: UILabel!
    
    @IBAction func inchFieldChanged(_ sender: UITextField) {
        if sender.text!.isEmpty {
            centimeterField.text = ""
        } else if let inchValue = Float(sender.text!) {
            self.inchValue = inchValue
            self.centimeterValue = convertToCentimeters(from: self.inchValue)
            centimeterField.text = numberFormatter.string(from: NSNumber(value: self.centimeterValue))
        } else {
            centimeterField.text = "???"
        }
        
        inchLabel.text = "INCH\(self.inchValue == 1 ? "" : "ES")"
    }
    
    @IBAction func centimeterFieldChanged(_ sender: UITextField) {
        if sender.text!.isEmpty {
            centimeterField.text = ""
        } else if let centimeterValue = Float(sender.text!) {
            self.centimeterValue = centimeterValue
            self.inchValue = convertToInches(from: self.centimeterValue)
            inchField.text = numberFormatter.string(from: NSNumber(value: self.inchValue))
        } else {
            inchField.text = "???"
        }
        inchLabel.text = "INCH\(self.inchValue == 1 ? "" : "ES")"
    }
    
    var inchValue:Float = 0.0
    var centimeterValue:Float = 0.0
    
    var numberFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.minimumFractionDigits = 0
        formatter.maximumFractionDigits = 3
        return formatter
    }()
    
    func convertToCentimeters(from inchValue: Float) -> Float {
        return inchValue * 2.54
    }
    
    func convertToInches(from centimeterValue: Float) -> Float{
        return centimeterValue / 2.54
    }
    
    func textField(_ textField: UITextField,
                   shouldChangeCharactersIn range: NSRange,
                   replacementString string: String) -> Bool {
        
        let existingTextHasSeparator = textField.text?.range(of: ".")
        let replacementTextHasSeparator = string.range(of: ".")
        
        return existingTextHasSeparator == nil || replacementTextHasSeparator == nil
    }
}
