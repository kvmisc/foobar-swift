//
//  AppDelegate.swift
//  Foobar
//
//  Created by Kevin Wu on 11/27/19.
//  Copyright (c) firefly.com. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {



  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    // Override point for customization after application launch.

    var str = "12a"
    //print("\(str.extSubstring(trimLeading: 1, trimTrailing: 1)) \(str)")
    //print("\(str.removeFirst()) \(str)")
    print("\(str.extDouble)")

    return true
  }


}

