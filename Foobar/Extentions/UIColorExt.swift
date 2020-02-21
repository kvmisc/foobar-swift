//
//  UIColorExt.swift
//  Foobar
//
//  Created by Kevin Wu on 1/9/20.
//  Copyright (c) firefly.com. All rights reserved.
//

import UIKit

extension UIColor {

  func extOverlayWhite(_ alpha: CGFloat = 0.25) -> UIColor {
    var bgR: CGFloat = 0
    var bgG: CGFloat = 0
    var bgB: CGFloat = 0
    var bgA: CGFloat = 0
    self.getRed(&bgR, green: &bgG, blue: &bgB, alpha: &bgA)

    var fgR: CGFloat = 0
    var fgG: CGFloat = 0
    var fgB: CGFloat = 0
    var fgA: CGFloat = 0
    let overlay = UIColor.white.withAlphaComponent(alpha)
    overlay.getRed(&fgR, green: &fgG, blue: &fgB, alpha: &fgA)

    let r = fgA * fgR + (1 - fgA) * bgR
    let g = fgA * fgG + (1 - fgA) * bgG
    let b = fgA * fgB + (1 - fgA) * bgB

    return UIColor(red: r, green: g, blue: b, alpha: 1.0)
  }

}
