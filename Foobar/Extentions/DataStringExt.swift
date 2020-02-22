//
//  DataExt.swift
//  Foobar
//
//  Created by Kevin Wu on 11/27/19.
//  Copyright (c) firefly.com. All rights reserved.
//

import UIKit

extension Data {

  func extUTF8String() -> String {
    return String(decoding: self, as: UTF8.self)
  }

}

extension String {

  func extUTF8Data() -> Data {
    if let dat = self.data(using: .utf8) {
      return dat
    }
    return Data()
  }

}
