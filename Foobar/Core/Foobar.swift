//
//  Foobar.swift
//  Foobar
//
//  Created by Kevin Wu on 11/27/19.
//  Copyright (c) firefly.com. All rights reserved.
//

import UIKit

class Foobar {

  class Common {
  }

  class Path {
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


  class Date {
    static let full_01: DateFormatter = {
      let ret = DateFormatter()
      ret.locale = Locale(identifier: "en_US_POSIX")
      ret.timeZone = TimeZone.current
      ret.dateFormat = "yyyy-MM-dd HH:mm:ss"
      return ret
    }()

    static let date_01: DateFormatter = {
      let ret = DateFormatter()
      ret.locale = Locale(identifier: "en_US_POSIX")
      ret.timeZone = TimeZone.current
      ret.dateFormat = "yyyy-MM-dd"
      return ret
    }()
    static let date_02: DateFormatter = {
      let ret = DateFormatter()
      ret.locale = Locale(identifier: "en_US_POSIX")
      ret.timeZone = TimeZone.current
      ret.dateFormat = "yyyy/MM/dd"
      return ret
    }()

    static let time_01: DateFormatter = {
      let ret = DateFormatter()
      ret.locale = Locale(identifier: "en_US_POSIX")
      ret.timeZone = TimeZone.current
      ret.dateFormat = "HH:mm:ss"
      return ret
    }()
  }


  class Base64 {

    static func encodedString(_ from: Data) -> String {
      return from.base64EncodedString(options: [])
    }
    static func encodedString(_ from: String) -> String {
      return from.extToUTF8Data().base64EncodedString(options: [])
    }

    static func encodedData(_ from: Data) -> Data {
      return from.base64EncodedData(options: [])
    }
    static func encodedData(_ from: String) -> Data {
      return from.extToUTF8Data().base64EncodedData(options: [])
    }

    static func decodedString(_ from: Data) -> String {
      if let dat = Data(base64Encoded: from, options: []) {
        return dat.extToUTF8String()
      }
      return ""
    }
    static func decodedString(_ from: String) -> String {
      if let dat = Data(base64Encoded: from, options: []) {
        return dat.extToUTF8String()
      }
      return ""
    }

    static func decodedData(_ from: Data) -> Data {
      if let dat = Data(base64Encoded: from, options: []) {
        return dat
      }
      return Data()
    }
    static func decodedData(_ from: String) -> Data {
      if let dat = Data(base64Encoded: from, options: []) {
        return dat
      }
      return Data()
    }
  }

}
