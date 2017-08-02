//
//  Alerts.swift
//  Blue Tip Calculator
//
//  Created by Daniel Pratt on 2/4/17.
//  Copyright © 2017 blaumagier. All rights reserved.
//

import UIKit

extension SessionCompleteViewController {
    
    // This is where alert messages go
    struct Alerts {
        static let RateUsTitle = "Rate Simply Zen"
        static let RateUsMessage = "Your ratings and reviews are greatly appreciated"
        static let WillRateUs = "Sure, I will help out"
        static let WontRateUs = "No thanks"
        static let RemindMe = "Maybe later"
        static let DismissAlert = "Dismiss"
    }
    
    // This function will show the alert
    func showRateUsAlert(_ title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: Alerts.WillRateUs, style: .default, handler: { (UIAlertAction) -> Void in
            self.goToAppInAppStore()
        }))
        alert.addAction(UIAlertAction(title: Alerts.WontRateUs, style: .default, handler: { (UIAlertAction) -> Void in
            self.doNotBugToRate = true
            self.setNotToBugUser()
        }))
        alert.addAction(UIAlertAction(title: Alerts.RemindMe, style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    // Generic alert placehiold, just in case
    func showAlert(_ title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: Alerts.DismissAlert, style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
}
