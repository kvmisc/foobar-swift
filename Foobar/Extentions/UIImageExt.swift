//
//  UIImageExt.swift
//  Foobar
//
//  Created by Kevin Wu on 12/9/19.
//  Copyright (c) firefly.com. All rights reserved.
//

import UIKit

// MARK: Common
extension UIImage {

  // 图片 scale 为屏幕 scale
  static func extColored(_ color: UIColor, _ size: CGSize) -> UIImage {
    let bounds = CGRect(x: 0, y: 0, width: size.width, height: size.height)
    let renderer = UIGraphicsImageRenderer(bounds: bounds)
    return renderer.image { (ctx) in
      color.setFill()
      ctx.fill(bounds)
    }
  }

  func extMerge(_ image: UIImage, _ at: CGPoint) -> UIImage {
    let bounds = CGRect(x: 0, y: 0, width: floor(size.width), height: floor(size.height))
    let renderer = UIGraphicsImageRenderer(bounds: bounds)
    return renderer.image { (ctx) in
      self.draw(at: .zero)
      image.draw(at: at)
    }
  }

  // TODO: 圆角
  // ...
}

// MARK: Scale
extension UIImage {
  func extScaleToFill(_ size: CGSize, _ force: Bool = false) -> UIImage {
    if self.size.width.extEqual(size.width)
      && self.size.height.extEqual(size.height)
    {
      return self
    }
    if self.size.width < size.width
      && self.size.height < size.height
    {
      if !force { return self }
    }

    let bounds = CGRect(x: 0, y: 0, width: floor(size.width), height: floor(size.height))
    let renderer = UIGraphicsImageRenderer(bounds: bounds)
    return renderer.image { (ctx) in
      self.draw(in: bounds)
    }
  }
  func extScaleToAspectFit(_ size: CGSize, _ force: Bool = false) -> UIImage {
    if self.size.width.extEqual(size.width)
      && self.size.height.extEqual(size.height)
    {
      return self
    }
    if self.size.width < size.width
      && self.size.height < size.height
    {
      if !force { return self }
    }

    let ratio = min(size.width/self.size.width, size.height/self.size.height)
    let bounds = CGRect(x: 0, y: 0, width: floor(self.size.width * ratio), height: floor(self.size.height * ratio))

    let renderer = UIGraphicsImageRenderer(bounds: bounds)
    return renderer.image { (ctx) in
      self.draw(in: bounds)
    }
  }
  func extScaleToAspectFill(_ size: CGSize, _ force: Bool = false) -> UIImage {
    if self.size.width.extEqual(size.width)
      && self.size.height.extEqual(size.height)
    {
      return self
    }
    if self.size.width < size.width
      && self.size.height < size.height
    {
      if !force { return self }
    }

    let viewport = CGRect(x: 0, y: 0, width: floor(size.width), height: floor(size.height))

    let ratio = max(size.width/self.size.width, size.height/self.size.height)
    let iw = self.size.width * ratio
    let ih = self.size.height * ratio
    let bounds = CGRect(x: floor((size.width - iw)/2.0),
                        y: floor((size.width - ih)/2.0),
                        width: floor(iw),
                        height: floor(ih))

    let renderer = UIGraphicsImageRenderer(bounds: viewport)
    return renderer.image { (ctx) in
      self.draw(in: bounds)
    }
  }
}
