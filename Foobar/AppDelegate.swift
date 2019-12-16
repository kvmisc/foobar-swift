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

  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

    print(Path.document())

    let expiration = Expiration(Path.document("find.json"))

//    expiration.setKey("aa", 0.1)
//    expiration.setKey("bb", 1)
//    expiration.setKey("cc", 5)
//    expiration.setKey("dd", 10)
//    expiration.setKey("ee", 20)
//    expiration.setKey("ff", 500)
//    expiration.setKey("gg", 10000)
    print(expiration.hasKey("aa"))
    print(expiration.hasKey("bb"))
    print(expiration.hasKey("cc"))
    print(expiration.hasKey("dd"))
    print(expiration.hasKey("ee"))
    print(expiration.hasKey("ff"))
    print(expiration.hasKey("gg"))


    let window = UIWindow()
//    let nc = UINavigationController(rootViewController: TestHierachyRedVC())
//    nc.isNavigationBarHidden = true
//    window.rootViewController = nc
    window.rootViewController = TestSerizationVC()
    window.makeKeyAndVisible()
    self.window = window
    return true
  }

}

