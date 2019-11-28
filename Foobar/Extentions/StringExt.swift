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

  func extAppendingPathComponent(_ path: String) -> String {
    if path.isEmpty {
      return self
    }

    if self.hasSuffix("/") {
      if path.hasPrefix("/") {
        return self + path.extSubstring(trimLeading: 1)
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

// Substring
extension String {

  // 前 xxx 个字符
  func extSubstring(leading: Int) -> String {
    if leading > 0 {
      return String(self.prefix(leading))
    } else {
      return ""
    }
  }
  // 后 xxx 个字符
  func extSubstring(trailing: Int) -> String {
    if trailing > 0 {
      return String(self.suffix(trailing))
    } else {
      return ""
    }
  }

  // 去掉前 xxx 个字符, 后 xxx 个字符
  func extSubstring(trimLeading: Int = 0, trimTrailing: Int = 0) -> String {
    let fromIndex = extLeadingIndex(trimLeading, self.endIndex)
    let toIndex = extTrailingIndex(trimTrailing, fromIndex)
    return String(self[fromIndex..<toIndex])
  }

  // 从 xxx 到 xxx, 返回区间内的
  func extSubstring(from: Int, to: Int) -> String {
    if from < to {
      if to <= 0 {
        // from -1, to 0
      } else {
        let begin = max(from, 0)
        return extSubstring(from: begin, length: to-begin)
      }
    }
    return ""
  }
  // 从 xxx 开始, 长度 xxx, 仅当长度不足时, 返回长度才会变小, 当起点为负, 从 0 开始数长度
  func extSubstring(from: Int, length: Int) -> String {
    if length > 0 {
      let begin = max(from, 0)
      let fromIndex = extLeadingIndex(begin, self.endIndex)
      let toIndex = extLeadingIndex(begin+length, self.endIndex)

      return String(self[fromIndex..<toIndex])
    }
    return ""
  }


  func extLeadingIndex(_ offset: Int, _ limit: String.Index) -> String.Index {
    if offset <= 0 {
      return self.startIndex
    } else {
      if let index = self.index(self.startIndex, offsetBy: offset, limitedBy: limit) {
        return index
      } else {
        return limit
      }
    }
  }
  func extTrailingIndex(_ offset: Int, _ limit: String.Index) -> String.Index {
    if offset <= 0 {
      return self.endIndex
    } else {
      if let index = self.index(self.endIndex, offsetBy: -offset, limitedBy: limit) {
        return index
      } else {
        return limit
      }
    }
  }

}
