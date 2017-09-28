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
        audioURL = Bundle.main.url(forResource: "W1", withExtension: "mp3")
    }
    
    // MARK: AVAudio Functions

    mutating func playSoundEffect() {
        // Load sound effect
//        let audioURL = Bundle.main.url(forResource: "W1", withExtension: "mp3")
//        var audioPlayer: AVAudioPlayer!
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: audioURL!)
//            audioPlayer.delegate = self as? AVAudioPlayerDelegate
            audioPlayer.volume = 2.0
            print("Playing sound from struct")
            audioPlayer.play()
        } catch {
            print("Unable to start audio player")
        }
    }
    
}
