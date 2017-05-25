//
//  MoodZenViewController.swift
//  Simply Zen
//
//  Created by Daniel Pratt on 5/19/17.
//  Copyright © 2017 Daniel Pratt. All rights reserved.
//

import UIKit

// Mark: - MoodZenViewController Class
class MoodZenViewController: UIViewController, MoodZenViewDelegate {

    // MARK: - Properties
    
    @IBOutlet weak var moodZenView: MoodZenView!
    var moodCourse: SZCourse!
    
    // Delegate
    let delegate = UIApplication.shared.delegate as! AppDelegate
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Hide nav bar
        navigationController?.navigationBar.isHidden = true
        
        // Setup animations and enable button taps
        moodZenView.addFloatAnimation()
        moodZenView.moodZenViewDelegate = self
        }


    // MARK: - MoodZenViewDelegate Methods
    
    func sadPressed(sad: UIButton) {
        moodZenView.addSadTappedAnimation { (finished) in
            if finished {
                self.moodCourse = SZCourse.sadCourse()
                self.pushMeditationView()
            }
        }
    }
    
    func happyPressed(happy: UIButton) {
        moodZenView.addHappyTappedAnimation { (finished) in
            if finished {
                self.moodCourse = SZCourse.happyCourse()
                self.pushMeditationView()
            }
        }
    }
    
    func cantSleepPressed(cantSleep: UIButton) {
        moodZenView.addCantSleepTappedAnimation { (finished) in
            if finished {
                self.moodCourse = SZCourse.cantSleepCourse()
                self.pushMeditationView()
            }
        }
    }
    
    func upsetPressed(upset: UIButton) {
        moodZenView.addUpsetTappedAnimation { (finished) in
            if finished {
                self.moodCourse = SZCourse.upsetCourse()
                self.pushMeditationView()
            }
        }
    }

    // MARK: - Push Meditation View
    private func pushMeditationView() {
        // Create variables for VC and course / lesson to load
        let meditationVC = self.storyboard?.instantiateViewController(withIdentifier: "meditationView") as! MeditationViewController
        let selectedCourse = moodCourse.name
        let maxlevel = moodCourse.lessons.count
        let level: Int = Int(arc4random_uniform(UInt32(maxlevel)))
        print(level)
        var addedCourse = false
        
        // Check to see if the user already has a history
        if let courses = self.delegate.user.courses?.array as? [Course] {
            for course in courses {
                print((course.courseName) ?? "No name")
                if course.courseName == selectedCourse {
                    addedCourse = true
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
        meditationVC.lesson = moodCourse.lessons[level]
        meditationVC.lessonFileName = meditationVC.lesson.lessonFileName
        self.navigationController?.pushViewController(meditationVC, animated: true)
    }



}
