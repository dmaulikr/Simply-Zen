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
        openZenMenuView.addNoBellsTappedAnimation { (completed) in
            if completed {
                print("No bells")
            }
        }
    }
    
    func tenMinutesPressed(tenMinutes: UIButton) {
        openZenMenuView.addTenMinutesTappedAnimation() { (completed) in
            if completed {
                print("Ten Minutes")
            }
        }

    }
    
    func twentyMinutesPressed(twentyMinutes: UIButton) {
        openZenMenuView.addTwentyMinutesTappedAnimation() { (completed) in
            if completed {
                print("Twenty Minutes")
            }
        }

    }
    
    func fiveMinutesPressed(fiveMinutes: UIButton) {
        openZenMenuView.addFiveMinutesTappedAnimation() { (completed) in
            if completed {
                print("Five Minutes")
            }
        }

    }
    
    func twoMinutesPressed(twoMinutes: UIButton) {
        openZenMenuView.addTwoMinutesTappedAnimation() { (completed) in
            if completed {
                print("Two Minutes")
            }
        }

    }

}
