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

  func test(_ a: Float, _ b: Double, _ c: CGFloat, _ d: Int) {
  }

  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

    let window = UIWindow()
    window.rootViewController = FBRootVC()
    window.makeKeyAndVisible()

    self.window = window


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

