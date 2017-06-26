//
//  SessionCompleteViewController.swift
//  Simply Zen
//
//  Created by Daniel Pratt on 6/5/17.
//  Copyright © 2017 Daniel Pratt. All rights reserved.
//

import UIKit
import TwitterKit

// MARK: - Session Complete View Controller Class

class SessionCompleteViewController: UIViewController {

    // MARK: - Properties
    
    // Mark: - IBOutlets
    @IBOutlet weak var quoteBody: UILabel!
    @IBOutlet weak var quoteAuthor: UILabel!
    @IBOutlet weak var quoteImage: UIImageView!
    @IBOutlet weak var tweetButton: UIButton!
    
    // NOTE: - Removing images from launch version
    
    // Properties to hold quote data
    var quoteBodyString: String?
//    var imageURLString: String?
    var quoteAuthorString: String?
//    var quoteUIImage: UIImage?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if !(Twitter.sharedInstance().sessionStore.hasLoggedInUsers()) {
            tweetButton.isEnabled = false
            tweetButton.isHidden = true
        }
    
        navigationController?.hidesBarsOnTap = false
        
        // NOTE: - Part of if let statements to get images, removed from launch version
        // let image = quoteUIImage
        // let url = URL(string: imageURLString!)
        
        // Setup the page to show the quote
        if let quote = quoteBodyString, let author = quoteAuthorString {
            quoteBody.text = quote
            quoteAuthor.text = author
//            quoteImage.image = image
        }
        
//        else if let quote = quoteBodyString, let author = quoteAuthorString {
//            quoteBody.text = quote
//            quoteAuthor.text = author
////            DispatchQueue.main.async {
////                let imageData = try? Data(contentsOf: url)
////                let image = UIImage(data: imageData!)
////                self.quoteImage.image = image
//            }
        else {
            // Mark: - If we can't get a quote from the REST API, take one from this application
            let quoteDictionary = getQuote()
            
            if let quote = quoteDictionary["Quote"], let author = quoteDictionary["Author"] {
                quoteBody.text = quote
                quoteAuthor.text = author
            }
            
                // This shouldn't ever happen, but nice to have a final backup just in case
            else {
                quoteBody.text = "Reduce the stress levels in your life through relaxation techniques like meditation, deep breathing, and exercise. You'll look and feel way better..."
                quoteAuthor.text = "Suzanne Somers"
            }
        }
    }

    // MARK: - IBActions

    @IBAction func tweetSessionTapped(_ sender: Any) {
        // Make sure app has a logged in user
        if (Twitter.sharedInstance().sessionStore.hasLoggedInUsers()) {
            var tweet: String!
            // Make sure we have a quote body and that the quote won't be too long
            if let quote = quoteBodyString, (quoteBodyString?.characters.count)! <= 114 {
                tweet = "\(String(describing: quote)) @SimplyZenApp #meditation"
            } else {
                tweet = "I just became more #mindful with @SimplyZenApp #meditation"
            }
            
            // TODO: - When a good image solution becomes available, let's add it to the tweets
            
            let composer = TWTRComposerViewController.init(initialText: tweet, image: nil, videoURL: nil)
            present(composer, animated: true, completion: nil)
            
        } else {
            let store = Twitter.sharedInstance().sessionStore
            Twitter.sharedInstance().logIn(completion: { (session, error) in
                if (session != nil) {
                    print("signed in as \(String(describing: session?.userName))")
                    store.save(session!, completion: { (authSession, error) in
                        self.tweetSessionTapped(self)
                    })
                }
            })

        }
    }
 
    @IBAction func doneButtonTapped(_ sender: Any) {
        navigationController?.hidesBarsOnTap = true
        navigationController?.popToRootViewController(animated: false)
    }

    
}
