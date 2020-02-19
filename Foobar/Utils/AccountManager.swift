//
//  AccountManager.swift
//  Foobar
//
//  Created by Kevin Wu on 12/14/19.
//  Copyright (c) firefly.com. All rights reserved.
//

import UIKit
import KeychainAccess

class AccountManager {
  private (set) var username: String? = nil
  private (set) var user: UserModel? = nil

  static let shared = AccountManager()

  // MARK: Basic methods
  func hasAccountLogined() -> Bool {
    guard let username = username else { return false }
    guard user != nil else { return false }
    return !username.isEmpty
  }

  func createPathForAccount(_ username: String) {
    Path.create(Path.user(username))
  }
  func deletePathForAccount(_ username: String) {
    Path.delete(Path.user(username))
  }

  // 登录成功以后，保存用户对象到用户个人目录
  func setCurrentAccount(_ username: String, _ user: UserModel) {
    if username.isEmpty { return }
    createPathForAccount(username)
    self.username = username
    self.user = user
    Archive.toJSONFile(user, Path.user(username, "user.dat"))
  }
  // 修改用户对象属性后，保存信息到磁盘
  func synchronizeCurrentAccount() {
    guard hasAccountLogined() else { return }
    Archive.toJSONFile(user!, Path.user(username!, "user.dat"))
  }
  // 从磁盘加载上次登录成功的帐号和用户对象到 AccountManager 里
  func loadLastAccountFromDisk() -> Bool {
    guard let username = lastAccountUsername(), !username.isEmpty else { return false }
    guard let user: UserModel = Archive.fromJSONFile(Path.user(username, "user.dat")) else { return false }
    self.username = username
    self.user = user
    return true
  }

  // MARK: Ever account (only username)
  // 曾经登录过的帐号列表，只是帐号，没有密码，第一个为最近登录的帐号（登录成功可以保存，失败也可以保存，看需求决定）
  func everAccountListAdd(_ username: String) {
    if username.isEmpty { return }
    var list = everAccountList()
    if let i = list.firstIndex(of: username) {
      list.remove(at: i)
    }
    list.insert(username, at: 0)
    UserDefaults.standard.set(list, forKey: "EverAccountListKey")
    UserDefaults.standard.synchronize()
  }
  func everAccountListRemove(_ username: String) {
    if username.isEmpty { return }
    var list = everAccountList()
    if let i = list.firstIndex(of: username) {
      list.remove(at: i)
    }
    UserDefaults.standard.set(list, forKey: "EverAccountListKey")
    UserDefaults.standard.synchronize()
  }
  func everAccountList() -> [String] {
    return UserDefaults.standard.array(forKey: "EverAccountListKey") as? [String] ?? []
  }

  // MARK: Last account (username & password)
  func lastAccountUsername() -> String? {
    let keychain = Keychain(service: "com.firefly.account")
    return keychain["username"]
  }
  func lastAccountPassword() -> String? {
    let keychain = Keychain(service: "com.firefly.account")
    return keychain["password"]
  }
  func lastAccountUpdate(_ username: String, _ password: String) {
    if username.isEmpty { return }
    if password.isEmpty { return }
    let keychain = Keychain(service: "com.firefly.account")
    keychain["username"] = username
    keychain["password"] = password
  }
  func lastAccountDelete() {
    let keychain = Keychain(service: "com.firefly.account")
    keychain["username"] = nil
    keychain["password"] = nil
  }

}
