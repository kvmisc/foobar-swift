//
//  Formatter.swift
//  Foobar
//
//  Created by Kevin Wu on 12/6/19.
//  Copyright (c) firefly.com. All rights reserved.
//

import UIKit

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
