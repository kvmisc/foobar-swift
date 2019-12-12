//
//  TestCodingObject.swift
//  Foobar
//
//  Created by Kevin Wu on 12/12/19.
//  Copyright (c) firefly.com. All rights reserved.
//

import UIKit

class TestCodingObject: NSObject, NSCoding {
  var name: String = ""
  var age: Int = 0
  override init() {
    super.init()
  }
  required init?(coder: NSCoder) {
    name = coder.decodeObject(forKey: "kName") as? String ?? ""
    age = coder.decodeInteger(forKey: "kAge")
  }
  func encode(with coder: NSCoder) {
    coder.encode(name, forKey: "kName")
    coder.encode(age, forKey: "kAge")
  }
}
