//
//  OpenZenMenuViewController.swift
//  Simply Zen
//
//  Created by Daniel Pratt on 5/18/17.
//  Copyright © 2017 Daniel Pratt. All rights reserved.
//

import UIKit
import AVFoundation

class OpenZenMenuViewController: UIViewController, OpenZenMenuViewDelegate {

    // MARK: - Properties
    
    // View responsible for animations
    @IBOutlet weak var openZenMenuView: OpenZenMenuView!
    let openZen = SZCourse.openMeditationCourses() as SZCourse
    var lesson: SZLesson!
    
    // App Delegate
    let delegate = UIApplication.shared.delegate as! AppDelegate
    
    // For sound
    var soundEffectPlayer: SoundEffect!
    
    // For haptics
    var areHapticsEnabled: Bool!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Hide nav bar
        navigationController?.navigationBar.isHidden = true
        
        // Setup animations and enable button taps
        openZenMenuView.addFloatAnimation()
        openZenMenuView.openZenMenuViewDelegate = self
        
        // Get the correct lesson filename
        let bellsSound = delegate.user.bellSound
        
        // Load sound effect Engine
        soundEffectPlayer = SoundEffect()
        
        switch bellsSound {
        case "burmese":
            lesson = openZen.lessons[OpenZenLessons.Burmese]
        case "kyoto":
            lesson = openZen.lessons[OpenZenLessons.Kyoto]
        case "thai":
            lesson = openZen.lessons[OpenZenLessons.Thai]
        case "tibetan":
            lesson = openZen.lessons[OpenZenLessons.Tibet]
        default:
            lesson = openZen.lessons[OpenZenLessons.Burmese]
        }
        
        // Load haptic settings
        if let hapticsEnabled = UserDefaults.standard.value(forKey: "areUiHapticsOn") as? Bool {
            areHapticsEnabled = hapticsEnabled
        } else {
            areHapticsEnabled = true
            UserDefaults.standard.set(areHapticsEnabled, forKey: "areUiHapticsOn")
        }
        
        
    }

    override func viewWillDisappear(_ animated: Bool) {
        openZenMenuView.removeAllAnimations()
    }
    
    override func viewDidLoad() {
    }
    

    // MARK: - Open Zen Menu View Delegate Functions
    // These handle the button presses
    
    func noBellsPressed(noBells: UIButton) {
        if areHapticsEnabled {
            let notification = UINotificationFeedbackGenerator()
            notification.notificationOccurred(.success)
        }
        soundEffectPlayer.playSoundEffect()
        openZenMenuView.addNoBellsTappedAnimation { (finished) in
            if finished {
                let meditationVC = self.storyboard?.instantiateViewController(withIdentifier: "meditationView") as! MeditationViewController
                meditationVC.isOpenMeditation = true
                meditationVC.lessonFileName = self.openZen.lessons[OpenZenLessons.None].lessonFileName
                meditationVC.lesson = self.openZen.lessons[OpenZenLessons.None]
                self.navigationController?.pushViewController(meditationVC, animated: true)
            }
        }
    }
    
    func tenMinutesPressed(tenMinutes: UIButton) {
        if areHapticsEnabled {
            let notification = UINotificationFeedbackGenerator()
            notification.notificationOccurred(.success)
        }
        soundEffectPlayer.playSoundEffect()
        openZenMenuView.addTenMinutesTappedAnimation { (finished) in
            if finished {
                let meditationVC = self.storyboard?.instantiateViewController(withIdentifier: "meditationView") as! MeditationViewController
                meditationVC.lessonFileName = self.lesson.lessonFileName
                meditationVC.lesson = self.lesson
                meditationVC.isOpenMeditation = true
                meditationVC.openMeditationTimer = 600.0
                self.navigationController?.pushViewController(meditationVC, animated: true)
            }
        }

    }
    
    func twentyMinutesPressed(twentyMinutes: UIButton) {
        if areHapticsEnabled {
            let notification = UINotificationFeedbackGenerator()
            notification.notificationOccurred(.success)
        }
        soundEffectPlayer.playSoundEffect()
        openZenMenuView.addTwentyMinutesTappedAnimation { (finished) in
            if finished {
                let meditationVC = self.storyboard?.instantiateViewController(withIdentifier: "meditationView") as! MeditationViewController
                meditationVC.lessonFileName = self.lesson.lessonFileName
                meditationVC.lesson = self.lesson
                meditationVC.isOpenMeditation = true
                meditationVC.openMeditationTimer = 1200.0
                self.navigationController?.pushViewController(meditationVC, animated: true)
            }
        }

    }
    
    func fiveMinutesPressed(fiveMinutes: UIButton) {
        if areHapticsEnabled {
            let notification = UINotificationFeedbackGenerator()
            notification.notificationOccurred(.success)
        }
        soundEffectPlayer.playSoundEffect()
        openZenMenuView.addFiveMinutesTappedAnimation { (finished) in
            if finished {
                let meditationVC = self.storyboard?.instantiateViewController(withIdentifier: "meditationView") as! MeditationViewController
                meditationVC.lessonFileName = self.lesson.lessonFileName
                meditationVC.lesson = self.lesson
                meditationVC.isOpenMeditation = true
                meditationVC.openMeditationTimer = 300.0
                self.navigationController?.pushViewController(meditationVC, animated: true)
            }
        }

    }
    
    func twoMinutesPressed(twoMinutes: UIButton) {
        if areHapticsEnabled {
            let notification = UINotificationFeedbackGenerator()
            notification.notificationOccurred(.success)
        }
        soundEffectPlayer.playSoundEffect()
        openZenMenuView.addTwoMinutesTappedAnimation { (finished) in
            if finished {
                let meditationVC = self.storyboard?.instantiateViewController(withIdentifier: "meditationView") as! MeditationViewController
                meditationVC.lessonFileName = self.lesson.lessonFileName
                meditationVC.lesson = self.lesson
                meditationVC.isOpenMeditation = true
                meditationVC.openMeditationTimer = 120.0
                self.navigationController?.pushViewController(meditationVC, animated: true)
            }
        }

    }

}
