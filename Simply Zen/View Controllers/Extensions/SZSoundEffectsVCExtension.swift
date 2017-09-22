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

extension UIViewController {
    
    // MARK: AVAudio Functions
    
    func playSoundEffect() {
        // Load sound effect
        guard let audioURL = Bundle.main.url(forResource: "W1", withExtension: "mp3") else {
            print("Error loading sound effect")
            return
        }
        do {
            let audioPlayer = try AVAudioPlayer(contentsOf: audioURL)
            audioPlayer.delegate = self as? AVAudioPlayerDelegate
            audioPlayer.volume = 0.3
            audioPlayer.play()
        } catch {
            print("Unable to start audio player")
        }
    }
    
}
