//
//  ViewController.swift
//  Foobar
//
//  Created by Kevin Wu on 11/27/19.
//  Copyright (c) firefly.com. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()

    var str1 = "ab cd"
    var str2 = "ab%20cd"
    print("\(str1.extURLEncodedString) \(str1)")
    print("\(str2.extURLDecodedString) \(str2)")

    print("\(str1.extURLEncode()) \(str1)")
    print("\(str2.extURLDecode()) \(str2)")
  }


}

