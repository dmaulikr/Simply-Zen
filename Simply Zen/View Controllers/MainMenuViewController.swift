//
//  MainMenuViewController.swift
//  Simply Zen
//
//  Created by Daniel Pratt on 5/16/17.
//  Copyright © 2017 Daniel Pratt. All rights reserved.
//

import UIKit
import CoreData
import TwitterKit
import AVFoundation

class MainMenuViewController: UIViewController, MainMenuViewDelegate {

    @IBOutlet var mainMenuView: MainMenuView!
    
    // Mark: - Properties
    
    // Entity Properties
    let UserDataKey = "UserData"
    var userData: [UserData] = []
    
    // App Delegate
    let delegate = UIApplication.shared.delegate as! AppDelegate
    
    // For sound
//    var audioURL: URL!
//    var audioPlayer: AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Setup or User
        setupUser()
        
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
        
        // Load sound effect
//        audioURL = Bundle.main.url(forResource: "Water on Paper", withExtension: "mp3")
    }
    
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        mainMenuView.removeAllAnimations()
    }
        
    // MARK: - Core Data
    private func setupUser() {
        let fetchedUserDataController = getFetchControllerFor(entityNamed: UserDataKey, inContext: delegate.stack.context)
        do {
            try fetchedUserDataController.performFetch()

        } catch {
            print("Failed to fetch user data")
        }
        
        userData = fetchedUserDataController.fetchedObjects as! [UserData]
        
        if userData.count == 0 {
            print("None found, creating a new one")
            userData.append(UserData(context: delegate.stack.context))
            delegate.user = userData[0]
        } else {
            delegate.user = userData[0]
            
            // clear out any old sessions (older than 90 days)
            let threeMonthsAgoDate = Date.init(timeIntervalSinceNow: -7776000)
            let threeMonthsAgo = threeMonthsAgoDate.timeIntervalSinceReferenceDate
            for session in delegate.user.meditationHistory?.array as! [Meditation] {
                
                // find the time interval
                if let time = session.date?.timeIntervalSinceReferenceDate {
                    // if the time is 90 days or more old, delete the session form core data history
                    if time <= threeMonthsAgo {
                        delegate.user.removeFromMeditationHistory(session)
                    }
                }
            }
        }
        
        delegate.stack.save()
        
    }
    
    // MARK: - Private Core Data Fetch Methods
    
    private func getFetchControllerFor(entityNamed entityName: String, inContext context: NSManagedObjectContext) -> NSFetchedResultsController<NSFetchRequestResult> {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: entityName)
        fetchRequest.sortDescriptors = []
        
        return NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: context, sectionNameKeyPath: nil, cacheName: nil)
        
    }
    
    // MARK: - Setup Navigation Bar
    private func setupNavigationBar() {
        let navigationColor = UIColor(red: 22.0/255.0, green: 15.0/255.0, blue: 94.0/255, alpha: 1.0)
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.view.backgroundColor = UIColor.clear
        navigationController?.navigationBar.tintColor = navigationColor
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor:navigationColor]
        navigationController?.navigationBar.isHidden = true
        navigationController?.barHideOnTapGestureRecognizer.numberOfTapsRequired = 2
        navigationController?.barHideOnTapGestureRecognizer.delaysTouchesBegan = true
    }
    
    // MARK: - MainMenuView Button Behavior
    
    func moodZenPressed(moodZen: UIButton) {
        let notification = UINotificationFeedbackGenerator()
        notification.notificationOccurred(.success)
        self.playSoundEffect()
        mainMenuView.addMoodTappedAnimation { (finished) in
            if finished {
                self.performSegue(withIdentifier: "moodZenSegue", sender: self)
            }
        }
    }
    
    func guidedZenPressed(guidedZen: UIButton) {
        let notification = UINotificationFeedbackGenerator()
        notification.notificationOccurred(.success)
        self.playSoundEffect()
        mainMenuView.addGuidedTappedAnimation { (finished) in
            if finished {
                self.performSegue(withIdentifier: "guidedZenSegue", sender: self)
            }
        }
    }
    
    func openZenPressed(openZen: UIButton) {
        let notification = UINotificationFeedbackGenerator()
        notification.notificationOccurred(.success)
        self.playSoundEffect()
        mainMenuView.addOpenTappedAnimation { (finished) in
            if finished {
                self.performSegue(withIdentifier: "openZenSegue", sender: self)
            }
        }
    }
    
    // Mark: - Prepare for Segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "openZenSegue" {
            let _ = segue.destination as! OpenZenMenuViewController
        } else if segue.identifier == "guidedZenSegue" {
            let _ = segue.destination as! GuidedZenViewController
        } else if segue.identifier == "moodZenSegue" {
            let _ = segue.destination as! MoodZenViewController
        }
    }
    
//    // MARK: AVAudio Functions
//    
//    private func playSoundEffect() {
//        do {
//            audioPlayer = try AVAudioPlayer(contentsOf: audioURL)
//            audioPlayer.delegate = self as? AVAudioPlayerDelegate
//            audioPlayer.volume = 0.3
//            audioPlayer.play()
//        } catch {
//            print("Unable to start audio player")
//        }
//    }
    
}
