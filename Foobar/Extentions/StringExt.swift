//
//  StringExt.swift
//  Foobar
//
//  Created by Kevin Wu on 11/27/19.
//  Copyright (c) firefly.com. All rights reserved.
//

import UIKit


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

  // 最终字符串长度 = count - from
  func extSubstring(from: Int) -> String {
    if self.count>from {
      let fromIndex = self.index(self.startIndex, offsetBy: from)
      return String(self[fromIndex..<self.endIndex])
    }
    return ""
  }
  // 最终字符串长度 = to
  func extSubstring(to: Int) -> String {
    if self.count>to {
      let toIndex = self.index(self.startIndex, offsetBy: to)
      return String(self[self.startIndex..<toIndex])
    }
    return ""
  }

  func extAppendingPathComponent(_ path: String) -> String {
    if path.isEmpty {
      return self
    }

    if self.hasSuffix("/") {
      if path.hasPrefix("/") {
        return self + path.extSubstring(from: 1)
      } else {
        return self + path
      }
    } else {
      if path.hasPrefix("/") {
        return self + path
      } else {
        return self + "/" + path
      }
    }
  }

}
