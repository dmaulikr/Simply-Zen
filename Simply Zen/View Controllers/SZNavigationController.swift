//
//  SZNavigationController.swift
//  Simply Zen
//
//  Created by Daniel Pratt on 5/31/17.
//  Copyright © 2017 Daniel Pratt. All rights reserved.
//

import UIKit

class SZNavigationController: UINavigationController {
    
    // MARK: - Variables
    private var pageViewController: UIPageViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Make sure bell volume has a default value
        // Set user default for sound level
        if UserDefaults.standard.value(forKey: "bellVolume") == nil {
            UserDefaults.standard.setValue(0.2 as Float, forKey: "bellVolume")
        }
        
        if UserDefaults.standard.value(forKey: "viewedTutorial") == nil {
            // sets a new rootVC
            let tutorialVC = storyboard?.instantiateViewController(withIdentifier: "pageVC") as! TutorialPageViewController
            UIApplication.shared.delegate?.window??.rootViewController = tutorialVC
        }
    }
    
}
