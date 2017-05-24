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
    
    // Delegate
    let delegate = UIApplication.shared.delegate as! AppDelegate
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // test to make sure we are getting the correct lesson
        print("Lesson Name: \(lesson.lessonName)")
        print("Lesson Filename: \(lessonFileName)")
        
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
        
        meditationView.addMeditateAnimation()
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        if isOpenMeditation {
            timer?.invalidate()
            // Do finishing stuff here
        }
    }
    

    // MARK: - IBActions
    
    @IBAction func endSessionTapped(_ sender: Any) {
        // Will write end session code later
        print("Duration: \(String(describing: sessionDuration))")
        updateCoreData()
        HealthKitExtension.saveMeditation(startDate: sessionStartDate, seconds: sessionDuration)
        navigationController?.popToRootViewController(animated: true)
    }
    
    @IBAction func meditationViewTapped(_ sender: Any) {
        print("Meditation View meditationViewTapped")
        
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
    
    // MARK: AVAudio Functions
    
    func playAudio() {
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: audioURL)
            audioPlayer.delegate = self
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
            audioPlayer.stop()
            print("Finished playing")
            // call finishing up stuff which will save session to model / healthkit
            // and display completion screen
        }
    }
    

}
