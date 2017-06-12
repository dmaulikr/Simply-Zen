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
        
        return SZCourse(named: "Heart Meditation Course", withlessons: heartLessons)
    }
    
    // MARK: - Beginning Zen Course
    static func beginningZenCourse() -> SZCourse {
        // create the lessons for the course
        var beginningZenLessons = [SZLesson]()
        let intro = SZLesson(addLesson: "Intro to Meditation", withFilename: "Intro to Meditation", level: 0, durationInSeconds: 180)
        let learnToBreath = SZLesson(addLesson: "Learning to Breath", withFilename: "Learning to Breath", level: 1, durationInSeconds: 600)
        let distractions = SZLesson(addLesson: "Dealing with Distractions", withFilename: "Dealing With Distractions", level: 2, durationInSeconds: 600)
        let deeperBreathAwareness = SZLesson(addLesson: "Deeper Breath Awareness", withFilename: "temp_4", level: 3, durationInSeconds: 600)
        let bodyAwareness = SZLesson(addLesson: "Becoming Aware of Your Body", withFilename: "temp_5", level: 4, durationInSeconds: 600)
        let fullSession = SZLesson(addLesson: "Full Meditation Session", withFilename: "temp_6", level: 5, durationInSeconds: 600)
        
        // add lessons
        beginningZenLessons.append(intro)
        beginningZenLessons.append(learnToBreath)
        beginningZenLessons.append(distractions)
        beginningZenLessons.append(deeperBreathAwareness)
        beginningZenLessons.append(bodyAwareness)
        beginningZenLessons.append(fullSession)
        
        return SZCourse(named: "Beginning Zen Course", withlessons: beginningZenLessons)
    }
    
    // MARK: - Advanced Breathing Course
    static func advancedBreathingCourse() -> SZCourse {
        // create the lessons for the course
        var advancedBreathingLessons = [SZLesson]()
        let intro = SZLesson(addLesson: "Intro to Advanced Breathing", withFilename: "temp_1", level: 0, durationInSeconds: 180)
        let findingFocus = SZLesson(addLesson: "Finding Your Focus", withFilename: "temp_2", level: 1, durationInSeconds: 600)
        let fullBreathAwareness = SZLesson(addLesson: "Full Breath Awareness", withFilename: "temp_3", level: 2, durationInSeconds: 600)
        let returningToBreath = SZLesson(addLesson: "Returning to the Breath", withFilename: "temp_4", level: 3, durationInSeconds: 600)
        let beingKind = SZLesson(addLesson: "Being Kind", withFilename: "temp_5", level: 4, durationInSeconds: 600)
        let fullSession = SZLesson(addLesson: "Full Breath Session", withFilename: "temp_6", level: 5, durationInSeconds: 600)
        
        // add lessons
        advancedBreathingLessons.append(intro)
        advancedBreathingLessons.append(findingFocus)
        advancedBreathingLessons.append(fullBreathAwareness)
        advancedBreathingLessons.append(returningToBreath)
        advancedBreathingLessons.append(beingKind)
        advancedBreathingLessons.append(fullSession)
        
        return SZCourse(named: "Advanced Breathing Course", withlessons: advancedBreathingLessons)
    }
    
    // MARK: - Learning to Relax Course
    static func relaxCourse() -> SZCourse {
        // create the lessons for the course
        var relaxLessons = [SZLesson]()
        let intro = SZLesson(addLesson: "Intro to Relaxing with Meditation", withFilename: "temp_1", level: 0, durationInSeconds: 180)
        let breathing = SZLesson(addLesson: "Breathing While Lying Down", withFilename: "temp_2", level: 1, durationInSeconds: 600)
        let learningToVisualize = SZLesson(addLesson: "Learning to Visualize", withFilename: "temp_3", level: 2, durationInSeconds: 600)
        let warmingYourBody = SZLesson(addLesson: "Warming Your Body", withFilename: "temp_4", level: 3, durationInSeconds: 600)
        let fillingWithSand = SZLesson(addLesson: "Filling With Sand", withFilename: "temp_5", level: 4, durationInSeconds: 600)
        let fullSession = SZLesson(addLesson: "Fully Relax", withFilename: "temp_6", level: 5, durationInSeconds: 600)
        
        // add lessons
        relaxLessons.append(intro)
        relaxLessons.append(breathing)
        relaxLessons.append(learningToVisualize)
        relaxLessons.append(warmingYourBody)
        relaxLessons.append(fillingWithSand)
        relaxLessons.append(fullSession)
        
        return SZCourse(named: "Learning to Relax Course", withlessons: relaxLessons)
    }
    
    // MARK: - Learning to let Go Course
    static func lettingGoCourse() -> SZCourse {
        // create the lessons for the course
        var lettingGoLessons = [SZLesson]()
        let intro = SZLesson(addLesson: "Intro to Letting Go with Meditation", withFilename: "temp_1", level: 0, durationInSeconds: 180)
        let lovingYourself = SZLesson(addLesson: "Loving Yourself", withFilename: "temp_2", level: 1, durationInSeconds: 600)
        let indentifyingHurt = SZLesson(addLesson: "Identifying Hurt", withFilename: "temp_3", level: 2, durationInSeconds: 600)
        let rejectNegativity = SZLesson(addLesson: "Rejecting Negativity", withFilename: "temp_4", level: 3, durationInSeconds: 600)
        let lettingGo = SZLesson(addLesson: "Letting Go", withFilename: "temp_5", level: 4, durationInSeconds: 600)
        let fullSession = SZLesson(addLesson: "Full Session", withFilename: "temp_6", level: 5, durationInSeconds: 600)
        
        // add lessons
        lettingGoLessons.append(intro)
        lettingGoLessons.append(lovingYourself)
        lettingGoLessons.append(indentifyingHurt)
        lettingGoLessons.append(rejectNegativity)
        lettingGoLessons.append(lettingGo)
        lettingGoLessons.append(fullSession)
        
        return SZCourse(named: "Learning to Let Go", withlessons: lettingGoLessons)
    }
    
}
