//
//  SZCourse.swift
//  Simply Zen
//
//  Created by Daniel Pratt on 5/15/17.
//  Copyright © 2017 Daniel Pratt. All rights reserved.
//

import Foundation

// MARK: - Struct for OpenZen Courses

struct OpenZenLessons {
    static let Burmese = 0
    static let Kyoto = 1
    static let Thai = 2
    static let Tibet = 3
    static let None = 4
}

// MARK: - SZCourse Class

/** Represents a course of lessons as an array of SZLesson Objects.
    It will also keep track of the names of each lesson and the filenames associated with them.
    Finally it will hold the user progress within the course.
 
 - Author: Daniel Pratt
 */

class SZCourse {

    let lessons: [SZLesson]!
    
    init(lessons: [SZLesson]) {
        self.lessons = lessons
    }
    
}
