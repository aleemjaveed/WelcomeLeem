//
//  AppDelegate.swift
//  Fleetv3
//
//  Created by Aleem Javeed on 06/03/2018.
//  Copyright © 2018 Aleem Javeed. All rights reserved.
//

import UIKit
import FBSDKCoreKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        UIApplication.shared.statusBarStyle = .lightContent
        
        UINavigationBar.appearance().barTintColor = UIColor(red: 0.231, green: 0.353, blue: 0.498, alpha: 1.0)
        UINavigationBar.appearance().tintColor = UIColor.white 
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white]

        
        return FBSDKApplicationDelegate.sharedInstance().application(application, didFinishLaunchingWithOptions: launchOptions)
    }
    
    func application(_ app: UIApplication, open url: URL, options: [UIApplicationOpenURLOptionsKey : Any] = [:]) -> Bool {
        return FBSDKApplicationDelegate.sharedInstance().application(
            app,open: url, sourceApplication: options[UIApplicationOpenURLOptionsKey.sourceApplication] as! String, annotation: nil)
    }
    
    

    func applicationWillResignActive(_ application: UIApplication) {
     
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        FBSDKAppEvents.activateApp()
    }

    func applicationWillTerminate(_ application: UIApplication) {
    }


}

