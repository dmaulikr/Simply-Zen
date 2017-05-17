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
        
        // Start animation and setup delegate to handle taps
        mainMenuView.alpha = 0.85
        mainMenuView.addFloatAnimation()
        mainMenuView.mainMenuViewDelegate = self
        
    }

    
    // MARK: - MainMenuView Button Behavior
    
    func moodZenPressed(moodZen: UIButton) {
        print("Mood Zen")
    }
    
    func guidedZenPressed(guidedZen: UIButton) {
        print("Guided Zen")
    }
    
    func openZenPressed(openZen: UIButton) {
        print("Open Zen")
    }
}
