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
    
    if let error = parsedJSONData["error"] as? [String:AnyObject], let code = error["code"] as? Int {
        if code == 429 {
            print("Too many requests")
            return
        }
    }
    
    guard let contentsData = parsedJSONData["contents"] as? [String:AnyObject] else {
        print("Failed to get contents")
        return
    }
    
    print(contentsData)
    
    guard let quotesArrayData = contentsData["quotes"] as? [[String:AnyObject]] else {
        print("Failed to get quote data")
        return
    }
    
    let quotesData = quotesArrayData[0]
    
    guard let author = quotesData["author"] as? String else {
        print("Couldn't get author")
        return
    }
    
    guard let background = quotesData["background"] as? String else {
        print("Couldn't get background")
        return
    }
    
    guard let quote = quotesData["quote"] as? String else {
        print("Couldn't get quote")
        return
    }
    
    if let url = URL(string: background) {
        DispatchQueue.main.async {
            let imageData = try? Data(contentsOf: url)
            let image = UIImage(data: imageData!)
        }
    }
    
    print("Author: \(author)")
    print("Background URL: \(background)")
    print("Quote: \(quote)")
  
}

task.resume()
