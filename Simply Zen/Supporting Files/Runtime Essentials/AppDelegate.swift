//
//  AppDelegate.swift
//  Simply Zen
//
//  Created by Daniel Pratt on 5/11/17.
//  Copyright © 2017 Daniel Pratt. All rights reserved.
//

import UIKit
import TwitterKit
import Firebase

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var stack = CoreDataStack(modelName: "SZCoreDataModel")!
    var user: UserData!

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Init TwitterKit
        Twitter.sharedInstance().start(withConsumerKey: "XFM07xtiySlTXwb6FiujgDJW4", consumerSecret: "gVutyIBB4Ji1uRn9cc6eeCHKgBaMMVEEeGkxe6nwKbENLf8cig")
        
        // Startup Firebase
        FirebaseApp.configure()
        
        // set status bar
        UIApplication.shared.statusBarStyle = .lightContent
        return true
    }
    
    func application(_ app: UIApplication, open url: URL, options: [UIApplicationOpenURLOptionsKey : Any] = [:]) -> Bool {
        if Twitter.sharedInstance().application(app, open: url, options: options) {
            return true
        }
        
        // If you handle other (non Twitter Kit) URLs elsewhere in your app, return true. Otherwise
        return false
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
        print("will resign active")
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
        print("Did enter background")
        stack.save()
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

