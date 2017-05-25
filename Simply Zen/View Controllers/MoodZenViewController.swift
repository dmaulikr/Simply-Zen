//
//  MoodZenViewController.swift
//  Simply Zen
//
//  Created by Daniel Pratt on 5/19/17.
//  Copyright © 2017 Daniel Pratt. All rights reserved.
//

import UIKit

// Mark: - MoodZenViewController Class
class MoodZenViewController: UIViewController, MoodZenViewDelegate {

    // MARK: - Properties
    
    @IBOutlet weak var moodZenView: MoodZenView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Hide nav bar
        navigationController?.navigationBar.isHidden = true
        
        // Setup animations and enable button taps
        moodZenView.addFloatAnimation()
        moodZenView.moodZenViewDelegate = self
        }


    // MARK: - MoodZenViewDelegate Methods
    
    func sadPressed(sad: UIButton) {
        moodZenView.addSadTappedAnimation { (finished) in
            if finished {
                print("Sad")
            }
        }
    }
    
    func happyPressed(happy: UIButton) {
        moodZenView.addHappyTappedAnimation { (finished) in
            if finished {
                print("Happy")
            }
        }
    }
    
    func cantSleepPressed(cantSleep: UIButton) {
        moodZenView.addCantSleepTappedAnimation { (finished) in
            if finished {
                print("Can't Sleep")
            }
        }
    }
    
    func upsetPressed(upset: UIButton) {
        moodZenView.addUpsetTappedAnimation { (finished) in
            if finished {
                print("Upset")
            }
        }
    }

    



}
