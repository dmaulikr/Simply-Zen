//
//  SettingsViewController.swift
//  Simply Zen
//
//  Created by Daniel Pratt on 5/23/17.
//  Copyright © 2017 Daniel Pratt. All rights reserved.
//

import UIKit
import AVFoundation

class SettingsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    // App Delegate
    let delegate = UIApplication.shared.delegate as! AppDelegate
    var audioURL: URL!
    var audioPlayer: AVAudioPlayer!

    @IBOutlet weak var bellSegmentedControl: UISegmentedControl!
    @IBOutlet weak var settingsTableView: UITableView!
    
    // Arrays for cell data
    private let guidedCourses = ["Heart Meditation", "Advanced Breathing", "Beginning Zen", "Relax, Letting Go"]
    private let moodCourses = ["Upset", "Happy", "Can't Sleep", "Sad"]
    
    // Color For text
    let darkBlue = UIColor(red: 1.0 / 255.0, green: 84.0 / 255.0, blue: 147.0 / 255.0, alpha: 1)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        settingsTableView.delegate = self
        
        
    }
    
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
    
    // MARK: - Table View Delegate Methods
    
    // Mark: - Setup Sections
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "Guided Zen"
        } else {
            return "Mood Zen"
        }
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        view.tintColor = UIColor.clear
        let header = view as! UITableViewHeaderFooterView
        header.textLabel?.textColor = darkBlue
        header.textLabel?.font =  UIFont(name: "STHeitiSC-Light", size: 20)
    }
    
    // Mark: - Setup Table View
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return guidedCourses.count
        } else {
            return moodCourses.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "settingsCell")
        cell?.textLabel?.textColor = darkBlue
        cell?.textLabel?.font = UIFont(name: "STHeitiSC-Light", size: 14)
        cell?.selectionStyle = .none
        
        
        if indexPath.section == 0 {
            cell?.textLabel?.text = guidedCourses[indexPath.row]
        } else {
            cell?.textLabel?.text = moodCourses[indexPath.row]
        }
        
        return cell!
    
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0 {
            pushGuided(indexPath.row)
        } else {
            pushMood(indexPath.row)
        }
    }
    
    // MARK: - Pushing
    
    private func pushGuided(_ index: Int) {
        print(index)
    }
    
    private func pushMood(_ index: Int) {
        print(index)
    }

}
