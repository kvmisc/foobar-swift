//
//  Expiration.swift
//  Foobar
//
//  Created by Kevin Wu on 12/12/19.
//  Copyright (c) firefly.com. All rights reserved.
//

import UIKit

class Expiration {
  private var path: String = ""
  private var pool: [String:Double] = [:]
  private var lock = NSLock()

  init(_ path: String) {
    self.path = path

    let original = Archive.fromJSONFile(path) as? [String:Double]
    if let original = original {
      pool = cleanInvalidEntries(original)
    }
    Archive.toJSONFile(pool, path)
  }

  func hasKey(_ key: String) -> Bool {
    var ret = false
    lock.lock()
    if let value = pool[key] {
      ret = Date().timeIntervalSince1970 < value
    }
    lock.unlock()
    return ret
  }
  func setKey(_ key: String, _ timeout: TimeInterval) {
    guard !key.isEmpty else { return }
    lock.lock()
    if timeout > 0.0 {
      pool[key] = Date().timeIntervalSince1970 + timeout
    } else {
      pool[key] = nil
    }
    Archive.toJSONFile(pool, path)
    lock.unlock()
  }
  func removeKey(_ key: String) {
    guard !key.isEmpty else { return }
    lock.lock()
    pool[key] = nil
    Archive.toJSONFile(pool, path)
    lock.unlock()
  }
  func removeAllKeys() {
    lock.lock()
    pool = [:]
    Archive.toJSONFile(pool, path)
    lock.unlock()
  }

  func clean() {
    lock.lock()
    pool = cleanInvalidEntries(pool)
    Archive.toJSONFile(pool, path)
    lock.unlock()
  }

  private func cleanInvalidEntries(_ source: [String:Double]) -> [String:Double] {
    var ret: [String:Double] = [:]
    let now = Date().timeIntervalSince1970
    for (key, value) in source {
      if key.isEmpty { continue }
      if value <= now { continue }
      ret[key] = value
    }
    return ret
  }

}
