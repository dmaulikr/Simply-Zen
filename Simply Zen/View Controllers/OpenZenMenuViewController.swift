//
//  OpenZenMenuViewController.swift
//  Simply Zen
//
//  Created by Daniel Pratt on 5/18/17.
//  Copyright © 2017 Daniel Pratt. All rights reserved.
//

import UIKit

class OpenZenMenuViewController: UIViewController, OpenZenMenuViewDelegate {

    // MARK: - Properties
    
    // View responsible for animations
    @IBOutlet weak var openZenMenuView: OpenZenMenuView!
    
    var words: String? = nil
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Hide nav bar
        navigationController?.navigationBar.isHidden = true
        
        // Setup animations and enable button taps
        openZenMenuView.addFloatAnimation()
        openZenMenuView.openZenMenuViewDelegate = self
    }

    override func viewWillDisappear(_ animated: Bool) {
        openZenMenuView.removeAllAnimations()
    }
    
    override func viewDidLoad() {
        print(words ?? "No words")
    }
    

    // MARK: - Open Zen Menu View Delegate Functions
    // These handle the button presses
    
    func noBellsPressed(noBells: UIButton) {
        openZenMenuView.addNoBellsTappedAnimation { (finished) in
            if finished {
                print("No bells")
                let meditationVC = self.storyboard?.instantiateViewController(withIdentifier: "meditationView") as! MeditationViewController
                meditationVC.words = "Bells"
                self.navigationController?.pushViewController(meditationVC, animated: true)
            }
        }
    }
    
    func tenMinutesPressed(tenMinutes: UIButton) {
        openZenMenuView.addTenMinutesTappedAnimation { (finished) in
            if finished {
                print("Ten Minutes")
            }
        }

    }
    
    func twentyMinutesPressed(twentyMinutes: UIButton) {
        openZenMenuView.addTwentyMinutesTappedAnimation { (finished) in
            if finished {
                print("Twenty Minutes")
            }
        }

    }
    
    func fiveMinutesPressed(fiveMinutes: UIButton) {
        openZenMenuView.addFiveMinutesTappedAnimation { (finished) in
            if finished {
                print("Five Minutes")
            }
        }

    }
    
    func twoMinutesPressed(twoMinutes: UIButton) {
        openZenMenuView.addTwoMinutesTappedAnimation { (finished) in
            if finished {
                print("Two Minutes")
            }
        }

    }

}
