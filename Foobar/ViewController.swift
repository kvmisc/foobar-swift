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

    let str = "abcd"
    print(str.extSubstring(trimLeading: 1, trimTrailing: 1))
  }


}

