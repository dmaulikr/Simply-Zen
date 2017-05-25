//
//  Course+CoreDataProperties.swift
//  Simply Zen
//
//  Created by Daniel Pratt on 5/23/17.
//  Copyright © 2017 Daniel Pratt. All rights reserved.
//

import Foundation
import CoreData


extension Course {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Course> {
        return NSFetchRequest<Course>(entityName: "Course")
    }

    @NSManaged public var courseName: String?
    @NSManaged public var completed: Bool
    @NSManaged public var userProgress: Int64
    @NSManaged public var user: UserData?

}
