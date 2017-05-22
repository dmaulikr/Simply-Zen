//
//  Lesson+CoreDataProperties.swift
//  Simply Zen
//
//  Created by Daniel Pratt on 5/22/17.
//  Copyright © 2017 Daniel Pratt. All rights reserved.
//

import Foundation
import CoreData


extension Lesson {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Lesson> {
        return NSFetchRequest<Lesson>(entityName: "Lesson")
    }

    @NSManaged public var durationInSeconds: Double
    @NSManaged public var lessonLevel: Int64
    @NSManaged public var nameAndFileName: String?
    @NSManaged public var course: Course?
    @NSManaged public var meditation: NSSet?

}

// MARK: Generated accessors for meditation
extension Lesson {

    @objc(addMeditationObject:)
    @NSManaged public func addToMeditation(_ value: Meditation)

    @objc(removeMeditationObject:)
    @NSManaged public func removeFromMeditation(_ value: Meditation)

    @objc(addMeditation:)
    @NSManaged public func addToMeditation(_ values: NSSet)

    @objc(removeMeditation:)
    @NSManaged public func removeFromMeditation(_ values: NSSet)

}
