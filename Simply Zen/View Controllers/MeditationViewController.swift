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
    @IBOutlet weak var meditationView: MeditationView!
    
    // Class Properites
    var lessonName: String? = nil
    var audioURL: URL!
    var audioPlayer: AVAudioPlayer!
    var isOpenMeditation: Bool = false
    var openMeditationTimer: Double = 0.0
    var timer: Timer?
    
    // Delegate
    let delegate = UIApplication.shared.delegate as! AppDelegate
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if let name = lessonName {
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
        }
    }
    

    @IBAction func meditationViewTapped(_ sender: Any) {
        print("Meditation View meditationViewTapped")
        if isOpenMeditation && (timer?.isValid)! {
            timer?.invalidate()
            print("invalidating")
        } else if isOpenMeditation {
            setupTimer()
        } else if audioPlayer.isPlaying {
            audioPlayer.pause()
        } else {
            audioPlayer.play()
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
    
    // MARK: - Timer
    
    func setupTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: openMeditationTimer, repeats: true, block: { (timer) in
            self.playAudio()
        })
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
