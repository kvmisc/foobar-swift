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

  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

    let window = UIWindow()
    window.rootViewController = FBRootVC()
    window.makeKeyAndVisible()

    self.window = window

    let rome = Region(calendar: Calendars.gregorian, zone: Zones.asiaTokyo, locale: Locales.italian)
//    let date1 = DateInRegion("2019-12-05 23:11:02", region: rome)!
//    print(date1.date)
//    print(Date())
//    print(TimeZone.current)

    let now = Date()
//    let df1 = DateFormatter()
//    let tz1 = TimeZone(identifier: "Asia/Bangkok")
//    print(tz1)
//    df1.timeZone = tz1
//    df1.dateFormat = "dd MMM"
//    df1.locale = Locale(identifier: "it")
//    print(df1.string(from: now))

    print("afs")
    Async.main(after: 3.0) {
      print(Foobar.Date.full_01.string(from: now))
    }

    print(SCREEN_TAL)




//    let group = AsyncGroup()
//    group.background {
//      print("aa")
//    }
//    group.utility {
//      print("bb")
//    }
//    group.wait()
//    print("cc")

//    Async.userInitiated {
//      print("aa \(Thread.isMainThread)")
//    }.main {
//      print("bb \(Thread.isMainThread)")
//    }.background {
//      print("cc \(Thread.isMainThread)")
//    }.main {
//      print("dd \(Thread.isMainThread)")
//    }

//    Timer.every(1.seconds) {
//      print("aa")
//    }
//
//    Timer.after(5.seconds) {
//      print("bb")
//    }


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

