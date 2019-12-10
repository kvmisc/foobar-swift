//
//  UIElement.swift
//  Foobar
//
//  Created by Kevin Wu on 12/8/19.
//  Copyright (c) firefly.com. All rights reserved.
//

import UIKit

// MARK: Color
func ccc(_ red: Int, _ green: Int, _ blue: Int, _ alpha: Int = 255) -> UIColor {
  return UIColor(red: CGFloat(red)/255,
                 green: CGFloat(green)/255,
                 blue: CGFloat(blue)/255,
                 alpha: CGFloat(alpha)/255)
}
func ccc(_ hex: String) -> UIColor {
  var string = hex
  if string.hasPrefix("#") { string = String(string.dropFirst()) }
  let value = UInt32(string, radix: 16) ?? 0
  let red, green, blue, alpha: UInt32
  switch string.count {
  case 3:
    (red, green, blue, alpha) = ((value >> 8) * 17, (value >> 4 & 0xF) * 17, (value & 0xF) * 17, 255)
  case 6:
    (red, green, blue, alpha) = (value >> 16, value >> 8 & 0xFF, value & 0xFF, 255)
  case 8:
    (red, green, blue, alpha) = (value >> 24, value >> 16 & 0xFF, value >> 8 & 0xFF, value & 0xFF)
  default:
    (red, green, blue, alpha) = (255, 255, 255, 255)
  }
  return UIColor(red: CGFloat(red)/255,
                 green: CGFloat(green)/255,
                 blue: CGFloat(blue)/255,
                 alpha: CGFloat(alpha)/255)
}

// MARK: Font
func ccf(_ size: CGFloat) -> UIFont {
  return UIFont.systemFont(ofSize: size)
}
extension UIFont {
  enum LineSpacingRatio: CGFloat {
    case min = 0.2
    case max = 0.45
  }
  func extLineSpacing(_ ratio: CGFloat = LineSpacingRatio.min.rawValue) -> CGFloat {
    return lineHeight * ratio
  }
  func extLineHeight(_ ratio: CGFloat = LineSpacingRatio.min.rawValue) -> CGFloat {
    return lineHeight * (1.0 + ratio)
  }
}

// MARK: Image
func cci(_ name: String) -> UIImage? {
  return UIImage(named: name)
}

// MARK: Point
func ccp(_ value: CGFloat) -> CGPoint {
  return CGPoint(x: value, y: value)
}
func ccp(_ x: CGFloat, _ y: CGFloat) -> CGPoint {
  return CGPoint(x: x, y: y)
}

// MARK: Size
func ccs(_ value: CGFloat) -> CGSize {
  return CGSize(width: value, height: value)
}
func ccs(_ width: CGFloat, _ height: CGFloat) -> CGSize {
  return CGSize(width: width, height: height)
}

// MARK: Rect
func ccr(_ width: CGFloat, _ height: CGFloat) -> CGRect {
  return CGRect(x: 0, y: 0, width: width, height: height)
}
func ccr(_ x: CGFloat, _ y: CGFloat, _ width: CGFloat, _ height: CGFloat) -> CGRect {
  return CGRect(x: x, y: y, width: width, height: height)
}
