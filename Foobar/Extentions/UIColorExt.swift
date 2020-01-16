//
//  UIColorExt.swift
//  Foobar
//
//  Created by Kevin Wu on 1/9/20.
//  Copyright (c) firefly.com. All rights reserved.
//

import UIKit

extension UIColor {

  func extOverlayWhite() -> UIColor {
    var bgR: CGFloat = 0
    var bgG: CGFloat = 0
    var bgB: CGFloat = 0
    var bgA: CGFloat = 0
    self.getRed(&bgR, green: &bgG, blue: &bgB, alpha: &bgA)

    var fgR: CGFloat = 0
    var fgG: CGFloat = 0
    var fgB: CGFloat = 0
    var fgA: CGFloat = 0
    let overlay = UIColor.white.withAlphaComponent(0.25)
    overlay.getRed(&fgR, green: &fgG, blue: &fgB, alpha: &fgA)

    let r = fgA * fgR + (1 - fgA) * bgR
    let g = fgA * fgG + (1 - fgA) * bgG
    let b = fgA * fgB + (1 - fgA) * bgB

    return UIColor(red: r, green: g, blue: b, alpha: 1.0)
  }

  func extHexString() -> String {
    var r: CGFloat = 0
    var g: CGFloat = 0
    var b: CGFloat = 0
    var a: CGFloat = 0
    self.getRed(&r, green: &g, blue: &b, alpha: &a)
    return String(format: "#%02X%02X%02X%02X", Int(r*255), Int(g*255), Int(b*255), Int(a*255))
  }

}
