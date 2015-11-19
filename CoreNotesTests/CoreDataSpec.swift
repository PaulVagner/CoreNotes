//
//  CoreDataSpec.swift
//  CoreNotes
//
//  Created by Paul Vagner on 11/19/15.
//  Copyright © 2015 Paul Vagner. All rights reserved.
//

import Quick
import Nimble
@testable import CoreNotes


class CoreDataSpec: QuickSpec {
    
    override func spec() {
        
        fit("is good math") { () -> () in
            
            let num1 = 5
            let num2 = 7
            
            expect(num1 + num2).to(equal(12))
            
        }
        
        it("is an empty String") { () -> () in
            
            expect("not empty").to(equal(""))
        }
        
    }
}





