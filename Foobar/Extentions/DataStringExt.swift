//
//  DataExt.swift
//  Foobar
//
//  Created by Kevin Wu on 11/27/19.
//  Copyright (c) firefly.com. All rights reserved.
//

import UIKit

extension Data {
  func extToUTF8String() -> String {
    return String(decoding: self, as: UTF8.self)
  }
  static func extFromUTF8String(_ string: String) -> Data {
    if let dat = string.data(using: .utf8) {
      return dat
    }
    return Data()
  }
}

extension String {
  func extToUTF8Data() -> Data {
    if let dat = self.data(using: .utf8) {
      return dat
    }
    return Data()
  }
  static func extFromUTF8Data(_ data: Data) -> String {
    return String(decoding: data, as: UTF8.self)
  }
}
