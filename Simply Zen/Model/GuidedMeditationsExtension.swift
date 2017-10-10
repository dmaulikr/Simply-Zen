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
        let intro = SZLesson(addLesson: "Intro to Heart Meditation", withFilename: "Intro to Heart meditation", level: 0, durationInSeconds: 104)
        let openToYourself = SZLesson(addLesson: "Opening Your Heart to Yourself", withFilename: "Opening Your Heart to Yourself", level: 1, durationInSeconds: 379)
        let openToOthers = SZLesson(addLesson: "Opening Your Heart to Others", withFilename: "Opening Your Heart to Others", level: 2, durationInSeconds: 418)
        let openToDifficult = SZLesson(addLesson: "Opening Your Heart to a Difficult Person", withFilename: "Opening Your Heart to Difficult People", level: 3, durationInSeconds: 487)
        let openToAll = SZLesson(addLesson: "Opening Your Heart to the Universe", withFilename: "Opening Your Heart to the Universe", level: 4, durationInSeconds: 626)
        let innerLight = SZLesson(addLesson: "Inner Light Meditation", withFilename: "Inner Light Meditation", level: 5, durationInSeconds: 617)
        
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
        let intro = SZLesson(addLesson: "Intro to Meditation", withFilename: "Intro to Meditation", level: 0, durationInSeconds: 108)
        let learnToBreath = SZLesson(addLesson: "Learning to Breath", withFilename: "Learning to Breath", level: 1, durationInSeconds: 227)
        let distractions = SZLesson(addLesson: "Dealing with Distractions", withFilename: "Dealing with Distractions", level: 2, durationInSeconds: 290)
        let deeperBreathAwareness = SZLesson(addLesson: "Deeper Breath Awareness", withFilename: "Deeper Breath Awareness", level: 3, durationInSeconds: 339)
        let bodyAwareness = SZLesson(addLesson: "Becoming Aware of Your Body", withFilename: "Becoming Aware of Your Body", level: 4, durationInSeconds: 317)
        let fullSession = SZLesson(addLesson: "Full Meditation Session", withFilename: "Full Meditation Session", level: 5, durationInSeconds: 376)
        
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
        let intro = SZLesson(addLesson: "Intro to Advanced Breathing", withFilename: "Intro to Advanced Breathing", level: 0, durationInSeconds: 116)
        let findingFocus = SZLesson(addLesson: "Finding Your Focus", withFilename: "Finding Your Focus", level: 1, durationInSeconds: 351)
        let fullBreathAwareness = SZLesson(addLesson: "Full Breath Awareness", withFilename: "Full Breath Awareness", level: 2, durationInSeconds: 373)
        let returningToBreath = SZLesson(addLesson: "Returning to the Breath", withFilename: "Returning to the Breath", level: 3, durationInSeconds: 446)
        let beingKind = SZLesson(addLesson: "Being Kind", withFilename: "Being Kind", level: 4, durationInSeconds: 554)
        let fullSession = SZLesson(addLesson: "Full Breath Session", withFilename: "Full Breath Session", level: 5, durationInSeconds: 629)
        
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
        let intro = SZLesson(addLesson: "Intro to Relaxing with Meditation", withFilename: "Intro to Relaxing with Meditation", level: 0, durationInSeconds: 60)
        let breathing = SZLesson(addLesson: "Breathing While Lying Down", withFilename: "Breathing While Lying Down", level: 1, durationInSeconds: 358)
        let learningToVisualize = SZLesson(addLesson: "Learning to Visualize", withFilename: "Learning to Visualize", level: 2, durationInSeconds: 422)
        let warmingYourBody = SZLesson(addLesson: "Warming Your Body", withFilename: "Warming Your Body", level: 3, durationInSeconds: 317)
        let fillingWithSand = SZLesson(addLesson: "Filling With Sand", withFilename: "Filling With Sand", level: 4, durationInSeconds: 337)
        let fullSession = SZLesson(addLesson: "Fully Relax", withFilename: "Fully Relax", level: 5, durationInSeconds: 440)
        
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
        let intro = SZLesson(addLesson: "Intro to Letting Go with Meditation", withFilename: "Intro to Letting Go with Meditation", level: 0, durationInSeconds: 95)
        let lovingYourself = SZLesson(addLesson: "Loving Yourself", withFilename: "Loving Yourself", level: 1, durationInSeconds: 372)
        let indentifyingHurt = SZLesson(addLesson: "Identifying Hurt", withFilename: "Identifying Hurt", level: 2, durationInSeconds: 398)
        let rejectNegativity = SZLesson(addLesson: "Rejecting Negativity", withFilename: "Rejecting Negativity", level: 3, durationInSeconds: 468)
        let lettingGo = SZLesson(addLesson: "Letting Go", withFilename: "Letting Go", level: 4, durationInSeconds: 370)
        let fullSession = SZLesson(addLesson: "Full Session", withFilename: "Full Letting Go Session", level: 5, durationInSeconds: 623)
        
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
