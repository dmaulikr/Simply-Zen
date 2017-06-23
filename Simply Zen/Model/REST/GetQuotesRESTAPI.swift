//
//  GetQuotesRESTAPI.swift
//  Simply Zen
//
//  Created by Daniel Pratt on 6/5/17.
//  Copyright © 2017 Daniel Pratt. All rights reserved.
//

import Foundation
import UIKit

extension MeditationViewController {
    
    func getQuote(completion: @escaping (Bool) -> Void) {
        
        // MARK: - QOD
        let urlString = "https://quotes.rest/qod.json?category=inspire"
        
        let url = URL(string: urlString)
        
        var request = URLRequest(url: url!)
        request.httpMethod = "GET"
        
        let session = URLSession.shared
        
        
        let task = session.dataTask(with: request) { (data, response, error) in
            guard (error == nil) else {
                print(error ?? "Error occured, but no detail is available.")
                completion(false)
                return
            }
            
            guard let data = data else {
                print("No data returned")
                return
            }
            
            let parsedJSONData: [String:AnyObject]!
            do {
                parsedJSONData = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as! [String:AnyObject]
            } catch {
                print("Could not parse the data as JSON: '\(data)'")
                completion(false)
                return
            }
            
            if let error = parsedJSONData["error"] as? [String:AnyObject], let code = error["code"] as? Int {
                if code == 429 {
                    print("Too many requests")
                    completion(false)
                    return
                }
            }
            
            guard let contentsData = parsedJSONData["contents"] as? [String:AnyObject] else {
                print("Failed to get contents")
                completion(false)
                return
            }
            
            
            guard let quotesArrayData = contentsData["quotes"] as? [[String:AnyObject]] else {
                print("Failed to get quote data")
                completion(false)
                return
            }
            
            let quotesData = quotesArrayData[0]
            
            guard let author = quotesData["author"] as? String else {
                print("Couldn't get author")
                completion(false)
                return
            }
            
            guard let background = quotesData["background"] as? String else {
                print("Couldn't get background")
                completion(false)
                return
            }
            
            guard let quote = quotesData["quote"] as? String else {
                print("Couldn't get quote")
                completion(false)
                return
            }
            
            if let url = URL(string: background) {
                DispatchQueue.main.async {
                    guard let imageData = try? Data(contentsOf: url) else {
                        completion(false)
                        return
                    }
                    guard let image = UIImage(data: imageData)  else {
                        completion(false)
                        return
                    }
                    
                    self.quoteImage = image
                    
                }
            } else {
                completion(false)
                return
            }
            
            self.quoteAuthor = author
            self.imageURL = background
            self.quote = quote
            completion(true)
        }
        
        task.resume()
    }
    
}
