//
//  UIFontExt.swift
//  Foobar
//
//  Created by Kevin Wu on 1/9/20.
//  Copyright (c) firefly.com. All rights reserved.
//

import UIKit

let LINE_SPACING_RATIO_MIN: CGFloat = 0.2
let LINE_SPACING_RATIO_MAX: CGFloat = 0.45

extension UIFont {

  // TODO: cgfloat to double
  func extLineSpacing(_ ratio: CGFloat = LINE_SPACING_RATIO_MIN) -> CGFloat {
    return lineHeight * ratio
  }

  func extLineHeight(_ ratio: CGFloat = LINE_SPACING_RATIO_MIN) -> CGFloat {
    return lineHeight * (1.0 + ratio)
  }

}
