//
//  SZLesson.swift
//  Simply Zen
//
//  Created by Daniel Pratt on 5/15/17.
//  Copyright © 2017 Daniel Pratt. All rights reserved.
//

import Foundation
import UIKit

// MARK: SZLesson Class

/** Conforms to SZLessonProtocol 
 - Author: Daniel Pratt
 
 */
class SZLesson: SZLessonProtocol {
    
    var lessonName: String
    var lessonFileName: String
    var lessonLevel: Int
    var durationInSeconds: Double = 0
    
    init(addLesson name: String, withFilename file: String, level: Int, durationInSeconds: Double = 0) {
        lessonName = name
        lessonFileName = file
        lessonLevel = level
        self.durationInSeconds = durationInSeconds
    }
    
}
