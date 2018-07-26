//
//  InchesAndCentimetersViewController.swift
//  InchesAndCentimeters
//
//  Created by Sam Dindyal on 2018-07-26.
//  Copyright © 2018 Sam Dindyal. All rights reserved.
//

import UIKit

class InchesAndCentimetersViewController: UIViewController {
    @IBOutlet var inchField: UITextField!
    @IBOutlet var centimeterField: UITextField!
    
    @IBAction func inchFieldChanged(_ sender: UITextField) {
        if sender.text!.isEmpty {
            centimeterField.text = ""
        } else if let inchValue = Float(sender.text!) {
            self.inchValue = inchValue
            self.centimeterValue = convertToCentimeters(from: self.inchValue)
            centimeterField.text = "\(self.centimeterValue)"
        } else {
            centimeterField.text = "???"
        }
    }
    
    @IBAction func centimeterFieldChanged(_ sender: UITextField) {
        if sender.text!.isEmpty {
            centimeterField.text = ""
        } else if let centimeterValue = Float(sender.text!) {
            self.centimeterValue = centimeterValue
            self.inchValue = convertToInches(from: self.centimeterValue)
            inchField.text = "\(self.inchValue)"
        } else {
            inchField.text = "???"
        }
    }
    
    var inchValue:Float = 0.0
    var centimeterValue:Float = 0.0
    
    func convertToCentimeters(from inchValue: Float) -> Float {
        return inchValue * 2.54
    }
    
    func convertToInches(from centimeterValue: Float) -> Float{
        return centimeterValue / 2.54
    }
}
