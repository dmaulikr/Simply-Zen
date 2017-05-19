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
        
        // setup navigation bar
        setupNavigationBar()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // make sure nav bar is hidden
        navigationController?.navigationBar.isHidden = true
        
        // Start animation and setup delegate to handle taps
        mainMenuView.addFloatAnimation()
        mainMenuView.mainMenuViewDelegate = self
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        // make sure that animations are stopped
//        mainMenuView.removeAllAnimations()
//        print("Animations removed")
    }
    
    // MARK: - Setup Navigation Bar
    private func setupNavigationBar() {
        let navigationColor = UIColor(red: 22.0/255.0, green: 15.0/255.0, blue: 94.0/255, alpha: 1.0)
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.view.backgroundColor = UIColor.clear
        navigationController?.navigationBar.tintColor = navigationColor
        navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName:navigationColor]
        navigationController?.navigationBar.isHidden = true

        
    }
    
    // MARK: - MainMenuView Button Behavior
    
    func moodZenPressed(moodZen: UIButton) {
        mainMenuView.addMoodTappedAnimation { (finished) in
            if finished {
                self.performSegue(withIdentifier: "moodZenSegue", sender: self)
            }
        }
    }
    
    func guidedZenPressed(guidedZen: UIButton) {
        mainMenuView.addGuidedTappedAnimation { (finished) in
            if finished {
                self.performSegue(withIdentifier: "guidedZenSegue", sender: self)
            }
        }
    }
    
    func openZenPressed(openZen: UIButton) {
        mainMenuView.addOpenTappedAnimation { (finished) in
            if finished {
                self.performSegue(withIdentifier: "openZenSegue", sender: self)
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "openZenSegue" {
            let openZenVC = segue.destination as! OpenZenMenuViewController
            openZenVC.words = "Some words"
        } else if segue.identifier == "guidedZenSegue" {
            let guidedZenVC = segue.destination as! GuidedZenViewController
            guidedZenVC.words = "Some different words"
        } else if segue.identifier == "moodZenSegue" {
            let moodZenVC = segue.destination as! MoodZenViewController
            moodZenVC.words = "Moody Words"
        }
    }
    
}
