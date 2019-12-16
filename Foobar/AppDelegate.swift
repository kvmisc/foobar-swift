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

    expiration = Expiration(Path.document("asdf.json"))
//    expiration.setKey("aa", 1)
//    expiration.setKey("bb", 5)
//    expiration.setKey("cc", 10)
//    expiration.setKey("dd", 100)

    print(expiration.hasKey("aa"))
    print(expiration.hasKey("bb"))
    print(expiration.hasKey("cc"))
    print(expiration.hasKey("dd"))

    DispatchQueue.main.asyncAfter(deadline: .now() + 8) {
      self.expiration.hasKey("aa")
    }


    print("Account")
//    print(AccountManager.shared.everAccountList())
//    AccountManager.shared.everAccountListAdd("aa")
//    print(AccountManager.shared.everAccountList())
//    AccountManager.shared.everAccountListAdd("zz")
//    print(AccountManager.shared.everAccountList())
//    AccountManager.shared.everAccountListAdd("bb")
//    print(AccountManager.shared.everAccountList())
//    AccountManager.shared.everAccountListAdd("aa")
//    print(AccountManager.shared.everAccountList())

//    print("\(AccountManager.shared.lastAccountUsername()) \(AccountManager.shared.lastAccountPassword())")
//    //AccountManager.shared.lastAccountUpdate("aa", "bb")
//    print("\(AccountManager.shared.lastAccountUsername()) \(AccountManager.shared.lastAccountPassword())")
//    //AccountManager.shared.lastAccountDelete()
//    print("\(AccountManager.shared.lastAccountUsername()) \(AccountManager.shared.lastAccountPassword())")

    let am = AccountManager.shared
    print(am.everAccountList())
    print("\(am.lastAccountUsername()) \(am.lastAccountPassword())")

//    let um = UserModel()
//    um.name = "cc"
//    um.age = 33
//    am.setCurrentAccount("cc", um)
//    am.everAccountListAdd("cc")
//    am.lastAccountUpdate("cc", "zzz")
    am.loadLastAccountFromDisk()
    print("\(am.user?.name) \(am.user?.age)")


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

