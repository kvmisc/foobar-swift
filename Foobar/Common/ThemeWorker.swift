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

    ThemeWorker.shared.loadLastTheme()
  }


  var currentIndex = -1
  var defaultTheme = "night"

  @discardableResult
  func changeTheme(_ index: Int) -> Bool {
    if index < themeNames.count {
      currentIndex = index
      ThemeManager.setTheme(index: currentIndex)
      print("[Theme] change theme success: \(currentIndex)")
      saveLastTheme()
      return true
    }
    print("[Theme] change theme failed: \(index)")
    return false
  }
  func loadLastTheme() {
    var lastIndex = 0
    print("[Theme] LastThemekey:\(UserDefaults.standard.string(forKey: "LastThemeKey") ?? "")")
    if let theme = UserDefaults.standard.string(forKey: "LastThemeKey") {
      if let index = themeNames.firstIndex(of: theme) {
        lastIndex = index
        print("[Theme] found last theme: \(lastIndex):\(theme)")
      }
    }
    currentIndex = lastIndex
    print("[Theme] load theme: \(lastIndex)")
    ThemeManager.setTheme(index: currentIndex)
  }
  func saveLastTheme() {
    let theme = themeNames[currentIndex]
    print("[Theme] LastThemekey:\(UserDefaults.standard.string(forKey: "LastThemeKey") ?? "")")
    print("[Theme] save theme: \(currentIndex):\(theme)")
    UserDefaults.standard.set(theme, forKey: "LastThemeKey")
    let result = UserDefaults.standard.synchronize()
    print("[Theme] LastThemekey:\(UserDefaults.standard.string(forKey: "LastThemeKey") ?? "") \(result)")
  }



  // MARK: Theme names
  var themeNames: [String] = []

  func getImageNames(_ name: String) -> [String] {
    return themeNames.map { name + "_" + $0 }
  }
  func getImageName(_ name: String) -> String {
    return name + "_" + themeNames[currentIndex]
  }

  func getImagePicker(image: String) -> ThemeImagePicker {
    return ThemeImagePicker.pickerWithNames(getImageNames(image))
  }
  func getImagePicker(color: String) -> ThemeImagePicker {
    let images = getColorValues(color).map { UIImage.extColored(ccc($0), ccs(6.0)) }
    return ThemeImagePicker.pickerWithImages(images)
  }



  // MARK: Theme colors
  var themeColors: [String:[String]] = [:]

  func reloadColors(_ paths: [String]) {
    themeColors = [:]

    let list: [[String:[String:String]]] = paths.map { Archive.fromPlistFile($0)! }

    for (key1,value1) in list.first! {
      for (key2,_) in value1 {
        let key = "\(key1).\(key2)"
        themeColors[key] = list.map { ($0 as NSDictionary).value(forKeyPath: key) as? String ?? "" }
      }
    }
  }

  func getColorValues(_ key: String) -> [String] {
    if let value = themeColors[key] {
      return value
    }
    print("WARNING: Can't find \(key) in theme")
    return Array(repeating: "", count: themeNames.count)
  }
  func getColorValue(_ key: String) -> String {
    if let value = themeColors[key] {
      return value[currentIndex]
    }
    print("WARNING: Can't find \(key) in theme")
    return ""
  }

  func getColorPicker(color: String) -> ThemeColorPicker {
    return ThemeColorPicker.pickerWithColors(getColorValues(color))
  }
  func getColorPicker(cgcolor: String) -> ThemeCGColorPicker {
    return ThemeCGColorPicker.pickerWithColors(getColorValues(cgcolor))
  }

}
