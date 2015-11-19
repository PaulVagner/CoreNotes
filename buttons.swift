//
//  Buttons.swift
//  CoreNotes
//
//  Created by Paul Vagner on 11/17/15.
//  Copyright © 2015 Paul Vagner. All rights reserved.
//

import UIKit
/// Creates an @IBDesignable class with name "button" <- @IBDesignable allows the user to access @IBInspectable options
@IBDesignable class buttons: UIButton {

/// Creates an @IBInspectable variable with name "cornerRadius" and sets it to a value of CGFloat which is = to 0
@IBInspectable var cornerRadius: CGFloat = 0
        
    /**
     Sets up the @IBInspectable options
     
     - parameter rect: Draws the Rectangle with specified parameters
     */
        override func drawRect(rect: CGRect) {
            
            layer.cornerRadius = cornerRadius
            layer.masksToBounds = true
            layer.borderWidth = borderWidth
            layer.borderColor = borderColor
            
        }
 /// Creates an @IBInspectable variable with name "borderWidth" and sets it to a value of CGFloat which is = to 0
        @IBInspectable var borderWidth: CGFloat = 0
 /// Creates an @IBInspectable variable with name "borderColor" and sets it to a value of CGColor which is set to purpleColor
        @IBInspectable var borderColor: CGColor = UIColor.purpleColor().CGColor
    }

    

