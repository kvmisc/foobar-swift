//
//  FBRedView.swift
//  Foobar
//
//  Created by Kevin Wu on 11/29/19.
//  Copyright (c) firefly.com. All rights reserved.
//

import UIKit
import Reusable

class FBRedView: UIView, NibOwnerLoadable {

  required init?(coder: NSCoder) {
    super.init(coder: coder)
    self.loadNibContent()
  }

}
