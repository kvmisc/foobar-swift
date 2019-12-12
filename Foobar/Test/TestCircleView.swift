//
//  TestCircleView.swift
//  Foobar
//
//  Created by Kevin Wu on 12/12/19.
//  Copyright (c) firefly.com. All rights reserved.
//

import UIKit

@IBDesignable
class TestCircleView: UIView {

  @IBInspectable var radius: CGFloat {
    get { return self.layer.cornerRadius }
    set { self.layer.cornerRadius = newValue; self.layer.masksToBounds = true }
  }
  @IBInspectable var bdWidth: CGFloat{
    get { return self.layer.borderWidth }
    set { self.layer.borderWidth = newValue }
  }
  @IBInspectable var bdColor: UIColor?{
    get { return UIColor(cgColor: self.layer.borderColor ?? UIColor.white.cgColor) }
    set { self.layer.borderColor = newValue?.cgColor }
  }

//  override init(frame: CGRect) {
//    super.init(frame: frame)
//    self.layer.cornerRadius = radius
//    self.layer.borderColor = bdColor?.cgColor
//    self.layer.borderWidth = bdWidth
//  }
//  required init?(coder: NSCoder) {
//    super.init(coder: coder)
//    self.layer.cornerRadius = radius
//    self.layer.borderColor = bdColor?.cgColor
//    self.layer.borderWidth = bdWidth
//  }
}
