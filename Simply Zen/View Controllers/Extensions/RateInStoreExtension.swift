//
//  RateInStoreExtension.swift
//  Simply Zen
//
//  Created by Daniel Pratt on 7/17/17.
//  Copyright © 2017 Daniel Pratt. All rights reserved.
//

import Foundation
import StoreKit

extension SessionCompleteViewController {
    
    // Load user default with how many times user has opened the app
    
    func updateTimesUserHasOpenedApp() {
        timesUserHasOpenedApp = UserDefaults.standard.integer(forKey: "timesUserHasOpenedApp_")
        doNotBugToRate = UserDefaults.standard.bool(forKey: "doNotBugToRate_")
        if timesUserHasOpenedApp == nil || doNotBugToRate == nil {
            timesUserHasOpenedApp = 1
            doNotBugToRate = false
            setNotToBugUser()
        } else if !doNotBugToRate! {
            timesUserHasOpenedApp = timesUserHasOpenedApp! + 1
            setTimesUserHasOpenedApp()
        }
    }
    
    func setTimesUserHasOpenedApp() {
        UserDefaults.standard.set(timesUserHasOpenedApp, forKey: "timesUserHasOpenedApp_")
    }
    
    func setNotToBugUser() {
        UserDefaults.standard.set(doNotBugToRate, forKey: "doNotBugToRate_")
    }
    
    func goToAppInAppStore() {
        let appId = "1235806103"
        
        let storeViewController = SKStoreProductViewController()
        storeViewController.delegate = self
        
        let parameters = [ SKStoreProductParameterITunesItemIdentifier : appId]
        storeViewController.loadProduct(withParameters: parameters) { [weak self] (loaded, error) -> Void in
            if loaded {
                // Parent class of self is UIViewController
                self?.present(storeViewController, animated: true, completion: nil)
            }
        }
    }
    
    func productViewControllerDidFinish(_ viewController: SKStoreProductViewController) {
        viewController.dismiss(animated: true, completion: {
            self.doNotBugToRate = true
            self.setNotToBugUser()
        })
    }
    
}
