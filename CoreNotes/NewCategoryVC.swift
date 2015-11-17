//
//  NewCategoryVC.swift
//  CoreNotes
//
//  Created by Paul Vagner on 11/16/15.
//  Copyright © 2015 Paul Vagner. All rights reserved.
//

import UIKit
import CoreData


class NewCategoryVC: UIViewController {

    
    @IBOutlet weak var categoryNameField: UITextField!
    
   
    @IBOutlet weak var categoryDatePicker: UIDatePicker!
    
    
    @IBAction func Cancel(sender: AnyObject) {

        dismissViewControllerAnimated(true, completion: nil)
        
    }
    
    @IBAction func create(sender: AnyObject) {
    
      createCategory()
    dismissViewControllerAnimated(true, completion: nil)
        
        
    }

}
