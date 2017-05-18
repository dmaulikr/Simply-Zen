//
//  MainMenuViewController.swift
//  Simply Zen
//
//  Created by Daniel Pratt on 5/16/17.
//  Copyright © 2017 Daniel Pratt. All rights reserved.
//

import UIKit

class MainMenuViewController: UIViewController, MainMenuViewDelegate {

    @IBOutlet var mainMenuView: MainMenuView!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // Start animation and setup delegate to handle taps
        mainMenuView.addFloatAnimation()
        mainMenuView.mainMenuViewDelegate = self
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        // make sure that animations are stopped
        mainMenuView.removeAllAnimations()
        print("Animations removed")
    }
    
    // MARK: - MainMenuView Button Behavior
    
    func moodZenPressed(moodZen: UIButton) {
        mainMenuView.addMoodTappedAnimation { (completed) in
            if completed {
                print("Mood Zen")
            }
        }
    }
    
    func guidedZenPressed(guidedZen: UIButton) {
        mainMenuView.addGuidedTappedAnimation { (completed) in
            if completed {
                print("Guided Zen")
            }
        }
    }
    
    func openZenPressed(openZen: UIButton) {
        mainMenuView.addOpenTappedAnimation { (completed) in
            if completed {
                self.performSegue(withIdentifier: "openZenSegue", sender: self)
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "openZenSegue" {
            let openZenVC = segue.destination as! OpenZenMenuViewController
            openZenVC.words = "Some words"
        }
    }
    
}
