//
//  Lesson+CoreDataClass.swift
//  Simply Zen
//
//  Created by Daniel Pratt on 5/23/17.
//  Copyright © 2017 Daniel Pratt. All rights reserved.
//

import Foundation
import CoreData

@objc(Lesson)
public class Lesson: UserData {
    convenience init(durationInSeconds: Double, lessonLevel: Int64, lessonName: String, insertInto context: NSManagedObjectContext) {
        if let entity = NSEntityDescription.entity(forEntityName: "Lesson", in: context) {
            self.init(entity: entity, insertInto: context)
            
            self.durationInSeconds = durationInSeconds
            self.lessonLevel = lessonLevel
            self.lessonName = lessonName
            
            
        } else {
            fatalError("Unable to create meditation")
        }
    }
}
