//
//  GuidedZenViewController.swift
//  Simply Zen
//
//  Created by Daniel Pratt on 5/19/17.
//  Copyright © 2017 Daniel Pratt. All rights reserved.
//

import UIKit
import AVFoundation

// MARK: - GuidedZenViewController Class

class GuidedZenViewController: UIViewController, GuidedZenMenuViewDelegate {

    
    // MARK: - Properties
    
    @IBOutlet var guidedZenView: GuidedZenMenuView!
    var guidedCourse: SZCourse!
    
    // Delegate
    let delegate = UIApplication.shared.delegate as! AppDelegate
    
    // For sound
    var soundEffectPlayer: SoundEffect!
    
    // For haptics
    var areHapticsEnabled: Bool!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // hide nav bar
        navigationController?.navigationBar.isHidden = true
        
        // Load sound effect Engine
        soundEffectPlayer = SoundEffect()
        
        // Setup animations and enable button taps
        guidedZenView.addFloatAnimation()
        guidedZenView.guidedZenMenuViewDelegate = self
        
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
        guidedZenView.removeAllAnimations()
    }

    // MARK: - Guided Zen Menu View Delegate Methods
    
    func relaxPressed(relax: UIButton) {
        if areHapticsEnabled {
            let notification = UINotificationFeedbackGenerator()
            notification.notificationOccurred(.success)
        }
        soundEffectPlayer.playSoundEffect()
        guidedZenView.addRelaxTappedAnimation { (finished) in
            if finished {
                self.guidedCourse = SZCourse.relaxCourse()
                self.pushMeditationView()
            }
        }
    }
    
    func heartMeditationPressed(heartMeditation: UIButton) {
        if areHapticsEnabled {
            let notification = UINotificationFeedbackGenerator()
            notification.notificationOccurred(.success)
        }
        soundEffectPlayer.playSoundEffect()
        guidedZenView.addHeartMeditationTappedAnimation { (finished) in
            if finished {
                self.guidedCourse = SZCourse.heartMeditationCourse()
                self.pushMeditationView()
            }
        }
    }
    
    func beginningZenPressed(beginningZen: UIButton) {
        if areHapticsEnabled {
            let notification = UINotificationFeedbackGenerator()
            notification.notificationOccurred(.success)
        }
        soundEffectPlayer.playSoundEffect()
        guidedZenView.addBeginningZenTappedAnimation { (finished) in
            if finished {
                self.guidedCourse = SZCourse.beginningZenCourse()
                self.pushMeditationView()
            }
        }
    }
    
    func lettingGoPressed(lettingGo: UIButton) {
        if areHapticsEnabled {
            let notification = UINotificationFeedbackGenerator()
            notification.notificationOccurred(.success)
        }
        soundEffectPlayer.playSoundEffect()
        guidedZenView.addLettingGoTappedAnimation { (finished) in
            if finished {
                self.guidedCourse = SZCourse.lettingGoCourse()
                self.pushMeditationView()
            }
        }
    }
    
    func advancedBreathingPressed(advancedBreathing: UIButton) {
        if areHapticsEnabled {
            let notification = UINotificationFeedbackGenerator()
            notification.notificationOccurred(.success)
        }
        soundEffectPlayer.playSoundEffect()
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
        var coreDataCourse: Course!
        let maxLevel = guidedCourse.lessons.count - 1
        
        // Check to see if the user already has a history
        if let courses = self.delegate.user.courses?.array as? [Course] {
            for course in courses {
                if course.courseName == selectedCourse {
                    addedCourse = true
                    coreDataCourse = course
                    level = Int(course.userProgress)
                    break
                }
            }
        }
        
        // If the course hasn't been added yet create it and add to the user
        if !addedCourse {
            // create course Core Data object and add it to user
            coreDataCourse = Course(courseName: selectedCourse!, user: delegate.user, insertInto: delegate.stack.context)
            delegate.user.addToCourses(coreDataCourse)
            delegate.stack.save()
        }
        
        
        // Load lesson and attach to meditationVC
        
        // Make sure that level is not out of array index
        // If we have to change it to avoid a crash, update the CoreData model
        if !(level <= maxLevel) && coreDataCourse.completed {
            level = 1
            coreDataCourse.userProgress = Int64(level)
        } else if level >= maxLevel {
            level = maxLevel
            coreDataCourse.userProgress = Int64(level)
        }
        
        meditationVC.lesson = guidedCourse.lessons[level]
        meditationVC.lessonFileName = meditationVC.lesson.lessonFileName
        meditationVC.coreDataCourse = coreDataCourse
        meditationVC.maxLevel = maxLevel
        self.navigationController?.pushViewController(meditationVC, animated: true)
    }

}
