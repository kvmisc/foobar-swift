//
//  Settings.swift
//  Foobar
//
//  Created by Kevin Wu on 1/17/20.
//  Copyright (c) firefly.com. All rights reserved.
//

import UIKit

class Settings {

  static let shared = Settings()


  private var entries: [String:Any] = [:]
  func reload() {
    entries = Archive.fromJSONFile(Path.document("config.json")) as? [String:Any] ?? [:]
  }
  func synchronize() {
    Archive.toJSONFile(entries, Path.document("config.json"), .prettyPrinted)
  }


  func has(_ key: String) -> Bool {
    return entries[key] != nil
  }

  // string
  // number: double/int
  // bool
  // object
  // array
  func string(_ key: String) -> String? {
    return entries[key] as? String
  }
  func double(_ key: String) -> Double? {
    return entries[key] as? Double
  }
  func int(_ key: String) -> Int? {
    return entries[key] as? Int
  }
  func bool(_ key: String) -> Bool? {
    return entries[key] as? Bool
  }
  func object(_ key: String) -> [String:Any]? {
    return entries[key] as? [String:Any]
  }
  func array(_ key: String) -> [Any]? {
    return entries[key] as? [Any]
  }

  func set(_ key: String, _ value: Any) {
    if key.isEmpty { return }
    entries[key] = value
  }
  func remove(_ key: String) {
    entries[key] = nil
  }


  #if DEBUG
  static func TestSettings() {
    Settings.shared.set("a", "asdf")
    Settings.shared.set("b", 1.3)
    Settings.shared.set("c", 102)
    Settings.shared.set("d", true)
    Settings.shared.set("e", ["aa",12,true])
    Settings.shared.set("f", ["a":"sdf","b":18,"c":false])
    let v1 = "abc"
    Settings.shared.set("g", v1)
    let v2: [Any] = ["aa",12,true]
    Settings.shared.set("h", v2)
    let v3: [String:Any] = ["a":"sdf","b":18,"c":false]
    Settings.shared.set("i", v3)
    Settings.shared.synchronize()

//    print(Settings.shared.string("a"))
//    print(Settings.shared.double("b"))
//    print(Settings.shared.int("c"))
//    print(Settings.shared.bool("d"))
//    print(Settings.shared.array("e"))
//    print(Settings.shared.object("f"))
//    print(Settings.shared.string("g"))
//    print(Settings.shared.array("h"))
//    print(Settings.shared.object("i"))

//    Settings.shared.remove("f")
//    Settings.shared.synchronize()
//    print(Settings.shared.object("f"))
  }
  #endif
}
