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
class SZLesson: SZLessonProtocol, NSCoding {
    
    // Coder Key Constants
    let nameAndFileNameKey = "nameAndFileName"
    let lessonLevelKey = "lessonLevel"
    let durationInSecondsKey = "durationInSeconds"
    
    var nameAndFilename: [String : String]
    var lessonLevel: Int
    var durationInSeconds: Double = 0
    
    init(addLesson name: String, withFilename file: String, level: Int, durationInSeconds: Double = 0) {
        nameAndFilename = [name : file]
        lessonLevel = level
        self.durationInSeconds = durationInSeconds
    }
    
    required init?(coder aCoder: NSCoder) {
        self.nameAndFilename = aCoder.decodeObject(forKey: nameAndFileNameKey) as! [String: String]
        self.lessonLevel = aCoder.decodeObject(forKey: lessonLevelKey) as! Int
        self.durationInSeconds = aCoder.decodeObject(forKey: durationInSecondsKey) as! Double
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(self.nameAndFilename, forKey: nameAndFileNameKey)
        aCoder.encode(self.lessonLevel, forKey: lessonLevelKey)
        aCoder.encode(self.durationInSeconds, forKey: durationInSecondsKey)
    }
}
