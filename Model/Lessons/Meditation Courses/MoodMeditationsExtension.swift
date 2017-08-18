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
        let findingPeace = SZLesson(addLesson: "Finding a Peaceful Place", withFilename: "Finding a Peaceful Place", level: 0, durationInSeconds: 180)
        let floating = SZLesson(addLesson: "Floating on a Cloud", withFilename: "Floating on a Cloud", level: 1, durationInSeconds: 317)
        let fillingWithSand = SZLesson(addLesson: "Filling With Sand", withFilename: "Filling With Sand", level: 2, durationInSeconds: 600)
        let warmingYourBody = SZLesson(addLesson: "Warming Your Body", withFilename: "Warming Your Body No Intro", level: 3, durationInSeconds: 317)

        
        // add lessons
        cantSleepLessons.append(findingPeace)
        cantSleepLessons.append(floating)
        cantSleepLessons.append(fillingWithSand)
        cantSleepLessons.append(warmingYourBody)

        
        return SZCourse(named: "Can't Sleep Course", withlessons: cantSleepLessons)
    }
    
    // MARK: - Upset Course
    static func upsetCourse() -> SZCourse {
        // create the lessons for the course
        var upsetLessons = [SZLesson]()
        let lettingGo = SZLesson(addLesson: "Letting Go Full Session", withFilename: "Full Letting Go Session No Intro", level: 0, durationInSeconds: 623)
        let rejectingNegativity = SZLesson(addLesson: "Rejecting Negativity", withFilename: "Rejecting Negativity No Intro", level: 1, durationInSeconds: 468)
        let breathingAwayAnger = SZLesson(addLesson: "Breathing Away Anger", withFilename: "Breathing Away Anger", level: 2, durationInSeconds: 361)
        let visualizingAnger = SZLesson(addLesson: "Visualizing Anger", withFilename: "Visualizing Anger", level: 3, durationInSeconds: 330)
        
        
        // add lessons
        upsetLessons.append(lettingGo)
        upsetLessons.append(rejectingNegativity)
        upsetLessons.append(breathingAwayAnger)
        upsetLessons.append(visualizingAnger)
        
        
        return SZCourse(named: "Upset Course", withlessons: upsetLessons)
    }
    
    // MARK: - Happy Course
    static func happyCourse() -> SZCourse {
        // create the lessons for the course
        var happyLessons = [SZLesson]()
        let innerLight = SZLesson(addLesson: "Inner Light Meditation", withFilename: "Inner Light Meditation No Intro", level: 0, durationInSeconds: 580)
        let openingToUniverse = SZLesson(addLesson: "Opening Your Heart to the Universe", withFilename: "Opening Your Heart to the Universe No Intro", level: 1, durationInSeconds: 584)
        let openingToOthers = SZLesson(addLesson: "Opening Your Heart to Others", withFilename: "Opening Your Heart to Others No Intro", level: 2, durationInSeconds: 386)
        let exploringHapiness = SZLesson(addLesson: "Exploring Happiness", withFilename: "Exploring Happiness", level: 3, durationInSeconds: 370)
        
        
        // add lessons
        happyLessons.append(innerLight)
        happyLessons.append(openingToUniverse)
        happyLessons.append(openingToOthers)
        happyLessons.append(exploringHapiness)
        
        
        return SZCourse(named: "Happiness Course", withlessons: happyLessons)
    }
    
    // MARK: - Overcoming Sad Course
    static func sadCourse() -> SZCourse {
        // create the lessons for the course
        var sadLessons = [SZLesson]()
        let openToYourself = SZLesson(addLesson: "Opening Your Heart to Yourself", withFilename: "Opening Your Heart to Yourself No Intro", level: 0, durationInSeconds: 360)
        let identifyingSadness = SZLesson(addLesson: "Identifying Sadness", withFilename: "Identifying Sadness", level: 1, durationInSeconds: 397)
        let seekingHappiness = SZLesson(addLesson: "Seeking Happiness", withFilename: "Seeking Happiness", level: 2, durationInSeconds: 361)
        let selfAffirmations = SZLesson(addLesson: "Self Affirmations", withFilename: "Self Affirmations", level: 3, durationInSeconds: 562)
        
        
        // add lessons
        sadLessons.append(openToYourself)
        sadLessons.append(identifyingSadness)
        sadLessons.append(seekingHappiness)
        sadLessons.append(selfAffirmations)
        
        
        return SZCourse(named: "Overcoming Sadness Course", withlessons: sadLessons)
    }
    
}
