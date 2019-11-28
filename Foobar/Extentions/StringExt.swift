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

  // 去掉前 xxx 个字符
  func extSubstring(trimLeading: Int) -> String {
    return self.extSubstring(trimLeading: trimLeading, trimTrailing: 0)
  }
  // 去掉后 xxx 个字符
  func extSubstring(trimTrailing: Int) -> String {
    return self.extSubstring(trimLeading: 0, trimTrailing: trimTrailing)
  }
  // 去掉前 xxx 个字符, 后 xxx 个字符
  func extSubstring(trimLeading: Int, trimTrailing: Int) -> String {
    let fromIndex = self.extLeadingIndex(trimLeading, self.endIndex)
    let toIndex = self.extTrailingIndex(trimTrailing, fromIndex)
    return String(self[fromIndex..<toIndex])
  }

  // 从 xxx 到 xxx, 返回区间内的
  func extSubstring(from: Int, to: Int) -> String {
    if from < to {
      if to <= 0 {
        // from -1, to 0
      } else {
        let begin = max(from, 0)
        return self.extSubstring(from: begin, length: to-begin)
      }
    }
    return ""
  }
  // 从 xxx, 长度 xxx, 仅当长度不足时, 返回长度才会变小, 当起点为负, 从 0 开始数长度
  func extSubstring(from: Int, length: Int) -> String {
    if length > 0 {
      let begin = max(from, 0)
      let fromIndex = self.extLeadingIndex(begin, self.endIndex)
      let toIndex = self.extLeadingIndex(begin+length, self.endIndex)

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
