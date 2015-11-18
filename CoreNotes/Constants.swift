//
//  Constants.swift
//  CoreNotes
//
//  Created by Paul Vagner on 11/18/15.
//  Copyright © 2015 Paul Vagner. All rights reserved.
//

import UIKit

extension UIColor {
    
    class func softGrey() -> UIColor { return UIColor(red:0.19, green:0.19, blue:0.19, alpha:1) }

    class func softRed() -> UIColor { return UIColor(hue:0.99, saturation:0.64, brightness:0.93, alpha:1) }

    class func softGreen() -> UIColor { return UIColor(hue:0.27, saturation:0.62, brightness:0.83, alpha:1) }
}


extension UIViewController: UITextFieldDelegate {
    
    
    
    public func textFieldShouldReturn(textField: UITextField) -> Bool {
       
        textField.resignFirstResponder()
        
        return true
    }
    
}