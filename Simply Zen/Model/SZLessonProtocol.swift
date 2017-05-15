//
//  SZLessonProtocol.swift
//  Simply Zen
//
//  Created by Daniel Pratt on 5/15/17.
//  Copyright © 2017 Daniel Pratt. All rights reserved.
//

import Foundation

/** Protocol that defines how lessons must be setup */
protocol SZLessonProtocol {
    var nameAndFilename: [String:String] { get }
    var lessonLevel: Int { get }
    var durationInSeconds: Double { get set }
}
