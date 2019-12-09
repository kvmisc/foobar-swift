//
//  TestLoadView.swift
//  Foobar
//
//  Created by Kevin Wu on 12/9/19.
//  Copyright (c) firefly.com. All rights reserved.
//

import UIKit
import Reusable

class TestLoadView: UIView, NibOwnerLoadable {


  required init?(coder: NSCoder) {
    super.init(coder: coder)
    self.loadNibContent()
  }

}
