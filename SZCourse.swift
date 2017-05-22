//
//  SZCourse.swift
//  Simply Zen
//
//  Created by Daniel Pratt on 5/15/17.
//  Copyright © 2017 Daniel Pratt. All rights reserved.
//

import Foundation

// MARK: - SZCourse Class

/** Represents a course of lessons as an array of SZLesson Objects.
    It will also keep track of the names of each lesson and the filenames associated with them.
    Finally it will hold the user progress within the course.
 
 - Author: Daniel Pratt
 */

class SZCourse {
    
    let lessons: [SZLesson]!
    var lessonNames: [[String:String]] = []
    var userProgress: Int = 0
    
    init(lessons: [SZLesson]) {
        self.lessons = lessons
        
        for lesson in lessons {
            lessonNames.append(lesson.nameAndFilename)
        }
    }
    
}
