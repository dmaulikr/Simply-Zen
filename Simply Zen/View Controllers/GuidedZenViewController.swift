//
//  GuidedZenViewController.swift
//  Simply Zen
//
//  Created by Daniel Pratt on 5/19/17.
//  Copyright © 2017 Daniel Pratt. All rights reserved.
//

import UIKit

// MARK: - GuidedZenViewController Class

class GuidedZenViewController: UIViewController, GuidedZenMenuViewDelegate {

    
    // MARK: - Properties
    
    @IBOutlet var guidedZenView: GuidedZenMenuView!
    var words: String? = nil
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // hide nav bar
        navigationController?.navigationBar.isHidden = true
        
        // Setup animations and enable button taps
        guidedZenView.addFloatAnimation()
        guidedZenView.guidedZenMenuViewDelegate = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(words ?? "No words")
    }

    // MARK: - Guided Zen Menu View Delegate Methods
    
    func relaxPressed(relax: UIButton) {
        guidedZenView.addRelaxTappedAnimation { (finished) in
            if finished {
                print("Relax Pressed")
            }
        }
    }
    
    func heartMeditationPressed(heartMeditation: UIButton) {
        guidedZenView.addHeartMeditationTappedAnimation { (finished) in
            if finished {
                print("Heart Meditation")
            }
        }
    }
    
    func beginningZenPressed(beginningZen: UIButton) {
        guidedZenView.addBeginningZenTappedAnimation { (finished) in
            if finished {
                print("Begging Zen")
            }
        }
    }
    
    func lettingGoPressed(lettingGo: UIButton) {
        guidedZenView.addLettingGoTappedAnimation { (finished) in
            if finished {
                print("Letting Go")
            }
        }
    }
    
    func advancedBreathingPressed(advancedBreathing: UIButton) {
        guidedZenView.addAdvancedBreathingTappedAnimation { (finished) in
            if finished {
                print("Advanced Breathing")
            }
        }
    }

}
