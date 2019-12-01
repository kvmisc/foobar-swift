//
//  AppDelegate.swift
//  Foobar
//
//  Created by Kevin Wu on 11/27/19.
//  Copyright (c) firefly.com. All rights reserved.
//

import UIKit
import AppVersionMonitor



@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?

  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

    let window = UIWindow()
    window.rootViewController = FBRootVC()
    window.makeKeyAndVisible()

    self.window = window

    AppVersionMonitor.sharedMonitor.startup()

    let ver1 = AppVersion("1.10.1")
    let ver2 = AppVersion("1.0.2")
    print(ver1 < ver2)
    print(AppVersionMonitor.sharedMonitor.state)

//    VersionTracker.shared.track()
//    print(VersionTracker.shared.isFirstLaunchEver)
//    print(VersionTracker.shared.isFirstVersionLaunch)
//    print(VersionTracker.shared.versionHistory)

//    let version1 = Version("1.10.2")
//    print(version1)
//
//    let version2 = Version("1.1.3")
//    print(version2)
//
//    print(version1 < version2)

    return true
  }

}

