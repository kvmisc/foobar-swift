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

  var window: UIWindow?

  var expiration: Expiration! = nil

  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

    print(Path.document())

    Settings.shared.reload()
    ThemeWorker.setup()



//    var entries: [String:AnyCodable] = [:]
//    entries["a"] = 1
//    entries["b"] = "ak"
//
//    Archive.toJSONFile(entries, Path.document("abc.json"))


//    let encoder = JSONEncoder()
//    let dat = try? encoder.encode(entries)


//    let decoder = JSONDecoder()
//    decoder.decode(<#T##type: Decodable.Protocol##Decodable.Protocol#>, from: <#T##Data#>)


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

