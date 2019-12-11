//
//  TestViewStateRootVC.swift
//  Foobar
//
//  Created by Kevin Wu on 12/11/19.
//  Copyright (c) firefly.com. All rights reserved.
//

import UIKit

class TestViewStateRootVC: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .red
  }

  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    let vc = TestViewStateVC()
    self.navigationController?.pushViewController(vc, animated: true)
  }
}
