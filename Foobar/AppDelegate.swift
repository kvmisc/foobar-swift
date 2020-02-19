//
//  AppDelegate.swift
//  Foobar
//
//  Created by Kevin Wu on 11/27/19.
//  Copyright (c) firefly.com. All rights reserved.
//

import UIKit

struct TwelveOrLess {
  var number = 0
  var name = ""
}
extension TwelveOrLess {
  init(_ v: String) {
//self.init()
    number = 0
    name = v

  }
}


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?

  var expiration: Expiration! = nil

  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

    print(Path.document())

    URLNavigation.setup()

    let a = TwelveOrLess()
//    let b = TwelveOrLess(number: 0, name: "")

    doit()


    let window = UIWindow()
//    let nc = UINavigationController(rootViewController: TestNavVC())
//    nc.isNavigationBarHidden = true
//    window.rootViewController = nc
    window.rootViewController = TestLayerVC()
    window.makeKeyAndVisible()
    self.window = window
    return true
  }

  func doit() {
    defer {
      print("i leave")
    }
    print("before")
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

