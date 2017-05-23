//
//  Course+CoreDataClass.swift
//  Simply Zen
//
//  Created by Daniel Pratt on 5/23/17.
//  Copyright © 2017 Daniel Pratt. All rights reserved.
//

import Foundation
import CoreData

@objc(Course)
public class Course: UserData {
    convenience init(courseName: String, userProgress: Int64 = 0, user: UserData, insertInto context: NSManagedObjectContext) {
        if let entity = NSEntityDescription.entity(forEntityName: "Course", in: context) {
            self.init(entity: entity, insertInto: context)
            
            if userProgress != 0 {
                self.userProgress = userProgress
            }
            
            self.user = user
            
            
        } else {
            fatalError("Unable to create meditation")
        }
    }
}
