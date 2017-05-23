//
//  Meditation+CoreDataProperties.swift
//  Simply Zen
//
//  Created by Daniel Pratt on 5/23/17.
//  Copyright © 2017 Daniel Pratt. All rights reserved.
//

import Foundation
import CoreData


extension Meditation {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Meditation> {
        return NSFetchRequest<Meditation>(entityName: "Meditation")
    }

    @NSManaged public var date: NSDate?
    @NSManaged public var durationSeconds: Double
    @NSManaged public var lesson: Lesson?
    @NSManaged public var user: UserData?

}
