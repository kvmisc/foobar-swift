//
//  ThemeWorker.swift
//  Foobar
//
//  Created by Kevin Wu on 1/16/20.
//  Copyright (c) firefly.com. All rights reserved.
//

import UIKit
import SwiftTheme

class ThemeWorker {

  static let shared = ThemeWorker()

  static func setup() {

    ThemeWorker.shared.themeNames = ["day", "night"]

    ThemeWorker.shared.reloadColors([
      Path.findPath("theme_day.plist")!,
      Path.findPath("theme_night.plist")!
    ])

    ThemeWorker.shared.currentIndex = 0
  }


  var currentIndex = -1



  // MARK: Theme names
  var themeNames: [String] = []

  func getImageNames(_ name: String) -> [String] {
    return themeNames.map { name + "_" + $0 }
  }
  func getImageName(_ name: String) -> String {
    return name + "_" + themeNames[currentIndex]
  }

  func getImagePicker(_ name: String) -> ThemeImagePicker {
    return ThemeImagePicker.pickerWithNames(getImageNames(name))
  }



  // MARK: Theme colors
  var themeColors: [[String:[String:String]]] = []

  func reloadColors(_ paths: [String]) {
    themeColors = []
    for path in paths {
      let body: [String:[String:String]]? = Archive.fromPlistFile(path)
      if let body = body {
        themeColors.append(body)
      }
    }
  }

  func getColorValues(_ key: String) -> [String] {
    var ret: [String] = []
    for color in themeColors {
      let value = (color as NSDictionary).value(forKeyPath: key) as? String ?? ""
      if value.isEmpty { print("WARNING: Can't find \(key) in theme") }
      ret.append(value)
    }
    return ret
  }
  func getColorValue(_ key: String) -> String {
    let color = themeColors[currentIndex] as NSDictionary
    let value = color.value(forKeyPath: key) as? String ?? ""
    if value.isEmpty { print("WARNING: Can't find \(key) in theme") }
    return value
  }

  func getColorPicker(_ name: String) -> ThemeColorPicker {
    return ThemeColorPicker.pickerWithColors(getColorValues(name))
  }
  func getCGColorPicker(_ name: String) -> ThemeCGColorPicker {
    return ThemeCGColorPicker.pickerWithColors(getColorValues(name))
  }

}
