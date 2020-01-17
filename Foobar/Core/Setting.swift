//
//  Setting.swift
//  Foobar
//
//  Created by Kevin Wu on 1/17/20.
//  Copyright (c) firefly.com. All rights reserved.
//

import UIKit

class Setting {
  private var entries: [String:String] = [:]

  func has(_ key: String) -> Bool {
    return false
  }

  func string(_ key: String) -> String {
    return ""
  }
  func bool(_ key: String) -> Bool {
    return false
  }
}
