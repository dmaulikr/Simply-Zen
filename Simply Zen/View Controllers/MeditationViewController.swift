//
//  MeditationViewController.swift
//  Simply Zen
//
//  Created by Daniel Pratt on 5/19/17.
//  Copyright © 2017 Daniel Pratt. All rights reserved.
//

import UIKit
import AVFoundation

// MARK: - MeditationViewController Class
class MeditationViewController: UIViewController, AVAudioPlayerDelegate {

    // MARK: - Properties
    
    // IBOutlets
    @IBOutlet weak var endSessionButton: UIButton!
    @IBOutlet weak var meditationView: MeditationView!
    
    // Class Properites
    var lesson: SZLesson!
    var coreDataCourse: Course!
    var maxLevel = 0
    var lessonFileName: String!
    var audioURL: URL!
    var audioPlayer: AVAudioPlayer!
    var isOpenMeditation: Bool = false
    var openMeditationTimer: Double = 0.0
    var timer: Timer? = nil
    var durationStartTime: CFAbsoluteTime!
    var paused = false
    var sessionDuration: Double = 0.0
    var sessionStartDate: Date!
    let bellVolume = UserDefaults.standard.value(forKey: "bellVolume") as! Float
    
    // NOTE: - Removing images from launch version until we can figure out how to do images better
    
    // Properties to hold quote data
    var quote: String? = nil
//    var imageURL: String?
    var quoteAuthor: String? = nil
//    var quoteImage: UIImage? = nil
    
    // Delegate
    let delegate = UIApplication.shared.delegate as! AppDelegate
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Start the network activity indicator
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        
        // Start downloading the quote data
        getQuote { (success) in
            // Stop spinning the network indicator no matter what
            UIApplication.shared.isNetworkActivityIndicatorVisible = false
            
            if !success {
                // alternate quotes will be loaded in completed view controller
                // could access firebase database here later, if i set one up
                print("Not successful")
            }
        }
        
        // Start Duration Timer
        durationStartTime = CFAbsoluteTimeGetCurrent()
        sessionStartDate = Date.init()
        
        // Do any additional setup after loading the view.
        if let name = lessonFileName {
            audioURL = Bundle.main.url(forResource: name, withExtension: "mp3")
            if !isOpenMeditation {
                playAudio()
            } else if !(openMeditationTimer == 0.0) {
                setupTimer()
            } else {
                // nothing really should hapen
            }
            
        }
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // Don't let the phone go into idle mode
        UIApplication.shared.isIdleTimerDisabled = true
        navigationController?.navigationBar.isHidden = true
        navigationController?.hidesBarsOnTap = false
        meditationView.addMeditateAnimation()
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        if isOpenMeditation {
            timer?.invalidate()
            // Do finishing stuff here
        }
        
        // Re-enable idle timer
        UIApplication.shared.isIdleTimerDisabled = false

    }
    

    // MARK: - IBActions
    
    @IBAction func endSessionTapped(_ sender: Any) {
        // Update and save history to CoreData model, and add session to Healthkit
        updateCoreData()
        HealthKitExtension.saveMeditation(startDate: sessionStartDate, seconds: sessionDuration)
        
        // Show completion screen
        pushSessionCompleteView()
    }
    
    @IBAction func meditationViewTapped(_ sender: Any) {
        
        if !paused {
            paused = true
            meditationView.removeAllAnimations()
            endSessionButton.isHidden = false
            
            sessionDuration += calculateDuration()
            
            if !isOpenMeditation {
                audioPlayer.pause()
            } else if lessonFileName != "none" {
                timer?.invalidate()
            }
        }
        
        else {
            paused = false
            meditationView.addMeditateAnimation()
            endSessionButton.isHidden = true
            
            // Restart the duration timer
            durationStartTime = CFAbsoluteTimeGetCurrent()
            
            if !isOpenMeditation {
                audioPlayer.play()
            } else if lessonFileName != "none" {
                setupTimer()
            }
        }
    }
    
    // MARK: - Push to Session Complete View
    
    private func pushSessionCompleteView() {
        // Create variables for VC and course / lesson to load
        let completionVC = self.storyboard?.instantiateViewController(withIdentifier: "completedSession") as! SessionCompleteViewController
        
        // NOTE: - Removed images from launch version, will restore later when I figure out a better image source
        // May end up doing something with a remote database
//        completionVC.imageURLString = self.imageURL
        completionVC.quoteAuthorString = self.quoteAuthor
        completionVC.quoteBodyString = self.quote
        
        // Make sure there is an image before passing it
//        if let image = self.quoteImage {
//            completionVC.quoteUIImage = image
//        } else {
//            completionVC.quoteUIImage = nil
//        }
        
        navigationController?.pushViewController(completionVC, animated: false)
        
        
        }

    
    // MARK: AVAudio Functions
    
    private func playAudio() {
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: audioURL)
            audioPlayer.delegate = self
            
            if isOpenMeditation {
                audioPlayer.volume = bellVolume
            }
            
            audioPlayer.play()
        } catch {
            print("Unable to start audio player")
        }
    }
    
    // MARK: - Time Keeping
    
    // This sets up a timer used for playing bell audio
    private func setupTimer() {
        if lessonFileName != "none" {
            timer = Timer.scheduledTimer(withTimeInterval: openMeditationTimer, repeats: true, block: { (timer) in
                self.playAudio()
            })
        } else {
            print("No bells should play, so no timer will be setup")
        }
        
    }
    
    // This figures out how long the session ran
    // Will need to improve usage for cases where user paused for a while
    private func calculateDuration() -> Double {
        let durationEndTime = CFAbsoluteTimeGetCurrent()
        let duration = durationEndTime - durationStartTime
        return duration
    }
    
    // MARK: CoreData Update
    private func updateCoreData() {
        let coreDataLesson = Lesson(durationInSeconds: lesson.durationInSeconds, lessonLevel: Int64(lesson.lessonLevel), lessonName: lesson.lessonName, insertInto: delegate.stack.context)
        let meditation = Meditation(date: sessionStartDate as NSDate, durationInSeconds: sessionDuration, lesson: coreDataLesson, user: delegate.user, insertInto: delegate.stack.context)
        delegate.user.addToMeditationHistory(meditation)
        delegate.stack.save()
    }
    
    // MARK: AVAudioPlayerDelegate Functions
    
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        if !isOpenMeditation {
            // Stop the player, remove animations, and update duration
            audioPlayer.stop()
            meditationView.removeAllAnimations()
            sessionDuration += calculateDuration()
            
            if Int(coreDataCourse.userProgress) < maxLevel && maxLevel > 0 {
                coreDataCourse.userProgress += 1
            } else if maxLevel > 0 {
                coreDataCourse.completed = true
                coreDataCourse.userProgress = 1
            } else {
                coreDataCourse.userProgress = Int64(lesson.lessonLevel)
            }
            
            // call finishing up stuff which will save session to model / healthkit
            endSessionTapped(self)
        }
    }
}
