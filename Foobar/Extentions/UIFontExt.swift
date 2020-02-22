//
//  UIFontExt.swift
//  Foobar
//
//  Created by Kevin Wu on 1/9/20.
//  Copyright (c) firefly.com. All rights reserved.
//

import UIKit

// TODO: CGFloat

extension UIFont {

  // Ratio: 0.2 - 0.45

  func extLineSpacing(_ ratio: CGFloat = 0.2) -> CGFloat {
    return lineHeight * ratio
  }

  func extLineHeight(_ ratio: CGFloat = 0.2) -> CGFloat {
    return lineHeight * (1.0 + ratio)
  }

}
