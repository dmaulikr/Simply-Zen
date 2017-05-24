//
//  UserData+CoreDataProperties.swift
//  Simply Zen
//
//  Created by Daniel Pratt on 5/23/17.
//  Copyright © 2017 Daniel Pratt. All rights reserved.
//

import Foundation
import CoreData


extension UserData {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<UserData> {
        return NSFetchRequest<UserData>(entityName: "UserData")
    }
    
    @NSManaged public var bellSound: String
    @NSManaged public var courses: NSOrderedSet?
    @NSManaged public var meditationHistory: NSOrderedSet?

}

// MARK: Generated accessors for courses
extension UserData {

    @objc(insertObject:inCoursesAtIndex:)
    @NSManaged public func insertIntoCourses(_ value: Course, at idx: Int)

    @objc(removeObjectFromCoursesAtIndex:)
    @NSManaged public func removeFromCourses(at idx: Int)

    @objc(insertCourses:atIndexes:)
    @NSManaged public func insertIntoCourses(_ values: [Course], at indexes: NSIndexSet)

    @objc(removeCoursesAtIndexes:)
    @NSManaged public func removeFromCourses(at indexes: NSIndexSet)

    @objc(replaceObjectInCoursesAtIndex:withObject:)
    @NSManaged public func replaceCourses(at idx: Int, with value: Course)

    @objc(replaceCoursesAtIndexes:withCourses:)
    @NSManaged public func replaceCourses(at indexes: NSIndexSet, with values: [Course])

    @objc(addCoursesObject:)
    @NSManaged public func addToCourses(_ value: Course)

    @objc(removeCoursesObject:)
    @NSManaged public func removeFromCourses(_ value: Course)

    @objc(addCourses:)
    @NSManaged public func addToCourses(_ values: NSOrderedSet)

    @objc(removeCourses:)
    @NSManaged public func removeFromCourses(_ values: NSOrderedSet)

}

// MARK: Generated accessors for meditationHistory
extension UserData {

    @objc(insertObject:inMeditationHistoryAtIndex:)
    @NSManaged public func insertIntoMeditationHistory(_ value: Meditation, at idx: Int)

    @objc(removeObjectFromMeditationHistoryAtIndex:)
    @NSManaged public func removeFromMeditationHistory(at idx: Int)

    @objc(insertMeditationHistory:atIndexes:)
    @NSManaged public func insertIntoMeditationHistory(_ values: [Meditation], at indexes: NSIndexSet)

    @objc(removeMeditationHistoryAtIndexes:)
    @NSManaged public func removeFromMeditationHistory(at indexes: NSIndexSet)

    @objc(replaceObjectInMeditationHistoryAtIndex:withObject:)
    @NSManaged public func replaceMeditationHistory(at idx: Int, with value: Meditation)

    @objc(replaceMeditationHistoryAtIndexes:withMeditationHistory:)
    @NSManaged public func replaceMeditationHistory(at indexes: NSIndexSet, with values: [Meditation])

    @objc(addMeditationHistoryObject:)
    @NSManaged public func addToMeditationHistory(_ value: Meditation)

    @objc(removeMeditationHistoryObject:)
    @NSManaged public func removeFromMeditationHistory(_ value: Meditation)

    @objc(addMeditationHistory:)
    @NSManaged public func addToMeditationHistory(_ values: NSOrderedSet)

    @objc(removeMeditationHistory:)
    @NSManaged public func removeFromMeditationHistory(_ values: NSOrderedSet)

}
