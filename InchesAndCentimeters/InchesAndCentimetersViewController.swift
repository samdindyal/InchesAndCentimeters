//
//  InchesAndCentimetersViewController.swift
//  InchesAndCentimeters
//
//  Created by Sam Dindyal on 2018-07-26.
//  Copyright © 2018 Sam Dindyal. All rights reserved.
//

import UIKit

class InchesAndCentimetersViewController: UIViewController {
    var inchValue:Float = 0.0 {
        didSet {
            self.centimeterValue = convertToCentimeters(from: self.inchValue)
        }
    }
    
    var centimeterValue:Float = 0.0 {
        didSet {
            self.inchValue = convertToInches(from: self.centimeterValue)
        }
    }
    
    func convertToCentimeters(from inchValue: Float) -> Float {
        return inchValue * 2.54
    }
    
    func convertToInches(from centimeterValue: Float) -> Float{
        return centimeterValue / 2.54
    }
}
