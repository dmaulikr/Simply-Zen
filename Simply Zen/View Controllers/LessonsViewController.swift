//
//  LessonsViewController.swift
//  Simply Zen
//
//  Created by Daniel Pratt on 10/4/17.
//  Copyright © 2017 Daniel Pratt. All rights reserved.
//

import UIKit

class LessonsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    // MARK: - Cell DataConstants
    
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
    
    // TableView
    @IBOutlet weak var lessonsTableView: UITableView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Set delegate for TableView
        lessonsTableView.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Make sure that navigation is hidden
        navigationController?.navigationBar.isHidden = true
    }

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
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "lessonsCell") as! LessonsTableViewCell
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
