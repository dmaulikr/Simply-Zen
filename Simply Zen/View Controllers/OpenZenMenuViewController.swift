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
//    var audioURL: URL!
//    var audioPlayer: AVAudioPlayer!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Hide nav bar
        navigationController?.navigationBar.isHidden = true
        
        // Setup animations and enable button taps
        openZenMenuView.addFloatAnimation()
        openZenMenuView.openZenMenuViewDelegate = self
        
        // Get the correct lesson filename
        let bellsSound = delegate.user.bellSound
        
        // Load sound effect
//        audioURL = Bundle.main.url(forResource: "Water on Paper", withExtension: "mp3")
        
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
        
        
    }

    override func viewWillDisappear(_ animated: Bool) {
        openZenMenuView.removeAllAnimations()
    }
    
    override func viewDidLoad() {
    }
    

    // MARK: - Open Zen Menu View Delegate Functions
    // These handle the button presses
    
    func noBellsPressed(noBells: UIButton) {
        let notification = UINotificationFeedbackGenerator()
        notification.notificationOccurred(.success)
        self.playSoundEffect()
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
        let notification = UINotificationFeedbackGenerator()
        notification.notificationOccurred(.success)
        self.playSoundEffect()
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
        let notification = UINotificationFeedbackGenerator()
        notification.notificationOccurred(.success)
        self.playSoundEffect()
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
        let notification = UINotificationFeedbackGenerator()
        notification.notificationOccurred(.success)
        self.playSoundEffect()
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
        let notification = UINotificationFeedbackGenerator()
        notification.notificationOccurred(.success)
        self.playSoundEffect()
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
    
    // MARK: AVAudio Functions
    
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
