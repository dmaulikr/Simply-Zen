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
    
    var sut: SZLesson!
    
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
        
        sut = SZLesson(addLesson: lessonName, withFilename: fileName, level: level)
        
        // Make sure that properties have been set correctly
        XCTAssertEqual(sut.lessonName, lessonName)
        XCTAssertEqual(sut.lessonFileName, fileName)
        XCTAssertEqual(sut.lessonLevel, level)
    }
    
    // Make sure that lessons with duration can be added and that properties are set correctly
    func test_init_lessonWithDuration_canAddLesson() {
        let lessonName = "Intro to Heart Meditation"
        let fileName = "Intro to Heart Meditation"
        let level = 0
        let duration = 104.0
        
        sut = SZLesson(addLesson: lessonName, withFilename: fileName, level: level, durationInSeconds: duration)
        
        XCTAssertEqual(sut.lessonName, lessonName)
        XCTAssertEqual(sut.lessonFileName, fileName)
        XCTAssertEqual(sut.lessonLevel, level)
        XCTAssertEqual(sut.durationInSeconds, duration)
    }
    
    // Test performance of adding a lesson
    func test_addingLesson_Performance() {
        // This is an example of a performance test case.
        self.measure {
            let lessonName = "Intro to Heart Meditation"
            let fileName = "Intro to Heart Meditation"
            let level = 0
            let duration = 104.0
            
            self.sut = SZLesson(addLesson: lessonName, withFilename: fileName, level: level, durationInSeconds: duration)
        }
    }
    
}
