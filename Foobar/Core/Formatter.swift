//
//  Formatter.swift
//  Foobar
//
//  Created by Kevin Wu on 12/6/19.
//  Copyright (c) firefly.com. All rights reserved.
//

import UIKit

// MARK: DateTime

class Formatter {
  static let datetime_01: DateFormatter = {
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
    let scanner = Scanner(string: self)
    scanner.locale = NSLocale.current
    var value: Int = 0
    scanner.scanInt(&value)
    return value
  }
  // " 1.2" -> 1.2
  // " .2a" -> 0.2
  // "a123" -> 0.0
  func extDouble() -> Double {
    let scanner = Scanner(string: self)
    scanner.locale = NSLocale.current
    var value: Double = 0.0
    scanner.scanDouble(&value)
    return value
  }
  func extFloat() -> Float {
    return Float(extDouble())
  }
  func extCGFloat() -> CGFloat {
    return CGFloat(extDouble())
  }
  #if DEBUG
  static func extTestNumber() {
    print(" 123".extInt())
    print(" 12a".extInt())
    print("a123".extInt())
    print("0x12".extInt())

    print(" 1.2".extDouble())
    print(" .2a".extDouble())
    print("a123".extDouble())
  }
  #endif
}

public extension FloatingPoint {
  // 保留 xxx 位, 四舍五入
  // 1.12351234 -> 1.124
  // https://codereview.stackexchange.com/questions/142748/swift-floatingpoint-rounded-to-places
  func extRound(_ places: Int) -> Self {
    if places >= 0 {
      var divisor: Self = 1
      for _ in 0..<places { divisor *= 10 }
      return (self * divisor).rounded() / divisor
    }
    return self
  }
  // 保留 xxx 位, 向下
  // 1.12351234 -> 1.123
  func extFloor(_ places: Int) -> Self {
    if places >= 0 {
      var divisor: Self = 1
      for _ in 0..<places { divisor *= 10 }
      return floor(self * divisor) / divisor
    }
    return self
  }
  // 保留 xxx 位, 向上
  // 1.12351234 -> 1.124
  func extCeil(_ places: Int) -> Self {
    if places >= 0 {
      var divisor: Self = 1
      for _ in 0..<places { divisor *= 10 }
      return ceil(self * divisor) / divisor
    }
    return self
  }

  // 相等判断
  func extEqual(_ value: Self) -> Bool {
    return ( abs(self - value) < Self.ulpOfOne )
  }
}

