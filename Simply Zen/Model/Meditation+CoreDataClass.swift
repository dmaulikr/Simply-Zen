//
//  Meditation+CoreDataClass.swift
//  Simply Zen
//
//  Created by Daniel Pratt on 5/23/17.
//  Copyright © 2017 Daniel Pratt. All rights reserved.
//

import Foundation
import CoreData

@objc(Meditation)
public class Meditation: UserData {
    convenience init(date: NSDate, durationInSeconds: Double, lesson: Lesson, user: UserData, insertInto context: NSManagedObjectContext) {
        if let entity = NSEntityDescription.entity(forEntityName: "Meditation", in: context) {
            self.init(entity: entity, insertInto: context)
            self.date = date
            self.durationSeconds = durationInSeconds
            self.lesson = lesson
            self.user = user
            
        } else {
            fatalError("Unable to create meditation")
        }
    }
}
