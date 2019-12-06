//
//  Path.swift
//  Foobar
//
//  Created by Kevin Wu on 12/6/19.
//  Copyright (c) firefly.com. All rights reserved.
//

import UIKit

class Path {
  @discardableResult
  static func create(_ path: String) -> Bool {
    var isDirectory = ObjCBool(false)
    if FileManager.default.fileExists(atPath: path, isDirectory: &isDirectory) {
      return isDirectory.boolValue
    }
    do {
      try FileManager.default.createDirectory(atPath: path,
                                              withIntermediateDirectories: true,
                                              attributes: nil)
      return true
    } catch {
      return false
    }
  }
  @discardableResult
  static func delete(_ path: String) -> Bool {
    do {
      try FileManager.default.removeItem(atPath: path)
      return true
    } catch {
      return false
    }
  }

  static func bundle(_ relativePath: String = "", bundle: Bundle = .main) -> String {
    if let bundlePath = bundle.resourcePath {
      return (bundlePath as NSString).appendingPathComponent(relativePath)
    }
    return ""
  }
  static func document(_ relativePath: String = "") -> String {
    let paths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
    if !(paths.isEmpty) {
      return (paths[0] as NSString).appendingPathComponent(relativePath)
    }
    return ""
  }
  static func user(uid: String, relativePath: String = "") -> String {
    var path = self.document()
    path = (path as NSString).appendingPathComponent("Users")
    path = (path as NSString).appendingPathComponent(uid)
    path = (path as NSString).appendingPathComponent(relativePath)
    return path
  }
}
