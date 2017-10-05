//
//  SZSoundEffectsVCExtension.swift
//  Simply Zen
//
//  Created by Daniel Pratt on 9/22/17.
//  Copyright © 2017 Daniel Pratt. All rights reserved.
//

import Foundation
import UIKit
import AVFoundation

struct SoundEffect {
    
    var audioURL: URL!
    var audioPlayer: AVAudioPlayer!
    
    init() {
        let soundString = pickRandomAudioURL()
        print("The soundString is : \(String(describing: soundString))")
        audioURL = Bundle.main.url(forResource: soundString, withExtension: "mp3")
    }
    
    // MARK: AVAudio Functions

    mutating func playSoundEffect() {

        do {
            audioPlayer = try AVAudioPlayer(contentsOf: audioURL!)
            audioPlayer.volume = 2.0
            print("Playing sound from struct")
            audioPlayer.play()
        } catch {
            print("Unable to start audio player")
        }
    }
    
    func pickRandomAudioURL() -> String {
        let randomNumber = arc4random_uniform(5) + 1
        
        switch randomNumber {
        case 1:
            return "W1"
        case 2:
            return "W2"
        case 3:
            return "W3"
        case 4:
            return "W4"
        case 5:
            return "W5"
        default:
            return "W1"
        }
    }
    
}
