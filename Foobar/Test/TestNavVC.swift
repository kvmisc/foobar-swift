//
//  TestNavVC.swift
//  Foobar
//
//  Created by Kevin Wu on 1/20/20.
//  Copyright (c) firefly.com. All rights reserved.
//

import UIKit

class TestNavVC: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()

  }

  @IBAction func alert(_ sender: Any) {

    URLNavigation.shared.alert("aaa", "bbb")
  }

}
