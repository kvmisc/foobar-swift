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

//    Settings.shared.reload()
//    ThemeWorker.setup()

    HTTPManager.shared.operations[201] = {
      print("show login page")
    }

    HTTPManager.shared.request("http://www.mocky.io/v2/5e23c674340000d501012b5f")
    { (response, result, error, context) in
      if let error = error {
        if let code = error.0.code {
          // 201 has been dealed globally, do nothing here
          // just pick up any other error you want to deal with
          if code == 202 {
            print("deal with 202")
          } else if code == 203 {
            print("deal with 203")
          }
        } else {
          print("show error: \(error.1)")
        }
      } else {
        print(result)
      }
    }


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

