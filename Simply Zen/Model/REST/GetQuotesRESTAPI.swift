//
//  GetQuotesRESTAPI.swift
//  Simply Zen
//
//  Created by Daniel Pratt on 6/5/17.
//  Copyright © 2017 Daniel Pratt. All rights reserved.
//

import Foundation
import UIKit
import Firebase

extension MeditationViewController {
    
    func getQuote(completion: @escaping (Bool) -> Void) {
        
        getNumQuotes { (success, count) in
            if success {
                let quoteNumber = Int(arc4random_uniform(UInt32(count)) + 1) // Make sure range is 1-upper bound
                self.get(quoteNumber: quoteNumber, completion: { (success, retrievedQuote, retrievedAuthor) in
                    if success {
                        self.quoteAuthor = retrievedAuthor
                        // Might do backgrounds later
                        // self.imageURL = background
                        self.quote = retrievedQuote
                        completion(true)
                    } else {
                        print("Couldn't connect to quotes server to get quotes")
                        completion(false)
                    }
                })
            } else {
                print("Couldn't connect to quotes server to get count")
                completion(false)
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
