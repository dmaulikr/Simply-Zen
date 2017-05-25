//
//  GuidedMeditationsExtension.swift
//  Simply Zen
//
//  Created by Daniel Pratt on 5/25/17.
//  Copyright © 2017 Daniel Pratt. All rights reserved.
//

import Foundation

// MARK: - SZCourse Extension for Guided Meditations

extension SZCourse {
    
    // MARK: - Heart Meditation Course
    static func heartMeditationCourse() -> SZCourse {
        // create the lessons for the course
        var heartLessons = [SZLesson]()
        let intro = SZLesson(addLesson: "Intro to Heart Meditation", withFilename: "temp_1", level: 0, durationInSeconds: 180)
        let openToYourself = SZLesson(addLesson: "Opening Your Heart to Yourself", withFilename: "temp_2", level: 1, durationInSeconds: 600)
        let openToOthers = SZLesson(addLesson: "Opening Your Heart to Others", withFilename: "temp_3", level: 2, durationInSeconds: 600)
        let openToDifficult = SZLesson(addLesson: "Opening Your Heart to a Difficult Person", withFilename: "temp_4", level: 3, durationInSeconds: 600)
        let openToAll = SZLesson(addLesson: "Opening Your Heart to the Universe", withFilename: "temp_5", level: 4, durationInSeconds: 600)
        let innerLight = SZLesson(addLesson: "Inner Light Meditation", withFilename: "temp_6", level: 5, durationInSeconds: 600)
        
        // add lessons
        heartLessons.append(intro)
        heartLessons.append(openToYourself)
        heartLessons.append(openToOthers)
        heartLessons.append(openToDifficult)
        heartLessons.append(openToAll)
        heartLessons.append(innerLight)
        
        return SZCourse(lessons: heartLessons)
    }
}
