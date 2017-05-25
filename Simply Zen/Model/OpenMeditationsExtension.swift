//
//  OpenMeditationsExtension.swift
//  Simply Zen
//
//  Created by Daniel Pratt on 5/25/17.
//  Copyright © 2017 Daniel Pratt. All rights reserved.
//

import Foundation

// MARK: - SZCourse Extension for Open Meditations

extension SZCourse {
    
    // Build the open meditation courses for different bell types
    static func openMeditationCourses() -> SZCourse {
        // Create the lessons for "course"
        var openLessons = [SZLesson]()
        let burmeseBells = SZLesson(addLesson: "burmese", withFilename: "burmese-bell", level: 0)
        let kyotoTempleBells = SZLesson(addLesson: "kyoto", withFilename: "kyoto-temple-bell", level: 0)
        let thaiBells = SZLesson(addLesson: "thai", withFilename: "thai-bell", level: 0)
        let tibetanBells = SZLesson(addLesson: "tibetan", withFilename: "tibetan-bell", level: 0)
        let noBells = SZLesson(addLesson: "none", withFilename: "none", level: 0)
        
        // Add lessons
        openLessons.append(burmeseBells)
        openLessons.append(kyotoTempleBells)
        openLessons.append(thaiBells)
        openLessons.append(tibetanBells)
        openLessons.append(noBells)
        
        return SZCourse(lessons: openLessons)
    }
    
}
