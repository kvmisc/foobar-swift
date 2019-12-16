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

