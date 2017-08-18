//
//  SettingsViewController.swift
//  Simply Zen
//
//  Created by Daniel Pratt on 5/23/17.
//  Copyright © 2017 Daniel Pratt. All rights reserved.
//

import UIKit
import AVFoundation
import TwitterKit

class SettingsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    // App Delegate
    let delegate = UIApplication.shared.delegate as! AppDelegate
    var audioURL: URL!
    var audioPlayer: AVAudioPlayer!
    var bellVolume: Float!

    @IBOutlet weak var bellSegmentedControl: UISegmentedControl!
    @IBOutlet weak var settingsTableView: UITableView!
    @IBOutlet weak var enableTwitterButton: UIButton!
    @IBOutlet weak var viewTutorialButton: UIButton!
    @IBOutlet weak var bellVolumeSlider: UISlider!
    
    // Arrays for cell data
    
    // Section Names
    private let courses = ["Heart Meditation", "Advanced Breathing", "Beginning Zen", "Relax", "Letting Go", "Upset", "Happy", "Can't Sleep", "Sad"]
    
    // Guided Courses
    private let heartCourse = SZCourse.heartMeditationCourse()
    private let advancedCourse = SZCourse.advancedBreathingCourse()
    private let beginningZenCourse = SZCourse.beginningZenCourse()
    private let relaxCourse = SZCourse.relaxCourse()
    private let lettingGoCourse = SZCourse.lettingGoCourse()
    
    // Mood Courses
    private let upsetCourse = SZCourse.upsetCourse()
    private let happyCourse = SZCourse.happyCourse()
    private let cantSleepCourse = SZCourse.cantSleepCourse()
    private let sadCourse = SZCourse.sadCourse()
    
    // Color For text
    let darkBlue = UIColor(red: 1.0 / 255.0, green: 84.0 / 255.0, blue: 147.0 / 255.0, alpha: 1)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        settingsTableView.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Make it easy to get back out of settings
        navigationController?.navigationBar.isHidden = false
        
        // Load UI with settings

        // Setup bell sound
        bellSegmentedControl.selectedSegmentIndex = getBellSegment()
        let name = getName(atSegment: bellSegmentedControl.selectedSegmentIndex)
        audioURL = Bundle.main.url(forResource: name, withExtension: "mp3")
        
        // Get volume control setup
        if let volume = UserDefaults.standard.value(forKey: "bellVolume") as? Float {
            bellVolume = volume
        } else {
            bellVolume = 0.2
            UserDefaults.standard.setValue(bellVolume, forKey: "bellVolume")
        }
        
        bellVolumeSlider.value = bellVolume
        print("The volume is set to \(String(describing: bellVolume))")
        
        // Setup button fonts
        
        viewTutorialButton.titleLabel?.font = UIFont(name: "STHeitiSC-Light", size: 18)
        
        if (Twitter.sharedInstance().sessionStore.hasLoggedInUsers()) {
            enableTwitterButton.isEnabled = false
            enableTwitterButton.isHidden = true
        } else {
            enableTwitterButton.titleLabel?.font = UIFont(name: "STHeitiSC-Light", size: 18)
        }
    }
    
    // MARK: - Save bell volume when view will disappear
    
    override func viewWillDisappear(_ animated: Bool) {
        // set the volume correctly
        UserDefaults.standard.setValue(bellVolume, forKey: "bellVolume")
    }

    // Change volume when slider value changes
    // note that slider isContinuous  value is false so that the bell sound will
    // only play after user interaction has ended
    @IBAction func bellSegmentChanged(_ sender: Any) {
        let name = getName(atSegment: bellSegmentedControl.selectedSegmentIndex)
        audioURL = Bundle.main.url(forResource: name, withExtension: "mp3")
        playAudio()

        setBellSound(atSegment: bellSegmentedControl.selectedSegmentIndex)
        delegate.stack.save()
    }
    
    // Play Sound using Current Settings
    func playAudio() {
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: audioURL)
            audioPlayer.volume = bellVolume
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
    
    // Change volume when slider moves and play the bell at new volume
    @IBAction func volumeSliderValueChanged(_ sender: UISlider) {
        bellVolume = bellVolumeSlider.value
        let _ = Timer.scheduledTimer(withTimeInterval: 0.2, repeats: false, block: { (timer) in
            self.playAudio()
        })
    }

    
    // MARK: - Enable Twitter Button Tapped
    @IBAction func enableTwitter(_ sender: Any) {
        let store = Twitter.sharedInstance().sessionStore
        
        if !store.hasLoggedInUsers() {
            Twitter.sharedInstance().logIn(completion: { (session, error) in
                if (session != nil) {
                    print("signed in as \(String(describing: session?.userName))")
                    store.save(session!, completion: { (authSession, error) in
                        print("saved session")
                        self.enableTwitterButton.isEnabled = false
                    })
                } else {
                    print("error: \(String(describing: error?.localizedDescription))")
                }
            })
        } else {
            print("Logged in user \(String(describing:store.session()?.userID))")
            self.enableTwitterButton.isEnabled = false
        }
    }
    
    // MARK: - View Tutorial Button tapped
    
    @IBAction func viewTutorial(_ sender: Any) {
        // sets a new rootVC
        let tutorialVC = storyboard?.instantiateViewController(withIdentifier: "pageVC") as! TutorialPageViewController
        UIApplication.shared.delegate?.window??.rootViewController = tutorialVC
    }

    // MARK: - Commented out, because I may use it again later on
//    // MARK: - Done Button tapped
//    @IBAction func doneButtonTapped(_ sender: Any) {
//        navigationController?.popViewController(animated: true)
//    }
    
    // MARK: - Table View Delegate Methods
    
    // Setup Sections
    func numberOfSections(in tableView: UITableView) -> Int {
        return courses.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return courses[section]
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        view.tintColor = darkBlue
        let header = view as! UITableViewHeaderFooterView
        header.textLabel?.textColor = .white
        header.textLabel?.font =  UIFont(name: "STHeitiSC-Light", size: 20)
    }
    
    // Mark: - Setup Table View
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let count = getCourseBy(section: section).lessons.count
        return count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "settingsCell") as! SettingsTableViewCell
        cell.lessonTitle.textColor = darkBlue
        cell.lessonTitle.font = UIFont(name: "STHeitiSC-Light", size: 14)
        cell.selectionStyle = .none
        cell.playButton.imageView?.contentMode = .scaleAspectFit
        
        cell.course = getCourseBy(section: indexPath.section)
        cell.lesson = cell.course?.lessons[indexPath.row]
        cell.meditationVC = storyboard?.instantiateViewController(withIdentifier: "meditationView") as? MeditationViewController
        cell.navigation = self.navigationController
        
        
        if let lessonName = cell.lesson?.lessonName {
            cell.lessonTitle.text = lessonName
        } else {
            // This shouldn't happen ever, but if it does, display something different
            // This text will be used mostly for debug purposes, and shouldn't ever show up
            // in a release product
            cell.lessonTitle.text = "Simply Zen"
        }
        
        
        
        return cell
    
    }
    
    // MARK: - Get Correct SZCourse

    private func getCourseBy(section: Int) -> SZCourse {
        switch section {
        case 0:
            return heartCourse
        case 1:
            return advancedCourse
        case 2:
            return beginningZenCourse
        case 3:
            return relaxCourse
        case 4:
            return lettingGoCourse
        case 5:
            return upsetCourse
        case 6:
            return happyCourse
        case 7:
            return cantSleepCourse
        case 8:
            return sadCourse
        default:
            print("Default case run, should not have been.  Check for logic error.")
            return sadCourse
        }
    }

}
