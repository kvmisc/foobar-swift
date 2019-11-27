//
//  Foobar.swift
//  Foobar
//
//  Created by Kevin Wu on 11/27/19.
//  Copyright (c) firefly.com. All rights reserved.
//

import UIKit

class Foobar {

  static func pathBundle(_ bundle: Bundle,
                         _ path: String = "")
    -> String
  {
    if let bundlePath = bundle.resourcePath {
      return bundlePath.extAppendingPathComponent(path)
    }
    return ""
  }
  static func pathDocument(_ path: String = "") -> String {
    let paths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
    if !(paths.isEmpty) {
      return paths[0].extAppendingPathComponent(path)
    }
    return ""
  }

}
