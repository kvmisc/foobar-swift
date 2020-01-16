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
    let dat = try? encoder.encode(object)
    if let dat = dat {
      do {
        try dat.write(to: URL(fileURLWithPath: path))
        return true
      } catch {
        return false
      }
    }
    return false
  }

  static func fromJSONFile<DecodableType: Decodable>(_ path: String) -> DecodableType? {
    let dat = try? Data(contentsOf: URL(fileURLWithPath: path))
    if let dat = dat {
      do {
        let decoder = JSONDecoder()
        let ret = try decoder.decode(DecodableType.self, from: dat)
        return ret
      } catch {
        return nil
      }
    }
    return nil
  }


  @discardableResult
  static func toPlistFile<EncodableType: Encodable>(_ object: EncodableType, _ path: String) -> Bool {
    let encoder = PropertyListEncoder()
    let dat = try? encoder.encode(object)
    if let dat = dat {
      do {
        try dat.write(to: URL(fileURLWithPath: path))
        return true
      } catch {
        return false
      }
    }
    return false
  }

  static func fromPlistFile<DecodableType: Decodable>(_ path: String) -> DecodableType? {
    let dat = try? Data(contentsOf: URL(fileURLWithPath: path))
    if let dat = dat {
      do {
        let decoder = PropertyListDecoder()
        let ret = try decoder.decode(DecodableType.self, from: dat)
        return ret
      } catch {
        return nil
      }
    }
    return nil
  }

}
