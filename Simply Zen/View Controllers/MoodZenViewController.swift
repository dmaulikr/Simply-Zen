//
//  MoodZenViewController.swift
//  Simply Zen
//
//  Created by Daniel Pratt on 5/19/17.
//  Copyright © 2017 Daniel Pratt. All rights reserved.
//

import UIKit
import AVFoundation

// Mark: - MoodZenViewController Class
class MoodZenViewController: UIViewController, MoodZenViewDelegate {

    // MARK: - Properties
    
    @IBOutlet weak var moodZenView: MoodZenView!
    var moodCourse: SZCourse!
    
    // Delegate
    let delegate = UIApplication.shared.delegate as! AppDelegate
    
    // For sound
    var soundEffectPlayer: SoundEffect!
    
    // For haptics
    var areHapticsEnabled: Bool!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Hide nav bar
        navigationController?.navigationBar.isHidden = true
        
        
        // Load sound effect Engine
        soundEffectPlayer = SoundEffect()
        
        // Setup animations and enable button taps
        moodZenView.addFloatAnimation()
        moodZenView.moodZenViewDelegate = self
        
        // Load haptic settings
        if let hapticsEnabled = UserDefaults.standard.value(forKey: "areUiHapticsOn") as? Bool {
            areHapticsEnabled = hapticsEnabled
        } else {
            areHapticsEnabled = true
            UserDefaults.standard.set(areHapticsEnabled, forKey: "areUiHapticsOn")
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        moodZenView.removeAllAnimations()
    }


    // MARK: - MoodZenViewDelegate Methods
    
    func sadPressed(sad: UIButton) {
        if areHapticsEnabled {
            let notification = UINotificationFeedbackGenerator()
            notification.notificationOccurred(.success)
        }
        soundEffectPlayer.playSoundEffect()
        moodZenView.addSadTappedAnimation { (finished) in
            if finished {
                self.moodCourse = SZCourse.sadCourse()
                self.pushMeditationView()
            }
        }
    }
    
    func happyPressed(happy: UIButton) {
        if areHapticsEnabled {
            let notification = UINotificationFeedbackGenerator()
            notification.notificationOccurred(.success)
        }
        soundEffectPlayer.playSoundEffect()
        moodZenView.addHappyTappedAnimation { (finished) in
            if finished {
                self.moodCourse = SZCourse.happyCourse()
                self.pushMeditationView()
            }
        }
    }
    
    func cantSleepPressed(cantSleep: UIButton) {
        if areHapticsEnabled {
            let notification = UINotificationFeedbackGenerator()
            notification.notificationOccurred(.success)
        }
        soundEffectPlayer.playSoundEffect()
        moodZenView.addCantSleepTappedAnimation { (finished) in
            if finished {
                self.moodCourse = SZCourse.cantSleepCourse()
                self.pushMeditationView()
            }
        }
    }
    
    func upsetPressed(upset: UIButton) {
        if areHapticsEnabled {
            let notification = UINotificationFeedbackGenerator()
            notification.notificationOccurred(.success)
        }
        soundEffectPlayer.playSoundEffect()
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
        var coredDataCourse: Course!
        let maxlevel = moodCourse.lessons.count
        var level: Int = Int(arc4random_uniform(UInt32(maxlevel)))
        var addedCourse = false
        
        // Check to see if the user already has a history
        if let courses = self.delegate.user.courses?.array as? [Course] {
            for course in courses {
                if course.courseName == selectedCourse {
                    addedCourse = true
                    coredDataCourse = course
                    break
                }
            }
        }
        
        // If the course hasn't been added yet create it and add to the user
        if !addedCourse {
            // create course Core Data object and add it to user
            coredDataCourse = Course(courseName: selectedCourse!, user: delegate.user, insertInto: delegate.stack.context)
            delegate.user.addToCourses(coredDataCourse)
            delegate.stack.save()
        }
        
        
        // Load lesson and attach to meditationVC
        
        // Make sure that level index is not out of range of the array
        
        // Make sure that level is not out of array index
        if !(level < maxlevel) {
            level = 0
        } else if level > maxlevel - 1 {
            level = maxlevel - 1
        }
        
        meditationVC.lesson = moodCourse.lessons[level]
        meditationVC.lessonFileName = meditationVC.lesson.lessonFileName
        meditationVC.coreDataCourse = coredDataCourse
        self.navigationController?.pushViewController(meditationVC, animated: true)
    }
    
}
