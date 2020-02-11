//
//  Formatter.swift
//  Foobar
//
//  Created by Kevin Wu on 12/6/19.
//  Copyright (c) firefly.com. All rights reserved.
//

import UIKit

class DateTime {
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

extension String {
  func extTimestampDate() -> Date? {
    let timestamp = extDoubleValue
    if timestamp >= 1.0 {
      return Date(timeIntervalSince1970: timestamp)
    }
    return nil
  }
  func extTimestampFormat(_ df: DateFormatter) -> String {
    if let date = extTimestampDate() {
      return df.string(from: date)
    }
    return ""
  }
}

extension Date {

  func extHumanPreferredString(_ formatter: DateFormatter? = nil) -> String {
    let currentTime = Date().timeIntervalSince1970
    let timestamp = self.timeIntervalSince1970
    let reduceTime = Int(currentTime - timestamp)

    // 时间差小于60秒
    if reduceTime < 60 {
      return "刚刚"
    }
    // 时间差大于1分钟小于60分钟
    let mins = reduceTime / 60
    if mins < 60 {
      return "\(mins)分钟前"
    }
    // 时间差大于1小时小于24小时
    let hours = reduceTime / 60 / 60
    if hours < 24 {
      return "\(hours)小时前"
    }
    // 时间差大于1天小于30天
    let days = reduceTime / 60 / 60 / 24
    if days < 30 {
      return "\(days)天前"
    }
    // 不满足以上条件直接返回日期
    if let formatter = formatter {
      return formatter.string(from: self)
    }
    let df = DateFormatter()
    df.locale = Locale(identifier: "en_US_POSIX")
    df.timeZone = TimeZone.current
    df.dateFormat = "yyyy/MM/dd"
    return df.string(from: self)
  }

}

