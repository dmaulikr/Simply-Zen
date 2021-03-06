//
//  HealthKitExtension.swift
//  Simply Zen
//
//  Created by Daniel Pratt on 5/23/17.
//  Copyright © 2017 Daniel Pratt. All rights reserved.
//

import Foundation
import UIKit
import HealthKit

struct HealthKitExtension {

    // MARK: - Class Properties
    static let healthStore = HKHealthStore()
    
    // MARK: Class functions
    
    // check to see if healthkit is available
    // as release is targeted for iOS 10, this should never fail
    static func checkAvailability() -> Bool {
        return HKHealthStore.isHealthDataAvailable()
    }
    
    // Request Permissions
    
    static func requestAuthorization() -> Bool {
        var successful: Bool = true
        let hkTypesToWrite = Set([HKSampleType.categoryType(forIdentifier: .mindfulSession)!])
        healthStore.requestAuthorization(toShare: hkTypesToWrite, read: nil, completion: { (success, error) in
            if success {
                successful = true
            } else {
                successful = false
            }
        })
        return successful
    }
    
    static func checkAuthorizationStatus() -> Bool {
        return healthStore.authorizationStatus(for: HKObjectType.categoryType(forIdentifier: .mindfulSession)!) == .sharingAuthorized
    }
    
    static func saveMeditation(startDate: Date, seconds: Double) {
        if checkAuthorizationStatus() {
            let mindfulType = HKCategoryType.categoryType(forIdentifier: .mindfulSession)
            let mindfulSample = HKCategorySample(type: mindfulType!, value: 0, start: startDate, end: Date(timeInterval: TimeInterval(seconds), since: startDate))
            HealthKitExtension.healthStore.save(mindfulSample) { success, error in
                if(error != nil) {
                    abort()
                }
            }
        }
    }
}
