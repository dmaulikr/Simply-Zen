//
//  SessionCompleteViewController.swift
//  Simply Zen
//
//  Created by Daniel Pratt on 6/5/17.
//  Copyright © 2017 Daniel Pratt. All rights reserved.
//

import UIKit

// MARK: - Session Complete View Controller Class

class SessionCompleteViewController: UIViewController {

    // MARK: - Properties
    
    // Mark: - IBOutlets
    @IBOutlet weak var quoteBody: UILabel!
    @IBOutlet weak var quoteAuthor: UILabel!
    @IBOutlet weak var quoteImage: UIImageView!
    
    
    // Properties to hold quote data
    var quoteBodyString: String?
    var imageURLString: String?
    var quoteAuthorString: String?
    var quoteUIImage: UIImage?

    override func viewDidLoad() {
        super.viewDidLoad()
        print("session complete")
        // Do any additional setup after loading the view.
    }

    // MARK: - IBActions

    @IBAction func tweetSessionTapped(_ sender: Any) {
    }
 
    @IBAction func doneButtonTapped(_ sender: Any) {
        navigationController?.popToRootViewController(animated: true)
    }

    
}
