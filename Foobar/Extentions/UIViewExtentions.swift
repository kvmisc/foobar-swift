//
//  UIViewExtentions.swift
//  Foobar
//
//  Created by Kevin Wu on 11/27/19.
//  Copyright (c) firefly.com. All rights reserved.
//

import UIKit

extension UIView {

  static func extLoadFromNib() -> UIView? {
    let name = String(describing: self)
    return Bundle.main.loadNibNamed(name, owner: nil, options: nil)?.last as? UIView
  }

}
