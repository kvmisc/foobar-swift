//
//  ThemeManager.swift
//  Foobar
//
//  Created by Kevin Wu on 1/16/20.
//  Copyright (c) firefly.com. All rights reserved.
//

import UIKit

class ThemeWorker {
  static let shared = ThemeWorker()


  static func setup() {
    let path1 = Path.findPath("theme_day.plist")!
    //let path2 = Path.findPath("theme_night.plist")!
    let path3 = Path.findPath("theme_blue.plist")!

    ThemeWorker.shared.removeAllThemes()
    ThemeWorker.shared.addThemes([path1, path3])
    ThemeWorker.shared.currentIndex = 0
  }


  typealias ThemeBody = [String:[String:String]]

  var themePaths: [String] = []
  var themeBodys: [ThemeBody] = []

  func addThemes(_ paths: [String]) {
    for path in paths {
      let body: ThemeBody? = Archive.fromPlistFile(path)
      if let body = body {
        themePaths.append(path)
        themeBodys.append(body)
      }
    }
  }
  func removeAllThemes() {
    themePaths = []
    themeBodys = []
  }


  var currentIndex = -1

  func getValues(_ key: String) -> [String] {
    var ret: [String] = []
    for body in themeBodys {
      let value = (body as NSDictionary).value(forKeyPath: key) as? String ?? ""
      if value.isEmpty { print("WARNING: Can't find \(key) in theme") }
      ret.append(value)
    }
    return ret
  }
  func getValue(_ key: String) -> String {
    let body = themeBodys[currentIndex] as NSDictionary
    let value = body.value(forKeyPath: key) as? String ?? ""
    if value.isEmpty { print("WARNING: Can't find \(key) in theme") }
    return value
  }

}
