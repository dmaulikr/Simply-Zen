//
//  UserData+CoreDataProperties.swift
//  Simply Zen
//
//  Created by Daniel Pratt on 5/15/17.
//  Copyright © 2017 Daniel Pratt. All rights reserved.
//

import Foundation
import CoreData


extension UserData {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<UserData> {
        return NSFetchRequest<UserData>(entityName: "UserData")
    }

    @NSManaged public var userData: NSData?
    @NSManaged public var meditationHistory: NSSet?

}

// MARK: Generated accessors for meditationHistory
extension UserData {

    @objc(addMeditationHistoryObject:)
    @NSManaged public func addToMeditationHistory(_ value: Meditation)

    @objc(removeMeditationHistoryObject:)
    @NSManaged public func removeFromMeditationHistory(_ value: Meditation)

    @objc(addMeditationHistory:)
    @NSManaged public func addToMeditationHistory(_ values: NSSet)

    @objc(removeMeditationHistory:)
    @NSManaged public func removeFromMeditationHistory(_ values: NSSet)

}
