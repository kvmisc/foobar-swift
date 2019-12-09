//
//  AppDelegate.swift
//  Foobar
//
//  Created by Kevin Wu on 11/27/19.
//  Copyright (c) firefly.com. All rights reserved.
//

import UIKit
import AppVersionMonitor
import Async
import SQLite
import SwiftDate


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?

  func test(_ a: Int = 1, _ b: Double = 2.0) {
    print("\(a) \(b)")
  }

  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

    let window = UIWindow()
    window.rootViewController = FBRootVC()
    window.makeKeyAndVisible()
    self.window = window

    test(12)

    return true
  }

}

