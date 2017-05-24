//
//  SettingsViewController.swift
//  Simply Zen
//
//  Created by Daniel Pratt on 5/23/17.
//  Copyright © 2017 Daniel Pratt. All rights reserved.
//

import UIKit
import AVFoundation

class SettingsViewController: UIViewController {
    
    // App Delegate
    let delegate = UIApplication.shared.delegate as! AppDelegate
    var audioURL: URL!
    var audioPlayer: AVAudioPlayer!

    @IBOutlet weak var bellSegmentedControl: UISegmentedControl!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        bellSegmentedControl.selectedSegmentIndex = getBellSegment()
    }

    @IBAction func bellSegmentChanged(_ sender: Any) {
        
        let name = getName(atSegment: bellSegmentedControl.selectedSegmentIndex)
        audioURL = Bundle.main.url(forResource: name, withExtension: "mp3")
        
        playAudio()

        setBellSound(atSegment: bellSegmentedControl.selectedSegmentIndex)
        delegate.stack.save()
    }
    
    func playAudio() {
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: audioURL)
            audioPlayer.play()
        } catch {
            print("Unable to start audio player")
        }
    }
    
    func getName(atSegment segment: Int) -> String {
        switch segment {
        case 0:
            return "burmese-bell"
        case 1:
            return "kyoto-temple-bell"
        case 2:
            return "thai-bell"
        case 3:
            return "tibetan-bell"
        default:
            return "burmese-bell"
        }
    }
    
    func getBellSegment() -> Int{
        // Setup segment control
        let bellSound = delegate.user.bellSound
        
        var segment = 0
        
        switch bellSound {
        case "burmese":
            segment = 0
        case "kyoto":
            segment = 1
        case "thai":
            segment = 2
        case "tibetan":
            segment = 3
        default:
            segment = 0
        }
        
        return segment
    }
    
    func setBellSound(atSegment segment: Int) {
        switch segment {
        case 0:
            delegate.user.bellSound = "burmese"
        case 1:
            delegate.user.bellSound = "kyoto"
        case 2:
            delegate.user.bellSound = "thai"
        case 3:
            delegate.user.bellSound = "tibetan"
        default: break
        }
    }

}
