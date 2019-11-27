//
//  FBBase64.swift
//  Foobar
//
//  Created by Kevin Wu on 11/27/19.
//  Copyright (c) firefly.com. All rights reserved.
//

import UIKit

extension Data {

  func extToBase64Data() -> Data {
    return self.base64EncodedData()
  }

  static func extFromBase64Data(_ data: Data) -> Data {
    if let dat = Data(base64Encoded: data, options: []) {
      return dat
    }
    return Data()
  }


  func extToBase64String() -> String {
    return self.base64EncodedString()
  }

  static func extFromBase64String(_ string: String) -> Data {
    if let dat = Data(base64Encoded: string, options: []) {
      return dat
    }
    return Data()
  }

}

extension String {

  func extBase64Encode() -> String {
    return self.extToUTF8Data().extToBase64String()
  }

  func extBase64Decode() -> String {
    return Data.extFromBase64String(self).extToUTF8String()
  }

}
