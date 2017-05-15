//
//  Meditation+CoreDataProperties.swift
//  Simply Zen
//
//  Created by Daniel Pratt on 5/15/17.
//  Copyright © 2017 Daniel Pratt. All rights reserved.
//

import Foundation
import CoreData


extension Meditation {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Meditation> {
        return NSFetchRequest<Meditation>(entityName: "Meditation")
    }

    @NSManaged public var lesson: NSData?
    @NSManaged public var quote: NSData?
    @NSManaged public var date: NSDate?
    @NSManaged public var durationSeconds: Double
    @NSManaged public var user: UserData?

}
