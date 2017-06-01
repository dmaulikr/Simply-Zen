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

class MainMenuViewController: UIViewController, MainMenuViewDelegate {

    @IBOutlet var mainMenuView: MainMenuView!
    
    // Mark: - Properties
    
    // Entity Properties
    let UserDataKey = "UserData"
    var userData: [UserData] = []
    
    // App Delegate
    let delegate = UIApplication.shared.delegate as! AppDelegate
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Setup or User
        setupUser()
        
        // setup navigation bar
        setupNavigationBar()
        
//        if HealthKitExtension.checkAvailability() {
//            HealthKitExtension.requestAuthorization()
//        }
        
        // Twitter Test
//        setupTwitter()
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
    
    // MARK: - Twitter Setup
    
    // This function sets up Twitter auth
    // It will later be moved into first time setup VC (after it gets created)
    func setupTwitter() {
//        let store = Twitter.sharedInstance().sessionStore
//        
//        if !store.hasLoggedInUsers() {
//            Twitter.sharedInstance().logIn(completion: { (session, error) in
//                if (session != nil) {
//                    print("signed in as \(String(describing: session?.userName))")
//                    store.save(session!, completion: { (authSession, error) in
//                        print("saved session")
//                    })
//                } else {
//                    print("error: \(String(describing: error?.localizedDescription))")
//                }
//            })
//        } else {
//            print("Logged in user \(String(describing:store.session()?.userID))")
//        }
        
//        if (Twitter.sharedInstance().sessionStore.hasLoggedInUsers()) {
//            // App must have at least one logged-in user to compose a Tweet
//            let composer = TWTRComposerViewController.init(initialText: "Hello, World! #SimplyZen", image: nil, videoURL: nil)
//            present(composer, animated: true, completion: nil)
//        }
        
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
        }
        
        // MARK: - User History Tests
        print("Running History Tests")
        if let meditations = delegate.user.meditationHistory?.array as? [Meditation] {
            for meditation in meditations {
                print(meditation.durationSeconds)
                print(meditation.lesson?.lessonName ?? "No Name")
            }
        }
        
        if let courses = delegate.user.courses?.array as? [Course] {
            for course in courses {
                print(course.courseName ?? "No Course name")
                print(course.userProgress)
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
        navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName:navigationColor]
        navigationController?.navigationBar.isHidden = true
        navigationController?.barHideOnTapGestureRecognizer.numberOfTapsRequired = 2
        navigationController?.barHideOnTapGestureRecognizer.delaysTouchesBegan = true
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
    
}
