//
//  TutorialViewController.swift
//  Simply Zen
//
//  Created by Daniel Pratt on 5/31/17.
//  Copyright © 2017 Daniel Pratt. All rights reserved.
//

import UIKit
import TwitterKit
import HealthKit

class TutorialViewController: UIViewController {
    
    var pageName: String!

    @IBOutlet weak var healthKitButton: UIButton!
    @IBOutlet weak var twitterButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // make sure buttons are on current view
        
        if pageName == "pageOne" {
            // Disable buttons if already logged in
            if Twitter.sharedInstance().sessionStore.hasLoggedInUsers() {
                twitterButton.isEnabled = false
            }
            
            if HealthKitExtension.checkAuthorizationStatus() {
                healthKitButton.isEnabled = false
            }

        }
    }
    
    // MARK: - Button Actions

    @IBAction func enableHealthKit(_ sender: Any) {
        if HealthKitExtension.checkAvailability() {
            if HealthKitExtension.requestAuthorization() {
                self.healthKitButton.isEnabled = false
            }
        }
    }
    
    @IBAction func loginToTwitter(_ sender: Any) {
        let store = Twitter.sharedInstance().sessionStore
        
        if !store.hasLoggedInUsers() {
            Twitter.sharedInstance().logIn(completion: { (session, error) in
                if (session != nil) {
                    print("signed in as \(String(describing: session?.userName))")
                    store.save(session!, completion: { (authSession, error) in
                        print("saved session")
                        self.twitterButton.isEnabled = false
                    })
                } else {
                    print("error: \(String(describing: error?.localizedDescription))")
                }
            })
        } else {
            print("Logged in user \(String(describing:store.session()?.userID))")
            self.twitterButton.isEnabled = false
        }
    }
    
    @IBAction func finishTutorial(_ sender: Any) {
        if pageName == "pageEight" {
            let navigationRoot = storyboard?.instantiateViewController(withIdentifier: "navigationRoot") as! SZNavigationController
            UIApplication.shared.delegate?.window??.rootViewController = navigationRoot
        }
        
    }
    
    
}
