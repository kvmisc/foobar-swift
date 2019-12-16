//
//  ExpirePool.swift
//  Foobar
//
//  Created by Kevin Wu on 12/12/19.
//  Copyright (c) firefly.com. All rights reserved.
//

import UIKit

class ExpirePool {
  fileprivate var path: String = ""
  fileprivate var pool: [String:Date] = [:]
  fileprivate var lock = NSLock()

  init(_ path: String) {
    self.path = path

    let original = Archive.fromJSONFile(path) as? [String:Date]
    clean(original)
  }

  func hasKey(_ key: String) -> Bool {
    var ret = false
    lock.lock()
    if let value = pool[key] {
      ret = Date() < value
    }
    lock.unlock()
    return ret
  }
  func setKey(_ key: String, _ timeout: TimeInterval) {
    lock.lock()
    if timeout > 0.0 {
      if !key.isEmpty {
        pool[key] = Date(timeIntervalSinceNow: timeout)
      }
    } else {
      // ...
    }
    lock.unlock()
  }
  func removeKey(_ key: String) {
  }
  func removeAllKeys() {
    lock.lock()
    pool = [:]
    lock.unlock()
  }

  func clean(_ source: [String:Date]? = nil) {
    lock.lock()

    var temp: [String:Date] = [:]
    let now = Date()
    for (key, value) in source ?? pool {
      if key.isEmpty { continue }
      if value <= now { continue }
      temp[key] = value
    }
    pool = temp

    lock.unlock()
  }

}
