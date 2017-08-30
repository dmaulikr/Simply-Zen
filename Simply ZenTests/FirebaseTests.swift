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
    
    let QuotesCountKey = "count"
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
    
    // This tests gets a specific quote, and  ensures it is correct
    func test_retrieveSpecificQuote_QuoteIsExpectedQuote() {
        var retrievedQuote: String?
        var retrievedAuthor: String?
        
        let expectedQuote = "Sleep is the best meditation."
        let expectedAuthor = "Dalai Lama"
        
        get(quoteNumber: 1) { (success, quote, author) in
            if success {
                retrievedQuote = quote
                retrievedAuthor = author
                XCTAssertEqual(retrievedQuote, expectedQuote)
                XCTAssertEqual(retrievedAuthor, expectedAuthor)
            }
        }
    }
    
    
    // This test needs to be updated anytime I update the quotes database
    // Currently expected the count to be 4
    func test_retrieveCount_countIsFour() {
        
        let expectedCount = 4
        
        getNumQuotes { (success, count) in
            if success {
                XCTAssertEqual(count, expectedCount)
            } else {
                XCTFail()
            }
        }
    }
    
    // MARK: - Performance Testing
    
    // Test time it takes to retreive one quote
    func test_timeToRetrieveQuote_performance() {
        self.measure {
            self.test_getA_Message_notNil()
        }
    }
    
    // Test time it takes to retrieve several quotes
    // Also makes sure that quotes are not being requested out of bounds
    func test_retrieveMultipleQuotes_getsValidQuotes() {
        self.measure {
            self.getNumQuotes { (success, count) in
                if success {
                    let quoteNumber = Int(arc4random_uniform(UInt32(count)) + 1) // Make sure range is 1-upper bound
                    self.get(quoteNumber: quoteNumber, completion: { (success, quote, author) in
                        if success {
                            XCTAssertNotNil(quote)
                            XCTAssertNotNil(author)
                        } else {
                            XCTFail()
                        }
                    })
                } else {
                    XCTFail()
                }
            }
        }
    }
    
    // MARK: - Helper Functions
    
    // Return the quote for the specified quote number
    func get(quoteNumber: Int, completion: @escaping (Bool, String, String) -> Void) {
        ref.child(String(describing: quoteNumber)).observeSingleEvent(of: .value, with: { (snapshot) in
            let value = snapshot.value as? NSDictionary
            let quote = value?["quote"] as? String ?? ""
            let author = value?["author"] as? String ?? ""
            completion(true, quote, author)
        })
    }
    
    // This gets the count of quotes available in database
    func getNumQuotes(completion: @escaping (Bool, Int) -> Void) {
        ref.child(QuotesCountKey).observeSingleEvent(of: .value, with: { (snapshot) in
            guard let count = snapshot.value as? Int else {
                completion(false, 0)
                return
            }
            
            completion(true, count)
        })
    }
}
