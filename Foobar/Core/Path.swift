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

  static func findPath(_ name: String, _ bundle: Bundle = .main) -> String? {
    return bundle.path(forResource: name, ofType: nil)
  }
  static func findURL(_ name: String, _ bundle: Bundle = .main) -> URL? {
    return bundle.url(forResource: name, withExtension: nil)
  }

  static func bundle(_ relativePath: String = "", _ bundle: Bundle = .main) -> String {
    return bundle.resourcePath?.extAppendingPathComponent(relativePath) ?? ""
  }
  static func document(_ relativePath: String = "") -> String {
    let paths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
    guard !paths.isEmpty else { return "" }
    return paths[0].extAppendingPathComponent(relativePath)
  }
  static func user(_ uid: String, _ relativePath: String = "") -> String {
    var path = document()
    path = path.extAppendingPathComponent("Users")
    path = path.extAppendingPathComponent(uid)
    path = path.extAppendingPathComponent(relativePath)
    return path
  }
}

extension String {
  func extLastPathComponent() -> String {
    return (self as NSString).lastPathComponent
  }
  func extAppendingPathComponent(_ string: String) -> String {
    return (self as NSString).appendingPathComponent(string)
  }
  func extDeletingLastPathComponent() -> String {
    return (self as NSString).deletingLastPathComponent
  }

  func extPathExtension() -> String {
    return (self as NSString).pathExtension
  }
}
