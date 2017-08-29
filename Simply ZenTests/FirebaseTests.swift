//
//  FirebaseTests.swift
//  Simply Zen
//
//  Created by Daniel Pratt on 8/28/17.
//  Copyright © 2017 Daniel Pratt. All rights reserved.
//

import XCTest
import Firebase

class FirebaseTests: XCTestCase {
    
    var ref: DatabaseReference!
    
    override func setUp() {
        super.setUp()
        // Setup the firebase reference
        ref = Database.database().reference()
    }
    
    func test_getA_Message_notNil() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        var retrievedQuote: String?
        var retrievedAuthor: String?
        
        get(quoteNumber: 1) { (success, quote, author) in
            if success {
                retrievedQuote = quote
                retrievedAuthor = author
                XCTAssertNotNil(retrievedQuote)
                XCTAssertNotNil(retrievedAuthor)
            }
        }
    }
    
    func get(quoteNumber: Int, completion: @escaping (Bool, String, String) -> Void) {
        ref.child(String(describing: quoteNumber)).observeSingleEvent(of: .value, with: { (snapshot) in
            let value = snapshot.value as? NSDictionary
            let quote = value?["quote"] as? String ?? ""
            let author = value?["author"] as? String ?? ""
            print("Quote: \(String(describing: quote))")
            print("Author: \(String(describing: author))")
            completion(true, quote, author)
        })
    }
    
    func test_timeToRetrieveQuote_performance() {
        self.measure {
            self.test_getA_Message_notNil()
        }
    }
    
    
}
