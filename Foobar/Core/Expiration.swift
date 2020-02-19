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
  private var work: DispatchWorkItem? = nil

  init(_ path: String) {
    self.path = path

    if let original: [String:Double] = Archive.fromJSONFile(path) {
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
    delayClean()
    return ret
  }
  func setKey(_ key: String, _ timeout: TimeInterval) {
    if key.isEmpty { return }
    lock.lock()
    if timeout > 0.0 {
      pool[key] = Date().timeIntervalSince1970 + timeout
    } else {
      pool[key] = nil
    }
    Archive.toJSONFile(pool, path)
    lock.unlock()
    delayClean()
  }
  func removeKey(_ key: String) {
    if key.isEmpty { return }
    lock.lock()
    pool[key] = nil
    Archive.toJSONFile(pool, path)
    lock.unlock()
    delayClean()
  }
  func removeAllKeys() {
    lock.lock()
    pool = [:]
    Archive.toJSONFile(pool, path)
    lock.unlock()
  }

  private func delayClean() {
    print("expiration in delay: \(work != nil)")
    work?.cancel()

    let newWork = DispatchWorkItem { [weak self] in
      guard let self = self else { return }
      print("expiration to clean")
      self.clean()
      self.work = nil
    }

    work = newWork
    DispatchQueue.main.asyncAfter(deadline: .now() + 5, execute: newWork)
  }
  func clean() {
    print("expiration did clean")
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
