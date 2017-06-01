//: Playground - noun: a place where people can play

import UIKit
import PlaygroundSupport

// this line tells the Playground to execute indefinitely
PlaygroundPage.current.needsIndefiniteExecution = true

// MARK: - QOD
let urlString = "http://quotes.rest/qod.json?category=inspire"

let url = URL(string: urlString)

var request = URLRequest(url: url!)
request.httpMethod = "GET"

let session = URLSession.shared

let task = session.dataTask(with: request) { (data, response, error) in
    print("making request")
    guard (error == nil) else {
        print("error")
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
        return
    }
    
    print(parsedJSONData)
    if let quotesData = parsedJSONData["quotes"] as? [String:String] {
        let backgroundURL = quotesData["background"]
        var backGroundImage: UIImage?
        if let backgroundImageData = try? UIImage(data: Data(contentsOf: URL(string: backgroundURL!)!)) {
            backGroundImage = backgroundImageData
        }
        let quoteText = quotesData["quote"]
        
        print("backgroundURL: \(String(describing: backgroundURL))")
        print("quoteText: \(String(describing: quoteText))")
    }
    
    
    
  
}

task.resume()
