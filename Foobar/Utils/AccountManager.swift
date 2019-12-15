//
//  AccountManager.swift
//  Foobar
//
//  Created by Kevin Wu on 12/14/19.
//  Copyright (c) firefly.com. All rights reserved.
//

import UIKit

class AccountManager {
  var username: String? = nil
  var user: AnyObject? = nil

  static let shared = AccountManager()

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

  // 登录成功以后，保存用户对象到用户个人目录，应该先创建目录
  func saveAccount(_ username: String, _ user: AnyObject) {
  }
  // 修改用户对象属性后，保存信息到磁盘
  func saveCurrentAccount() {
  }
  // 从磁盘加载上次登录成功的帐号和用户对象到 AccountManager 里面
  func loadLastAccountFromDisk() {
  }

//  - (void)createPathForAccount:(NSString *)username;
//  - (void)deletePathForAccount:(NSString *)username;
//  // 登录成功以后，保存用户对象到用户个人目录，应该先创建目录
//  - (void)saveAccount:(NSString *)username user:(FBUSERMODEL *)user;
//  // 修改用户对象属性后，保存信息到磁盘
//  - (void)saveCurrentAccount;
//  // 从磁盘加载上次登录成功的帐号和用户对象到 AccountManager 里面
//  - (void)loadLastAccountFromDisk;
}
