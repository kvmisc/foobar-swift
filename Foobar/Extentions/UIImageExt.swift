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
  static func extColorImage(_ color: UIColor, _ size: CGSize) -> UIImage {
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

  func extQRCodeImage(_ code: String, _ size: CGSize) -> UIImage? {
    guard !code.isEmpty else { return nil }

    // Need to convert the string to a UTF-8 encoded NSData object
    let data = code.extUTF8Data()

    // Create the filter
    let filter = CIFilter(name: "CIQRCodeGenerator")
    // Set the message content and error-correction level
    filter?.setValue(data, forKey: "inputMessage")
    filter?.setValue("H", forKey: "inputCorrectionLevel")

    // Send the image back
    let ciImage = filter?.outputImage
    //NSLog(@"ciImage: (%d, %d)", (int)(ciImage.extent.size.width), (int)(ciImage.extent.size.height));

    if let ciImage = ciImage {

      // Render the CIImage into a CGImage
      let cgImage = CIContext(options: nil).createCGImage(ciImage, from: ciImage.extent)
      //NSLog(@"cgImage: (%d, %d)", (int)CGImageGetWidth(cgImage), (int)CGImageGetHeight(cgImage));

      if let cgImage = cgImage {
        // Now we'll rescale using CoreGraphics
        let rect = CGRect(x: 0, y: 0, width: size.width, height: size.height)
        let renderer = UIGraphicsImageRenderer(bounds: rect)
        return renderer.image { (ctx) in
          ctx.cgContext.interpolationQuality = .none
          ctx.cgContext.draw(cgImage, in: rect)
        }
      }

    }

    return nil
  }

  // TODO: 圆角
  // ...
}

// MARK: Scale
extension UIImage {
  func extScaledImage(_ size: CGSize, _ mode: CGSize.ScaleMode, _ force: Bool = false) -> UIImage {
    if self.size.width.extEqual(size.width) && self.size.height.extEqual(size.height) {
      return self
    }
    if self.size.width < size.width && self.size.height < size.height {
      if !force { return self }
    }

    var viewport = CGRect.zero
    var bounds = CGRect.zero
    switch mode {
    case .Fill:
      viewport.size.width = floor(size.width)
      viewport.size.height = floor(size.height)
      bounds.size.width = viewport.size.width
      bounds.size.height = viewport.size.height
    case .AspectFit:
      let ratio = min(size.width/self.size.width, size.height/self.size.height)
      viewport.size.width = floor(self.size.width * ratio)
      viewport.size.height = floor(self.size.height * ratio)
      bounds.size.width = viewport.size.width
      bounds.size.height = viewport.size.height
    case .AspectFill:
      viewport.size.width = floor(size.width)
      viewport.size.height = floor(size.height)
      let ratio1 = size.width/self.size.width
      let ratio2 = size.height/self.size.height
      let ratio = max(ratio1, ratio2)
      let iw = (ratio1 > ratio2) ? (viewport.size.width) : floor(self.size.width * ratio)
      let ih = (ratio1 > ratio2) ? floor(self.size.height * ratio) : (viewport.size.height)
      bounds.origin.x = floor((viewport.width - iw)/2.0)
      bounds.origin.y = floor((viewport.width - ih)/2.0)
      bounds.size.width = iw
      bounds.size.height = ih
    }
    let renderer = UIGraphicsImageRenderer(bounds: viewport)
    return renderer.image { (ctx) in
      self.draw(in: bounds)
    }
  }
//  func extScaleToFill(_ size: CGSize, _ force: Bool = false) -> UIImage {
//    if self.size.width.extEqual(size.width)
//      && self.size.height.extEqual(size.height)
//    {
//      return self
//    }
//    if self.size.width < size.width
//      && self.size.height < size.height
//    {
//      if !force { return self }
//    }
//
//    let bounds = CGRect(x: 0, y: 0, width: floor(size.width), height: floor(size.height))
//    let renderer = UIGraphicsImageRenderer(bounds: bounds)
//    return renderer.image { (ctx) in
//      self.draw(in: bounds)
//    }
//  }
//  func extScaleToAspectFit(_ size: CGSize, _ force: Bool = false) -> UIImage {
//    if self.size.width.extEqual(size.width)
//      && self.size.height.extEqual(size.height)
//    {
//      return self
//    }
//    if self.size.width < size.width
//      && self.size.height < size.height
//    {
//      if !force { return self }
//    }
//
//    let ratio = min(size.width/self.size.width, size.height/self.size.height)
//    let bounds = CGRect(x: 0, y: 0, width: floor(self.size.width * ratio), height: floor(self.size.height * ratio))
//
//    let renderer = UIGraphicsImageRenderer(bounds: bounds)
//    return renderer.image { (ctx) in
//      self.draw(in: bounds)
//    }
//  }
//  func extScaleToAspectFill(_ size: CGSize, _ force: Bool = false) -> UIImage {
//    if self.size.width.extEqual(size.width)
//      && self.size.height.extEqual(size.height)
//    {
//      return self
//    }
//    if self.size.width < size.width
//      && self.size.height < size.height
//    {
//      if !force { return self }
//    }
//
//    let viewport = CGRect(x: 0, y: 0, width: floor(size.width), height: floor(size.height))
//
//    let ratio = max(size.width/self.size.width, size.height/self.size.height)
//    let iw = self.size.width * ratio
//    let ih = self.size.height * ratio
//    let bounds = CGRect(x: floor((size.width - iw)/2.0),
//                        y: floor((size.width - ih)/2.0),
//                        width: floor(iw),
//                        height: floor(ih))
//
//    let renderer = UIGraphicsImageRenderer(bounds: viewport)
//    return renderer.image { (ctx) in
//      self.draw(in: bounds)
//    }
//  }
}
