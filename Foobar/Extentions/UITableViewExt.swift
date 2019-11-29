//
//  UITableViewExt.swift
//  Foobar
//
//  Created by Kevin Wu on 11/29/19.
//  Copyright (c) firefly.com. All rights reserved.
//

import UIKit

extension UITableView {
  func extRegisterNib(_ cls: AnyClass) {
    let name = String(describing: cls)
    self.register(UINib(nibName: name, bundle: nil),
                  forCellReuseIdentifier: name)
  }
  func extRegisterClass(_ cls: AnyClass) {
    let name = String(describing: cls)
    self.register(cls, forCellReuseIdentifier: name)
  }
}
