//
//  Archive.swift
//  Foobar
//
//  Created by Kevin Wu on 12/16/19.
//  Copyright (c) firefly.com. All rights reserved.
//

import UIKit

class Archive {
  @discardableResult
  static func toJSONFile<EncodableType: Encodable>(_ object: EncodableType, _ path: String) -> Bool {
    let encoder = JSONEncoder()
    do {

      let dat = try encoder.encode(object)

      do {
        try dat.write(to: URL(fileURLWithPath: path))
        return true
      } catch {
        return false
      }
      
    } catch {
      return false
    }
  }
  static func fromJSONFile(_ path: String) -> Any? {
    do {
      let dat = try Data(contentsOf: URL(fileURLWithPath: path))

      do {
        let ret = try JSONSerialization.jsonObject(with: dat, options: [])
        return ret
      } catch {
        return nil
      }

    } catch {
      return nil
    }
  }
}
