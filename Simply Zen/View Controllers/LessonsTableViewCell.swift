//
//  LessonsTableViewCell.swift
//  Simply Zen
//
//  Created by Daniel Pratt on 10/4/17.
//  Copyright © 2017 Daniel Pratt. All rights reserved.
//

import UIKit

class LessonsTableViewCell: UITableViewCell {

    @IBOutlet weak var lessonTitle: UILabel!
    @IBOutlet weak var playButton: UIButton!
    
    // Course info
    var lesson: SZLesson?
    var course: SZCourse?
    
    // View to load
    var meditationVC: MeditationViewController?
    var navigation: UINavigationController?
    
    // Delegate
    let delegate = UIApplication.shared.delegate as! AppDelegate
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    @IBAction func playButtonTapped(_ sender: Any) {
        print("Playing \(String(describing: lesson?.lessonName))")
        // Create variables for VC and course / lesson to load
        
        let selectedCourse = course?.name
        var addedCourse = false
        var coreDataCourse: Course!
        let maxLevel = course?.lessons.count
        
        // Check to see if the user already has a history
        if let courses = self.delegate.user.courses?.array as? [Course] {
            for course in courses {
                if course.courseName == selectedCourse {
                    addedCourse = true
                    coreDataCourse = course
                    _ = Int(course.userProgress)
                    break
                }
            }
        }
        
        // If the course hasn't been added yet create it and add to the user
        if !addedCourse {
            // create course Core Data object and add it to user
            print("creating course")
            coreDataCourse = Course(courseName: selectedCourse!, user: delegate.user, insertInto: delegate.stack.context)
            delegate.user.addToCourses(coreDataCourse)
            print(delegate.user.courses?.array ?? "No courses")
            delegate.stack.save()
        }
        
        
        // Load lesson and attach to meditationVC
        meditationVC?.lesson = self.lesson
        meditationVC?.lessonFileName = meditationVC?.lesson.lessonFileName
        meditationVC?.coreDataCourse = coreDataCourse
        meditationVC?.maxLevel = maxLevel!
        navigation?.pushViewController(meditationVC!, animated: true)
    }

}
