//
//  AppDelegate.swift
//  tuto
//
//  Created by Thomas Salandre on 10/05/2020.
//  Copyright © 2020 Thomas Salandre. All rights reserved.
//

import UIKit
import Parse

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
     let parseConfig = ParseClientConfiguration {
            $0.applicationId = "1O0F5unlf1NnHYdhBomNKG6SVdErQ3HhhDN5WAV8"
           $0.clientKey = "0WqM0YPcfMge6e3XL54ZztfhPQN8HrWfVDJYK53E"
            $0.server = "https://pg-app-ostmr9jbo68yg3t2slbrcj8l1hiedz.scalabl.cloud/1/"
        }
        Parse.initialize(with: parseConfig)
        
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

