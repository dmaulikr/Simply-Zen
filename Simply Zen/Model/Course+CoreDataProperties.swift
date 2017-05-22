//
//  Course+CoreDataProperties.swift
//  Simply Zen
//
//  Created by Daniel Pratt on 5/22/17.
//  Copyright © 2017 Daniel Pratt. All rights reserved.
//

import Foundation
import CoreData


extension Course {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Course> {
        return NSFetchRequest<Course>(entityName: "Course")
    }

    @NSManaged public var userProgress: Int64
    @NSManaged public var lessons: NSOrderedSet?
    @NSManaged public var user: UserData?

}

// MARK: Generated accessors for lessons
extension Course {

    @objc(insertObject:inLessonsAtIndex:)
    @NSManaged public func insertIntoLessons(_ value: Lesson, at idx: Int)

    @objc(removeObjectFromLessonsAtIndex:)
    @NSManaged public func removeFromLessons(at idx: Int)

    @objc(insertLessons:atIndexes:)
    @NSManaged public func insertIntoLessons(_ values: [Lesson], at indexes: NSIndexSet)

    @objc(removeLessonsAtIndexes:)
    @NSManaged public func removeFromLessons(at indexes: NSIndexSet)

    @objc(replaceObjectInLessonsAtIndex:withObject:)
    @NSManaged public func replaceLessons(at idx: Int, with value: Lesson)

    @objc(replaceLessonsAtIndexes:withLessons:)
    @NSManaged public func replaceLessons(at indexes: NSIndexSet, with values: [Lesson])

    @objc(addLessonsObject:)
    @NSManaged public func addToLessons(_ value: Lesson)

    @objc(removeLessonsObject:)
    @NSManaged public func removeFromLessons(_ value: Lesson)

    @objc(addLessons:)
    @NSManaged public func addToLessons(_ values: NSOrderedSet)

    @objc(removeLessons:)
    @NSManaged public func removeFromLessons(_ values: NSOrderedSet)

}
