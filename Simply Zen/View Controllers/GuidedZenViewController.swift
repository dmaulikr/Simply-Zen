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
    var guidedCourse: SZCourse!
    
    // Delegate
    let delegate = UIApplication.shared.delegate as! AppDelegate
    
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
    }

    // MARK: - Guided Zen Menu View Delegate Methods
    
    func relaxPressed(relax: UIButton) {
        guidedZenView.addRelaxTappedAnimation { (finished) in
            if finished {
                self.guidedCourse = SZCourse.relaxCourse()
                self.pushMeditationView()
            }
        }
    }
    
    func heartMeditationPressed(heartMeditation: UIButton) {
        guidedZenView.addHeartMeditationTappedAnimation { (finished) in
            if finished {
                self.guidedCourse = SZCourse.heartMeditationCourse()
                self.pushMeditationView()
            }
        }
    }
    
    func beginningZenPressed(beginningZen: UIButton) {
        guidedZenView.addBeginningZenTappedAnimation { (finished) in
            if finished {
                self.guidedCourse = SZCourse.beginningZenCourse()
                self.pushMeditationView()
            }
        }
    }
    
    func lettingGoPressed(lettingGo: UIButton) {
        guidedZenView.addLettingGoTappedAnimation { (finished) in
            if finished {
                self.guidedCourse = SZCourse.lettingGoCourse()
                self.pushMeditationView()
            }
        }
    }
    
    func advancedBreathingPressed(advancedBreathing: UIButton) {
        guidedZenView.addAdvancedBreathingTappedAnimation { (finished) in
            if finished {
                self.guidedCourse = SZCourse.advancedBreathingCourse()
                self.pushMeditationView()
            }
        }
    }
    
    private func pushMeditationView() {
        // Create variables for VC and course / lesson to load
        let meditationVC = self.storyboard?.instantiateViewController(withIdentifier: "meditationView") as! MeditationViewController
        let selectedCourse = guidedCourse.name
        var level = 0
        var addedCourse = false
        
        // Check to see if the user already has a history
        if let courses = self.delegate.user.courses?.array as? [Course] {
            for course in courses {
                print((course.courseName) ?? "No name")
                if course.courseName == selectedCourse {
                    addedCourse = true
                    level = Int(course.userProgress)
                    break
                }
            }
        }
        
        // If the course hasn't been added yet create it and add to the user
        if !addedCourse {
            // create course Core Data object and add it to user
            print("creating course")
            delegate.user.addToCourses(Course(courseName: selectedCourse!, user: delegate.user, insertInto: delegate.stack.context))
            print(delegate.user.courses?.array ?? "No courses")
            delegate.stack.save()
        }
        
        
        // Load lesson and attach to meditationVC
        meditationVC.lesson = guidedCourse.lessons[level]
        meditationVC.lessonFileName = meditationVC.lesson.lessonFileName
        self.navigationController?.pushViewController(meditationVC, animated: true)
    }

}
