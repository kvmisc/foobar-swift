//
//  Settings.swift
//  Foobar
//
//  Created by Kevin Wu on 1/17/20.
//  Copyright (c) firefly.com. All rights reserved.
//

import UIKit
import AnyCodable

class Settings {
  static let shared = Settings()

  init() {
    entries = Archive.fromJSONFile(Path.document("config.json")) ?? [:]
  }


  private var entries: [String:AnyCodable] = [:]

  func has(_ key: String) -> Bool {
    return entries[key] != nil
  }

  // string
  // number: double/int
  // bool
  // object
  // array
  func string(_ key: String) -> String? {
    return entries[key]?.value as? String
  }
  func double(_ key: String) -> Double? {
    return entries[key]?.value as? Double
  }
  func int(_ key: String) -> Int? {
    return entries[key]?.value as? Int
  }
  func bool(_ key: String) -> Bool? {
    return entries[key]?.value as? Bool
  }
  func object(_ key: String) -> [String:Codable]? {
    return entries[key]?.value as? [String:Codable]
  }
  func array(_ key: String) -> [Codable]? {
    return entries[key]?.value as? [Codable]
  }

  func set(_ key: String, _ value: AnyCodable) {
    guard !key.isEmpty else { return }
    entries[key] = value
  }
  func remove(_ key: String) {
    entries[key] = nil
  }

  func synchronize() {
    Archive.toJSONFile(entries, Path.document("config.json"))
  }


  #if DEBUG
  static func TestSettings() {
    Settings.shared.set("a", "asdf")
    Settings.shared.set("b", 1.3)
    Settings.shared.set("c", 102)
    Settings.shared.set("d", true)
    Settings.shared.set("e", ["aa",12,true])
    Settings.shared.set("f", ["a":"sdf","b":18,"c":false])
    let str = "abc"
    Settings.shared.set("g", AnyCodable(str))
    Settings.shared.synchronize()

    print(Settings.shared.string("a"))
    print(Settings.shared.double("b"))
    print(Settings.shared.int("c"))
    print(Settings.shared.bool("d"))
    print(Settings.shared.array("e"))
    print(Settings.shared.object("f"))
    print(Settings.shared.object("g"))

//    Settings.shared.remove("f")
//    Settings.shared.synchronize()
//    print(Settings.shared.object("f"))
  }
  #endif
}
