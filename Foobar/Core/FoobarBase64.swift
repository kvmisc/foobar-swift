//
//  FoobarBase64.swift
//  Foobar
//
//  Created by Kevin Wu on 11/28/19.
//  Copyright (c) firefly.com. All rights reserved.
//

import UIKit

extension Foobar {

  class Base64 {
    static func encodeString(_ string: String) -> String {
      return string.extToUTF8Data().base64EncodedString(options: [])
    }


    static func encodeString(_ from: Data) -> String {
      return from.base64EncodedString(options: [])
    }


    static func encodeData(_ from: Data) -> Data {
      return from.base64EncodedData(options: [])
    }
    static func encodeData(_ from: String) -> Data {
      return from.extToUTF8Data().base64EncodedData(options: [])
    }

    static func decodeString(_ from: Data) -> String {
      if let dat = Data(base64Encoded: from, options: []) {
        return dat.extToUTF8String()
      }
      return ""
    }
    static func decodeString(_ from: String) -> String {
      if let dat = Data(base64Encoded: from, options: []) {
        return dat.extToUTF8String()
      }
      return ""
    }

    static func decodeData(_ from: Data) -> Data {
      if let dat = Data(base64Encoded: from, options: []) {
        return dat
      }
      return Data()
    }
    static func decodeData(_ from: String) -> Data {
      if let dat = Data(base64Encoded: from, options: []) {
        return dat
      }
      return Data()
    }
  }

}
