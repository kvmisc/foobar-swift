//
//  Foobar.swift
//  Foobar
//
//  Created by Kevin Wu on 11/27/19.
//  Copyright (c) firefly.com. All rights reserved.
//

import UIKit

class Foobar {}


extension Foobar {

  class Path {
    static func bundle(_ path: String = "", _ bundle: Bundle = Bundle.main) -> String {
      if let bundlePath = bundle.resourcePath {
        return bundlePath.extAppendingPathComponent(path)
      }
      return ""
    }
    static func document(_ path: String = "") -> String {
      let paths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
      if !(paths.isEmpty) {
        return paths[0].extAppendingPathComponent(path)
      }
      return ""
    }
  }

}
