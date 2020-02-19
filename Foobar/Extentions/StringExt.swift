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
    var result = ""
    let base = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
    for _ in 1...length {
      result.append(base.randomElement()!)
    }
    return result
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

// MARK: Validation
extension String {
  // 纯数字, 不包括小数点
  var extIsDigit: Bool {
    return CharacterSet.decimalDigits.isSuperset(of: CharacterSet(charactersIn: self))
  }
  // "123" -> true
  // "1.3" -> true (en_US)
  // "1,3" -> true (fr_FR)
  // "abc" -> false
  // 数字
  var extIsNumber: Bool {
    let scanner = Scanner(string: self)
    scanner.locale = NSLocale.current
    return scanner.scanDecimal(nil) && scanner.isAtEnd
  }
  // 纯字母
  var extIsAlpha: Bool {
    return CharacterSet.letters.isSuperset(of: CharacterSet(charactersIn: self))
  }

  // http://emailregex.com/
  var extIsEmail: Bool {
    let regex = "^(?:[\\p{L}0-9!#$%\\&'*+/=?\\^_`{|}~-]+(?:\\.[\\p{L}0-9!#$%\\&'*+/=?\\^_`{|}~-]+)*|\"(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21\\x23-\\x5b\\x5d-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])*\")@(?:(?:[\\p{L}0-9](?:[a-z0-9-]*[\\p{L}0-9])?\\.)+[\\p{L}0-9](?:[\\p{L}0-9-]*[\\p{L}0-9])?|\\[(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?|[\\p{L}0-9-]*[\\p{L}0-9]:(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21-\\x5a\\x53-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])+)\\])$"
    return extMatchs(regex)
  }
}

// MARK: Sizing
extension String {
  func extSizeWith(_ font: UIFont) -> CGSize {
    let size = (self as NSString).size(withAttributes: [.font:font])
    return CGSize(width: ceil(size.width), height: ceil(size.height))
  }
  func extSizeWith(_ attributes: [NSAttributedString.Key:Any], _ width: Double) -> CGSize {
    let context = NSStringDrawingContext()
    let rect = (self as NSString).boundingRect(with: CGSize(width: floor(CGFloat(width)), height: CGFloat.greatestFiniteMagnitude),
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
  var extIntValue: Int {
    var value: Int = 0
    Scanner(string: self).scanInt(&value)
    return value
  }
  // " 1.2" -> 1.2
  // " .2a" -> 0.2
  // "a123" -> 0.0
  // " 123" -> 123.0
  var extDoubleValue: Double {
    var value: Double = 0.0
    Scanner(string: self).scanDouble(&value)
    return value
  }
  #if DEBUG
  static func extTestNumber() {
    print("exInt() ============")
    print("1234".extIntValue)
    print(" 123".extIntValue)
    print("a123".extIntValue)
    print("123a".extIntValue)
    print("0x12".extIntValue)
    print("-123".extIntValue)
    print(" -12".extIntValue)

    print("Int() ==============")
    print(Int("1234") ?? 0)
    print(Int(" 123") ?? 0)
    print(Int("a123") ?? 0)
    print(Int("123a") ?? 0)
    print(Int("0x12") ?? 0)
    print(Int("-123") ?? 0)
    print(Int(" -12") ?? 0)

    print("exDouble() =========")
    print("1.23".extDoubleValue)
    print(" 1.2".extDoubleValue)
    print(".234".extDoubleValue)
    print("a1.2".extDoubleValue)
    print("1234".extDoubleValue)
    print("123a".extDoubleValue)
    print("-1.2".extDoubleValue)
    print(" -12".extDoubleValue)

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

// MARK: Substring & replace
extension String {
  // 前 xxx 个字符
  func extPrefix(_ length: Int) -> String {
    guard length > 0  else { return "" }
    return String(prefix(length))
  }
  // 后 xxx 个字符
  func extSuffix(_ length: Int) -> String {
    guard length > 0 else { return "" }
    return String(suffix(length))
  }

  // 去掉前 xxx 个字符, 后 xxx 个字符
  func extTrim(_ leading: Int = 0, _ trailing: Int = 0) -> String {
    var result = self
    if leading > 0 {
      result = String(result.dropFirst(leading))
    }
    if trailing > 0 {
      result = String(result.dropLast(trailing))
    }
    return result
  }

  // 从 xxx 开始, 长度 xxx, 仅当长度不足时, 返回长度才会变小, 当起点为负, 从 0 开始数长度
  func extSub(_ from: Int, _ length: Int) -> String {
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

  // 替换 xxx -> yyy
  func extReplace(_ string: String, _ by: String) -> String {
    if string.isEmpty { return self }
    if by.isEmpty { return self }
    if let range = range(of: string) {
      return replacingCharacters(in: range, with: by)
    }
    return self
  }
  // 替换 (0-1) -> yyy
  // 插入 (0-0) -> yyy
  // 删除
  func extReplace(_ from: Int, _ length: Int, _ by: String) -> String {
    if let fromIndex = index(startIndex, offsetBy: max(from, 0), limitedBy: endIndex) {
      if let toIndex = index(fromIndex, offsetBy: max(length, 0), limitedBy: endIndex) {
        return replacingCharacters(in: fromIndex..<toIndex, with: by)
      } else {
        return replacingCharacters(in: fromIndex..<endIndex, with: by)
      }
    } else {
      return self
    }
  }


  #if DEBUG
  static func extTestString() {
    let str = "abcdef"
    print("prefix:")
    print(str.extPrefix(1))
    print(str.extPrefix(2))
    print(str.extPrefix(20))

    print("suffix:")
    print(str.extSuffix(1))
    print(str.extSuffix(2))
    print(str.extSuffix(20))

    print("trim:")
    print(str.extTrim(2, 2))
    print("H\(str.extTrim(20, 2))H")
    print("H\(str.extTrim(2, 20))H")

    print("from length:")
    //print(str.extSubstring(from: 0, length: 2))
    print(str.extSub(0, 20))
    print(str.extSub(1, 2))
    print(str.extSub(1, 20))
    print(str.extSub(2, 2))
    print(str.extSub(2, 20))
    print("H\(str.extSub(6, 20))H")
    print("H\(str.extSub(9, 20))H")

    print("replace:")
    print(str.extReplace(0, 0, ""))
    print(str.extReplace(0, 0, "_"))
    print(str.extReplace(0, 0, "__"))
    print(str.extReplace(2, 0, ""))
    print(str.extReplace(2, 0, "_"))
    print(str.extReplace(2, 0, "__"))
    print(str.extReplace(2, 1, ""))
    print(str.extReplace(2, 1, "_"))
    print(str.extReplace(2, 1, "__"))
    print(str.extReplace(2, 10, ""))
    print(str.extReplace(2, 10, "_"))
    print(str.extReplace(2, 10, "__"))
    print(str.extReplace(20, 10, ""))
    print(str.extReplace(20, 10, "_"))
    print(str.extReplace(20, 10, "__"))
    print(str.extReplace(2, -1, "__"))
    print(str.extReplace("bc", ""))
//    print("H\(str.extTrim(20, 2))H")
//    print("H\(str.extTrim(2, 20))H")
  }
  #endif
}
