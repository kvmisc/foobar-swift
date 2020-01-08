//
//  StringExt.swift
//  Foobar
//
//  Created by Kevin Wu on 11/27/19.
//  Copyright (c) firefly.com. All rights reserved.
//

import UIKit

// MARK: Common
extension String {

  static func extRandomString(_ length: Int) -> String {
    guard length > 0 else { return "" }
    let base = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
    var result = ""
    for _ in 1...length {
      result.append(base.randomElement()!)
    }
    return result
  }


  func extReversedString() -> String {
    return String(reversed())
  }
  func extShuffledString() -> String {
    return String(shuffled())
  }
  func extTrimmedString() -> String {
    return trimmingCharacters(in: .whitespacesAndNewlines)
  }


  func extContains(_ string: String, _ caseSensitive: Bool = true) -> Bool {
    if !caseSensitive {
      return range(of: string, options: .caseInsensitive) != nil
    }
    return range(of: string) != nil
  }

  func extMatchs(_ regex: String) -> Bool {
    return range(of: regex, options: .regularExpression) != nil
  }
}

// MARK: URL
extension String {
  func extURL() -> URL? {
    return URL(string: self)
  }
  func extFileURL() -> URL {
    return URL(fileURLWithPath: self)
  }
}

// MARK: Validation
extension String {
  // 纯数字, 不包括小数点
  var extIsNumber: Bool {
    return CharacterSet.decimalDigits.isSuperset(of: CharacterSet(charactersIn: self))
  }
  // "123" -> true
  // "1.3" -> true (en_US)
  // "1,3" -> true (fr_FR)
  // "abc" -> false
  // 数字
  var extIsNumeric: Bool {
    let scanner = Scanner(string: self)
    scanner.locale = NSLocale.current
    return scanner.scanDecimal(nil) && scanner.isAtEnd
  }
  // 纯字母
  var extIsAlpha: Bool {
    return CharacterSet.letters.isSuperset(of: CharacterSet(charactersIn: self))
  }

  // http://emailregex.com/
  var extIsValidEmail: Bool {
    let regex = "^(?:[\\p{L}0-9!#$%\\&'*+/=?\\^_`{|}~-]+(?:\\.[\\p{L}0-9!#$%\\&'*+/=?\\^_`{|}~-]+)*|\"(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21\\x23-\\x5b\\x5d-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])*\")@(?:(?:[\\p{L}0-9](?:[a-z0-9-]*[\\p{L}0-9])?\\.)+[\\p{L}0-9](?:[\\p{L}0-9-]*[\\p{L}0-9])?|\\[(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?|[\\p{L}0-9-]*[\\p{L}0-9]:(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21-\\x5a\\x53-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])+)\\])$"
    return extMatchs(regex)
  }
}

// MARK: URL encoding
extension String {
  var extURLEncodedString: String {
    return addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? self
  }
  var extURLDecodedString: String {
    return removingPercentEncoding ?? self
  }
}

// MARK: Sizing
extension String {
  func extSizeWith(_ font: UIFont) -> CGSize {
    let size = (self as NSString).size(withAttributes: [.font:font])
    return CGSize(width: ceil(size.width), height: ceil(size.height))
  }
  func extSizeWith(_ attributes: [NSAttributedString.Key:Any], _ width: CGFloat) -> CGSize {
    let context = NSStringDrawingContext()
    let rect = (self as NSString).boundingRect(with: CGSize(width: floor(width), height: CGFloat.greatestFiniteMagnitude),
                                               options: .usesLineFragmentOrigin,
                                               attributes: attributes,
                                               context: context)
    return CGSize(width: ceil(rect.size.width), height: ceil(rect.size.height))
  }
}

// MARK: Number
//
// 给变量赋值或给函数传参时, 整型字面量能转成三种浮点型, 浮点字面量不能转成整型
// 整型变量和浮点型变量之间完全不能互转
//
// Int      -> Double(xxx)
//          -> Float(xxx)
//          -> CGFloat(xxx)
//
// Double   -> Int(xxx)
//          -> Float(xxx)
//          -> CGFloat(xxx)
//
// Float    -> Int(xxx)
//          -> Double(xxx)
//          -> CGFloat(xxx)
//
// CGFloat  -> Int(xxx)
//          -> Double(xxx)
//          -> Float(xxx)
//
// All -> String(xxx)
//
extension String {
  // " 123" -> 123
  // " 12a" -> 12
  // "a123" -> 0
  // "0x12" -> 0
  func extInt() -> Int {
    var value: Int = 0
    Scanner(string: self).scanInt(&value)
    return value
  }
  // " 1.2" -> 1.2
  // " .2a" -> 0.2
  // "a123" -> 0.0
  // " 123" -> 123.0
  func extDouble() -> Double {
    var value: Double = 0.0
    Scanner(string: self).scanDouble(&value)
    return value
  }
  #if DEBUG
  static func extTestNumber() {
    print("exInt() ============")
    print("1234".extInt())
    print(" 123".extInt())
    print("a123".extInt())
    print("123a".extInt())
    print("0x12".extInt())
    print("-123".extInt())
    print(" -12".extInt())

    print("Int() ==============")
    print(Int("1234") ?? 0)
    print(Int(" 123") ?? 0)
    print(Int("a123") ?? 0)
    print(Int("123a") ?? 0)
    print(Int("0x12") ?? 0)
    print(Int("-123") ?? 0)
    print(Int(" -12") ?? 0)

    print("exDouble() =========")
    print("1.23".extDouble())
    print(" 1.2".extDouble())
    print(".234".extDouble())
    print("a1.2".extDouble())
    print("1234".extDouble())
    print("123a".extDouble())
    print("-1.2".extDouble())
    print(" -12".extDouble())

    print("Double() ===========")
    print(Double("1.23") ?? 0.0)
    print(Double(" 1.2") ?? 0.0)
    print(Double(".234") ?? 0.0)
    print(Double("a1.2") ?? 0.0)
    print(Double("1234") ?? 0.0)
    print(Double("123a") ?? 0.0)
    print(Double("-1.2") ?? 0.0)
    print(Double(" -12") ?? 0.0)
  }
  #endif
}

// MARK: Substring
extension String {
  // 第 xxx 个字符, 第一个字符序号是 0
  func extSubstring(at: Int) -> String {
    guard at >= 0  else { return "" }
    return extSubstring(from: at, length: 1)
  }

  // 前 xxx 个字符
  func extSubstring(leading: Int) -> String {
    guard leading > 0  else { return "" }
    return String(prefix(leading))
  }
  // 后 xxx 个字符
  func extSubstring(trailing: Int) -> String {
    guard trailing > 0 else { return "" }
    return String(suffix(trailing))
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
  }

  // 从 xxx 到 xxx, 返回区间内的
  func extSubstring(from: Int, to: Int) -> String {
    guard from < to else { return "" }
    if to <= 0 {
      // from -1, to 0
      return ""
    } else {
      let begin = max(from, 0)
      return extSubstring(from: begin, length: to-begin)
    }
  }
  // 从 xxx 开始, 长度 xxx, 仅当长度不足时, 返回长度才会变小, 当起点为负, 从 0 开始数长度
  func extSubstring(from: Int, length: Int) -> String {
    guard length > 0 else { return "" }
    if let fromIndex = index(startIndex, offsetBy: max(from, 0), limitedBy: endIndex) {
      if let toIndex = index(fromIndex, offsetBy: length, limitedBy: endIndex) {
        return String(self[fromIndex..<toIndex])
      } else {
        return String(self[fromIndex..<endIndex])
      }
    } else {
      return ""
    }
  }

  #if DEBUG
  static func extTestSubstring() {
    let str = "abcdef"
    print("leading:")
    print(str.extSubstring(leading: 1))
    print(str.extSubstring(leading: 2))
    print(str.extSubstring(leading: 20))

    print("trailing:")
    print(str.extSubstring(trailing: 1))
    print(str.extSubstring(trailing: 2))
    print(str.extSubstring(trailing: 20))

    print("trim:")
    print(str.extSubstring(trimLeading: 2, trimTrailing: 2))
    print("H\(str.extSubstring(trimLeading: 20, trimTrailing: 2))H")
    print("H\(str.extSubstring(trimLeading: 2, trimTrailing: 20))H")

    print("from length:")
    //print(str.extSubstring(from: 0, length: 2))
    print(str.extSubstring(from: 0, length: 20))
    print(str.extSubstring(from: 1, length: 2))
    print(str.extSubstring(from: 1, length: 20))
    print(str.extSubstring(from: 2, length: 2))
    print(str.extSubstring(from: 2, length: 20))
    print("H\(str.extSubstring(from: 6, length: 20))H")
    print("H\(str.extSubstring(from: 9, length: 20))H")
  }
  #endif
}
