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

//struct Stt {
//  var aa = 0
//  var bb = 0
//  var cc: Int {
//    get { return aa }
//    set { aa = newValue }
//  }
//  mutating func dd(value: Int) {
//    aa = value
//  }
//}

//struct Stb {
//  var aa = 0
//  var bb = 0
//  var cc = Stt(name: 1, height: 1)
//  mutating func down(v: Int) {
//    self.cc.height = v
//  }
//  var xx: Int {
//    get { return cc.name }
//    set {
//      cc.name = newValue
//    }
//  }
//}

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?

  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

    let window = UIWindow()
    window.rootViewController = FBRootVC()
    window.makeKeyAndVisible()

    self.window = window

    let rt = CGRect(


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

    Path.create("adf")
    
    print("afs")
    Async.main(after: 3.0) {
      print(Formatter.datetime_01.string(from: now))
    }

    print(SCREEN_TAL)

//    var rect = CGRect(x: 10, y: 20, width: 30, height: 40)
//    print(rect)
//    rect.x = 100
//    print(rect)


//    var size = CGSize(10, 20)
//    print(size.with(height: 30).with(width: 50))
//    print(size)

    var rect = CGRect(1,2,3,4)
    print(rect.minY)
    print(rect.midY)
    print(rect.maxY)




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

