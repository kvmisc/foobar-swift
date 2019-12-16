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

    let expire = ExpirePool(Path.document("find.json"))

//    expire.setKey("aa", 0.9)
//    expire.setKey("bb", 1)
//    expire.setKey("cc", 5)
//    expire.setKey("dd", 10)
//    expire.setKey("ee", 20)
//    expire.setKey("ff", 500)
    print(expire.hasKey("aa"))
    print(expire.hasKey("bb"))
    print(expire.hasKey("cc"))
    print(expire.hasKey("dd"))
    print(expire.hasKey("ee"))
    print(expire.hasKey("ff"))


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

