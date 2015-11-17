
//  NotesTVC.swift
//  CoreNotes

//  Created by Paul Vagner on 11/16/15.
//  Copyright © 2015 Paul Vagner. All rights reserved.


import UIKit
import CoreData


class NotesTVC: UITableViewController {

    
    
    var categories: [[String:AnyObject]] = []
    
    
    
//    [ //array of categories
//
//   [ //category dictionary
//
//    "category" : NSManagedObject,
//        
//    "notes" : [ //notes array
//        
//                NSManagedObject, //note object
//                NSManagedObject  //note object
//        
//           ]
//    
//        ]
//    
//    ]
    
    
    
    //    var notes: [NSManagedObject] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        guard let appD = UIApplication.sharedApplication().delegate as? AppDelegate else { return }
        
            let categoryRequest = NSFetchRequest(entityName: "Category")
        
            let foundCategories = (try? appD.managedObjectContext.executeFetchRequest(categoryRequest) as? [NSManagedObject] ?? []) ?? []
        
        for category in foundCategories {
            
           let newCatDictionary = [
            
            "category" : category,
            "notes" : []
            
            
            ]
            
            categories.append(newCatDictionary)
            
        }
            //make a fetch request to fill tableview with notes where sections = categories
    
        print(categories)
        
    tableView.reloadData()
    
    }

   

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        return categories.count
    
        
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
    let category = categories[section]
    let notes = category["notes"] as? [AnyObject]
    return notes?.count ?? 0
        
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("NoteCell", forIndexPath: indexPath)

        //get current note and set content
        
        return cell
    }
    

    
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        
        if editingStyle == .Delete {
            
            
            //remove note from coredata
            
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        
        
        }
    
    }
    //section header layout methods
    override func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let category = categories[section]
        let managedObject = category["category"] as? NSManagedObject
        let name = managedObject?.valueForKey("name") as? String
        
        let view = UIView(frame: CGRect(x: 20, y: 0, width: 200, height: 40))
            view.backgroundColor = UIColor(white: 0, alpha: 0.5)
        
        let label = UILabel(frame: view.frame)
        label.textColor = UIColor.whiteColor()
        label.text = name
        view.addSubview(label)
        
        return view
    }
    
    override func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        return 40
        
    }
    
}
