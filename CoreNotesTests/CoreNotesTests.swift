//
//  CoreNotesTests.swift
//  CoreNotesTests
//
//  Created by Paul Vagner on 11/16/15.
//  Copyright © 2015 Paul Vagner. All rights reserved.
//


import XCTest
import CoreData


@testable import CoreNotes

class CoreNotesTests: XCTestCase, Fetchable {
    
    var button: UIButton?
    var categoriesCount = 0
    
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        button = UIButton(frame: CGRectZero)
        fetchEntity("Category", predicates: nil) { (found) -> () in
            
            self.categoriesCount = found.count
            print(found.count)
            
        }
        
        
        print("byaaah!!!")
        
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
       
        guard let _appDelegate = UIApplication.sharedApplication().delegate as? AppDelegate else { return }

        fetchEntity("Category", predicates: nil) { (found) -> () in
            
            let categories = found as? [NSManagedObject] ?? []
            
            for category in categories {
               
                _appDelegate.managedObjectContext.deleteObject(category)
                
            }
        
        
        
        
        }
        
        //we are going to remove all categories
        super.tearDown()
    }
    
    func testButtonDidSetTitle() {
        
        button?.setTitle("Push Me Now!!!", forState: .Normal)
        
        XCTAssertTrue(!(button?.titleLabel?.text ?? "").isEmpty, "The button title text is Empty")
        
        
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testButtonDidNotSetTitle() {
        // This is an example of a performance test case.
        XCTAssertTrue((button?.titleLabel?.text ?? "").isEmpty, "The button title text is not Empty")
        
    }
    
    func testCreateNewCategory() {
        
        let newCategory = Category.category()
        
        newCategory?.name = "Steve"
        
        XCTAssertEqual(newCategory?.valueForKey("name") as? String ?? "", "Steve", "Category name set incorrectly or not set at all" )
        XCTAssertEqual(newCategory?.name ?? "", "Steve", "Not able to get value for \"name\" using the name property or was not set previously")
        //run test to make sure the category has a value for "name"
        
        
        newCategory?.color = UIColor.softRed()
        // run test to make sure the category has a value for "color"
        
        guard let _appDelegate = UIApplication.sharedApplication().delegate as? AppDelegate else { return }
        
        _appDelegate.saveContext()
        //run test to make sure you can fetch a category named "Steve"
        
        fetchEntity("Category", predicates: nil) { (found) -> () in
            
            let categories = found as? [NSManagedObject] ?? []
            
            let categoryNames = categories.map ({ (c) -> String in
                
                return c.valueForKey("name") as? String ?? ""
                
            })
            
            XCTAssertTrue(categoryNames.contains("Steve"), "Unable to fetch the category named \"Steve\" or was never saved properly")
        
            XCTAssertEqual(self.categoriesCount + 1, found.count, "Category count is not incrementing correctly.")

        }
        
    }
    
}









