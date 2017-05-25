//
//  MoodMeditationsExtension.swift
//  Simply Zen
//
//  Created by Daniel Pratt on 5/25/17.
//  Copyright © 2017 Daniel Pratt. All rights reserved.
//

import Foundation

extension SZCourse {
    
    // MARK: - SZCourse Extension for Mood Based Meditations
    
    // MARK: - Can't Sleep Course
    static func cantSleepCourse() -> SZCourse {
        // create the lessons for the course
        var cantSleepLessons = [SZLesson]()
        let findingPeace = SZLesson(addLesson: "Finding a Peaceful Place", withFilename: "temp_1", level: 0, durationInSeconds: 180)
        let floating = SZLesson(addLesson: "Floating on a Cloud", withFilename: "temp_2", level: 1, durationInSeconds: 600)
        let fillingWithSand = SZLesson(addLesson: "Filling With Sand", withFilename: "temp_3", level: 2, durationInSeconds: 600)
        let warmingYourBody = SZLesson(addLesson: "Warming Your Body", withFilename: "temp_4", level: 3, durationInSeconds: 600)

        
        // add lessons
        cantSleepLessons.append(findingPeace)
        cantSleepLessons.append(floating)
        cantSleepLessons.append(fillingWithSand)
        cantSleepLessons.append(warmingYourBody)

        
        return SZCourse(lessons: cantSleepLessons)
    }
    
    // MARK: - Upset Course
    static func upsetCourse() -> SZCourse {
        // create the lessons for the course
        var upsetLessons = [SZLesson]()
        let lettingGo = SZLesson(addLesson: "Letting Go Full Session", withFilename: "temp_1", level: 0, durationInSeconds: 180)
        let rejectingNegativity = SZLesson(addLesson: "Rejecting Negativity", withFilename: "temp_2", level: 1, durationInSeconds: 600)
        let breathingAwayAnger = SZLesson(addLesson: "Breathing Away Anger", withFilename: "temp_3", level: 2, durationInSeconds: 600)
        let visualizingAnger = SZLesson(addLesson: "Visualizing Anger", withFilename: "temp_4", level: 3, durationInSeconds: 600)
        
        
        // add lessons
        upsetLessons.append(lettingGo)
        upsetLessons.append(rejectingNegativity)
        upsetLessons.append(breathingAwayAnger)
        upsetLessons.append(visualizingAnger)
        
        
        return SZCourse(lessons: upsetLessons)
    }
    
    // MARK: - Happy Course
    static func happyCourse() -> SZCourse {
        // create the lessons for the course
        var happyLessons = [SZLesson]()
        let innerLight = SZLesson(addLesson: "Inner Light Meditation", withFilename: "temp_1", level: 0, durationInSeconds: 180)
        let openingToUniverse = SZLesson(addLesson: "Opening Your Heart to the Universe", withFilename: "temp_2", level: 1, durationInSeconds: 600)
        let openingToOthers = SZLesson(addLesson: "Opening Your Heart to Others", withFilename: "temp_3", level: 2, durationInSeconds: 600)
        let exploringHapiness = SZLesson(addLesson: "Exploring Happiness", withFilename: "temp_4", level: 3, durationInSeconds: 600)
        
        
        // add lessons
        happyLessons.append(innerLight)
        happyLessons.append(openingToUniverse)
        happyLessons.append(openingToOthers)
        happyLessons.append(exploringHapiness)
        
        
        return SZCourse(lessons: happyLessons)
    }
    
    // MARK: - Sad Course
    static func sadCourse() -> SZCourse {
        // create the lessons for the course
        var sadLessons = [SZLesson]()
        let openToYourself = SZLesson(addLesson: "Opening Your Heart to Yourself", withFilename: "temp_1", level: 0, durationInSeconds: 180)
        let identifyingSadness = SZLesson(addLesson: "Identifying Sadness", withFilename: "temp_2", level: 1, durationInSeconds: 600)
        let seekingHappiness = SZLesson(addLesson: "Seeking Happiness", withFilename: "temp_3", level: 2, durationInSeconds: 600)
        let selfAffirmations = SZLesson(addLesson: "Self Affirmations", withFilename: "temp_4", level: 3, durationInSeconds: 600)
        
        
        // add lessons
        sadLessons.append(openToYourself)
        sadLessons.append(identifyingSadness)
        sadLessons.append(seekingHappiness)
        sadLessons.append(selfAffirmations)
        
        
        return SZCourse(lessons: sadLessons)
    }
    
}
