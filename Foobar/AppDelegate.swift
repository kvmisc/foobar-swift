//
//  AppDelegate.swift
//  Foobar
//
//  Created by Kevin Wu on 11/27/19.
//  Copyright (c) firefly.com. All rights reserved.
//

import UIKit
import SwiftTheme

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?

  var expiration: Expiration! = nil

  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

    print(Path.document())

    let ary = Array(repeating: "", count: 0)
    print(ary)

    ThemeWorker.setup()




    ThirdMedia.setup()

    let window = UIWindow()
//    let nc = UINavigationController(rootViewController: TestHierachyRedVC())
//    nc.isNavigationBarHidden = true
//    window.rootViewController = nc
    window.rootViewController = TestThemeVC()
    window.makeKeyAndVisible()
    self.window = window
    return true
  }

  func testValue(_ newValue: String?) {
    guard let newValue = newValue, !newValue.isEmpty else { return }
    print(newValue)
  }


  func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
    if ThirdMedia.parseURL(url) { return true }
    return false
  }

//  func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey: Any] = [:]) -> Bool {
//    if MonkeyKing.handleOpenURL(url) {
//      return true
//    }
//    return false
//  }

}

