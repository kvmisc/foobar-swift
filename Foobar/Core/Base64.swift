//
//  Base64.swift
//  Foobar
//
//  Created by Kevin Wu on 12/6/19.
//  Copyright (c) firefly.com. All rights reserved.
//

import UIKit

class Base64 {

  static func encodedString(_ from: Data) -> String {
    return from.base64EncodedString(options: [])
  }
  static func encodedString(_ from: String) -> String {
    return from.extUTF8Data().base64EncodedString(options: [])
  }

  static func encodedData(_ from: Data) -> Data {
    return from.base64EncodedData(options: [])
  }
  static func encodedData(_ from: String) -> Data {
    return from.extUTF8Data().base64EncodedData(options: [])
  }

  static func decodedString(_ from: Data) -> String {
    if let dat = Data(base64Encoded: from, options: []) {
      return dat.extUTF8String()
    }
    return ""
  }
  static func decodedString(_ from: String) -> String {
    if let dat = Data(base64Encoded: from, options: []) {
      return dat.extUTF8String()
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
