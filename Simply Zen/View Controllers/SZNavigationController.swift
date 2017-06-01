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
    
    // Background Images
    private let contentImages = ["flower_1",
                                 "flower_2",
                                 "flower_3",
                                 "flower_4"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if UserDefaults.standard.value(forKey: "viewedTutorial") == nil {
            // TODO: - Move this into TutorialVC after it has been completed
            UserDefaults.standard.setValue(true, forKey: "viewedTutorial")
            // sets a new rootVC
            let tutorialVC = storyboard?.instantiateViewController(withIdentifier: "pageVC") as! TutorialPageViewController
            UIApplication.shared.delegate?.window??.rootViewController = tutorialVC
        }
        
        // Do any additional setup after loading the view.
    }

    // MARK: - Navigation


}
