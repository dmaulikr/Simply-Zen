//
//  SZModelTests.swift
//  Simply Zen
//
//  Created by Daniel Pratt on 8/18/17.
//  Copyright © 2017 Daniel Pratt. All rights reserved.
//

import XCTest
@testable import Simply_Zen

class SZModelTests: XCTestCase {
    
    var lesson: SZLesson!
    var course: SZCourse!
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    // MARK: - Tests that ensures lessons can be added
    
    // This test checks that a lesson can be created without specifiying a duration
    // Since this option is specific to open lessons tests will use bells
    func test_init_lessonWithoutDuration_canAddLesson() {
        let lessonName = "burmese"
        let fileName = "burmese-bell"
        let level = 0
        
        lesson = SZLesson(addLesson: lessonName, withFilename: fileName, level: level)
        
        // Make sure that properties have been set correctly
        XCTAssertEqual(lesson.lessonName, lessonName)
        XCTAssertEqual(lesson.lessonFileName, fileName)
        XCTAssertEqual(lesson.lessonLevel, level)
    }
    
    // Make sure that lessons with duration can be added and that properties are set correctly
    func test_init_lessonWithDuration_canAddLesson() {
        let lessonName = "Intro to Heart Meditation"
        let fileName = "Intro to Heart Meditation"
        let level = 0
        let duration = 104.0
        
        lesson = SZLesson(addLesson: lessonName, withFilename: fileName, level: level, durationInSeconds: duration)
        
        XCTAssertEqual(lesson.lessonName, lessonName)
        XCTAssertEqual(lesson.lessonFileName, fileName)
        XCTAssertEqual(lesson.lessonLevel, level)
        XCTAssertEqual(lesson.durationInSeconds, duration)
    }
    
    // Test performance of adding a lesson
    func test_addingLesson_Performance() {
        // This is an example of a performance test case.
        self.measure {
            let lessonName = "Intro to Heart Meditation"
            let fileName = "Intro to Heart Meditation"
            let level = 0
            let duration = 104.0
            
            self.lesson = SZLesson(addLesson: lessonName, withFilename: fileName, level: level, durationInSeconds: duration)
        }
    }
    
    // MARK: - Tests for specific courses
    
    // MARK: - Heart Meditation
    
    // Test that heart meditation course can be created
    func test_heartMeditationCourse_canCreate() {
        course = SZCourse.heartMeditationCourse()
        
        // Check name of course
        XCTAssertEqual(course.name, "Heart Meditation Course")
        
        // Check that there are 6 lessons
        XCTAssertEqual(course.lessons.count, 6)
        
        // Make sure that lessons inside course have correct name, filename, level, and duration
        for courseLesson in course.lessons {
            switch courseLesson.lessonLevel {
            case 0:
                XCTAssertEqual(courseLesson.lessonName, "Intro to Heart Meditation")
                XCTAssertEqual(courseLesson.lessonFileName, "Intro to Hearth meditation")
                XCTAssertEqual(courseLesson.durationInSeconds, 104)
            case 1:
                XCTAssertEqual(courseLesson.lessonName, "Opening Your Heart to Yourself")
                XCTAssertEqual(courseLesson.lessonFileName, "Opening Your Heart to Yourself")
                XCTAssertEqual(courseLesson.durationInSeconds, 379)
            case 2:
                XCTAssertEqual(courseLesson.lessonName, "Opening Your Heart to Others")
                XCTAssertEqual(courseLesson.lessonFileName, "Opening Your Heart to Others")
                XCTAssertEqual(courseLesson.durationInSeconds, 418)
            case 3:
                XCTAssertEqual(courseLesson.lessonName, "Opening Your Heart to a Difficult Person")
                XCTAssertEqual(courseLesson.lessonFileName, "Opening Your Heart to Difficult People")
                XCTAssertEqual(courseLesson.durationInSeconds, 487)
            case 4:
                XCTAssertEqual(courseLesson.lessonName, "Opening Your Heart to the Universe")
                XCTAssertEqual(courseLesson.lessonFileName, "Opening Your Heart to the Universe")
                XCTAssertEqual(courseLesson.durationInSeconds, 626)
            case 5:
                XCTAssertEqual(courseLesson.lessonName, "Inner Light Meditation")
                XCTAssertEqual(courseLesson.lessonFileName, "Inner Light Meditation")
                XCTAssertEqual(courseLesson.durationInSeconds, 617)
            default:
                XCTFail()
            }
        }
    }
    
}
