//
//  AppDelegate.swift
//  Foobar
//
//  Created by Kevin Wu on 11/27/19.
//  Copyright (c) firefly.com. All rights reserved.
//

import UIKit
import Localize_Swift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?

//  func doit() {
//    let ary: [Int] = [1]
//    guard !ary.isEmpty else { return }
//    print(ary)
//  }

  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

    let window = UIWindow()
    let nc = UINavigationController(rootViewController: TestHierachyRedVC())
    nc.isNavigationBarHidden = true
    window.rootViewController = nc
    //window.rootViewController = TestHierachyRedVC()
    window.makeKeyAndVisible()
    self.window = window

//    Localize.setCurrentLanguage("zh-Hant")

    print("loading_login".localized())

    print(Localize.availableLanguages())
    print(Localize.currentLanguage())
    print(Localize.defaultLanguage())
    print(Localize.displayNameForLanguage(Localize.currentLanguage()))

    return true
  }

}

