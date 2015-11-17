//
//  Buttons.swift
//  CoreNotes
//
//  Created by Paul Vagner on 11/17/15.
//  Copyright © 2015 Paul Vagner. All rights reserved.
//

import UIKit

@IBDesignable class buttons: UIButton {
        
@IBInspectable var cornerRadius: CGFloat = 0
        
        
        override func drawRect(rect: CGRect) {
            
            layer.cornerRadius = cornerRadius
            layer.masksToBounds = true
            layer.borderWidth = borderWidth
            layer.borderColor = borderColor
            
        }
        
        @IBInspectable var borderWidth: CGFloat = 0
        
        @IBInspectable var borderColor: CGColor = UIColor.purpleColor().CGColor
    }

    

