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
  static func toJSONFile(_ object: Any, _ path: String, _ options: JSONSerialization.WritingOptions = []) -> Bool {
    let dat = try? JSONSerialization.data(withJSONObject: object, options: options)
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
  static func fromJSONFile(_ path: String, _ options: JSONSerialization.ReadingOptions = []) -> Any? {
    let dat = try? Data(contentsOf: URL(fileURLWithPath: path))
    if let dat = dat {
      do {
        let ret = try JSONSerialization.jsonObject(with: dat, options: options)
        return ret
      } catch {
        return nil
      }
    }
    return nil
  }


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


  #if DEBUG
  static func TestArchive() {
    let v1 = ["aa","bb","cc"]
    Archive.toJSONFile(v1, Path.document("a.json"))
    let v2: [Any] = ["aa",true,103]
    Archive.toJSONFile(v2, Path.document("b.json"))

    let v3: [String:Any] = ["aa":101,"bb":true,"cc":"asdf"]
    Archive.toJSONFile(v3, Path.document("c.json"))
  }
  #endif

}
