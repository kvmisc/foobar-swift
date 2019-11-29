//
//  StringExt.swift
//  Foobar
//
//  Created by Kevin Wu on 11/27/19.
//  Copyright (c) firefly.com. All rights reserved.
//

import UIKit

// MARK: xxx
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


  static func extRandomString(_ length: Int) -> String {
    if length > 0 {
      let base = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
      var result = ""
      for _ in 1...length {
        result.append(base.randomElement()!)
      }
      return result
    }
    return ""
  }

  // "123" -> true
  // "1.3" -> false
  // "abc" -> false
  var extIsDigits: Bool {
    return CharacterSet.decimalDigits.isSuperset(of: CharacterSet(charactersIn: self))
  }
  // "123" -> true
  // "1.3" -> true (en_US)
  // "1,3" -> true (fr_FR)
  // "abc" -> false
  var extIsNumeric: Bool {
    let scanner = Scanner(string: self)
    scanner.locale = NSLocale.current
    return scanner.scanDecimal(nil) && scanner.isAtEnd
  }

  // http://emailregex.com/
  var extIsValidEmail: Bool {
    let regex = "^(?:[\\p{L}0-9!#$%\\&'*+/=?\\^_`{|}~-]+(?:\\.[\\p{L}0-9!#$%\\&'*+/=?\\^_`{|}~-]+)*|\"(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21\\x23-\\x5b\\x5d-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])*\")@(?:(?:[\\p{L}0-9](?:[a-z0-9-]*[\\p{L}0-9])?\\.)+[\\p{L}0-9](?:[\\p{L}0-9-]*[\\p{L}0-9])?|\\[(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?|[\\p{L}0-9-]*[\\p{L}0-9]:(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21-\\x5a\\x53-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])+)\\])$"
    return self.range(of: regex, options: .regularExpression, range: nil, locale: nil) != nil
  }

  // 12 -> 12
  // 2a -> nil
  var extInt: Int? {
    return Int(self)
  }
  // 120 -> 120.0
  // 1.2 -> 1.2
  // 12a -> nil
  var extDouble: Double? {
    let formatter = NumberFormatter()
    formatter.locale = NSLocale.current
    return formatter.number(from: self)?.doubleValue
  }

  func extLocalized(comment: String = "") -> String {
    return NSLocalizedString(self, comment: comment)
  }
}

// MARK: Common
extension String {
  func extReversedString() -> String {
    return String(self.reversed())
  }
  func extShuffledString() -> String {
    return String(self.shuffled())
  }
  func extTrimmedString() -> String {
    return self.trimmingCharacters(in: .whitespacesAndNewlines)
  }


  func extContains(_ string: String, caseSensitive: Bool = true) -> Bool {
    if !caseSensitive {
      return self.range(of: string, options: .caseInsensitive) != nil
    }
    return self.range(of: string) != nil
  }
}

// MARK: Path
extension String {
  func extLastPathComponent() -> String {
    return (self as NSString).lastPathComponent
  }
  func extAppendingPathComponent(_ string: String) -> String {
    return (self as NSString).appendingPathComponent(string)
  }
  func extDeletingLastPathComponent() -> String {
    return (self as NSString).deletingLastPathComponent
  }

  func extPathExtension() -> String {
    return (self as NSString).pathExtension
  }
}

// MARK: URL encoding
extension String {
  var extURLEncodedString: String {
    return self.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? self
  }
  var extURLDecodedString: String {
    return self.removingPercentEncoding ?? self
  }
}

// MARK: Substring
extension String {

  // 第 xxx 个字符, 第一个字符序号是 0
  func extSubstring(at: Int) -> String {
    if at >= 0 {
      return extSubstring(from: at, length: 1)
    }
    return ""
  }

  // 前 xxx 个字符
  func extSubstring(leading: Int) -> String {
    if leading > 0 {
      return String(self.prefix(leading))
    }
    return ""
  }
  // 后 xxx 个字符
  func extSubstring(trailing: Int) -> String {
    if trailing > 0 {
      return String(self.suffix(trailing))
    }
    return ""
  }

  // 去掉前 xxx 个字符, 后 xxx 个字符
  func extSubstring(trimLeading: Int = 0, trimTrailing: Int = 0) -> String {
    var result = self
    if trimLeading > 0 {
      result = String(result.dropFirst(trimLeading))
    }
    if trimTrailing > 0 {
      result = String(result.dropLast(trimTrailing))
    }
    return result
//    let fromIndex = extLeadingIndex(trimLeading, self.endIndex)
//    let toIndex = extTrailingIndex(trimTrailing, fromIndex)
//    return String(self[fromIndex..<toIndex])
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
