//
//  MeditationViewController.swift
//  Simply Zen
//
//  Created by Daniel Pratt on 5/19/17.
//  Copyright © 2017 Daniel Pratt. All rights reserved.
//

import UIKit
import AVFoundation

class MeditationViewController: UIViewController, AVAudioPlayerDelegate {

    @IBOutlet weak var meditationView: MeditationView!
    var lessonName: String? = nil
    var audioURL: URL!
    var audioPlayer: AVAudioPlayer!
    
    let delegate = UIApplication.shared.delegate as! AppDelegate
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if let name = lessonName {
            audioURL = Bundle.main.url(forResource: name, withExtension: "mp3")
            playAudio()
        }
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        meditationView.addMeditateAnimation()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func meditationViewTapped(_ sender: Any) {
        print("Meditation View meditationViewTapped")
        if audioPlayer.isPlaying {
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
    
    // MARK: AVAudioPlayerDelegate Functions
    
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        audioPlayer.stop()
        print("Finished playing")
        // Will save session to healthkit and then display the completion screen
    }
    

}
