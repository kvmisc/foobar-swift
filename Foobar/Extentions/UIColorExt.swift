//
//  UIColorExt.swift
//  Foobar
//
//  Created by Kevin Wu on 1/9/20.
//  Copyright (c) firefly.com. All rights reserved.
//

import UIKit

extension UIColor {

  // 图片 scale 为屏幕 scale
  func extToImage(_ size: CGSize = CGSize(width: 8, height: 8)) -> UIImage {
    let bounds = CGRect(x: 0, y: 0, width: floor(size.width), height: floor(size.height))
    let renderer = UIGraphicsImageRenderer(bounds: bounds)
    return renderer.image { (ctx) in
      self.setFill()
      ctx.fill(bounds)
    }
  }

  // TODO: CGFloat
  func extWhited(_ alpha: CGFloat = 0.25) -> UIColor {
    var bgR: CGFloat = 0
    var bgG: CGFloat = 0
    var bgB: CGFloat = 0
    var bgA: CGFloat = 0
    self.getRed(&bgR, green: &bgG, blue: &bgB, alpha: &bgA)

    let overlay = UIColor.white.withAlphaComponent(alpha)
    var fgR: CGFloat = 0
    var fgG: CGFloat = 0
    var fgB: CGFloat = 0
    var fgA: CGFloat = 0
    overlay.getRed(&fgR, green: &fgG, blue: &fgB, alpha: &fgA)

    let r = fgA * fgR + (1.0 - fgA) * bgR
    let g = fgA * fgG + (1.0 - fgA) * bgG
    let b = fgA * fgB + (1.0 - fgA) * bgB
    return UIColor(red: r, green: g, blue: b, alpha: 1.0)
  }

}
