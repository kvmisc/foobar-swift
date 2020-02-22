//
//  Layout.swift
//  Foobar
//
//  Created by Kevin Wu on 12/6/19.
//  Copyright (c) firefly.com. All rights reserved.
//

import UIKit

extension UIView {
  func extOccupySuperview(_ inset: UIEdgeInsets = .zero) {
    self.snp.makeConstraints { (make) in
      make.edges.equalToSuperview().inset(inset)
    }
  }
  func extAlignCenter(_ offset: CGPoint = .zero) {
    self.snp.makeConstraints { (make) in
      make.centerX.equalToSuperview().offset(offset.x)
      make.centerY.equalToSuperview().offset(offset.y)
    }
  }
}

extension UIView {

//  var extMin: CGPoint {
//    get { return frame.origin }
//    set { frame.origin = newValue }
//  }
//  var extMinX: CGFloat {
//    get { return frame.minX }
//    set { frame.origin.x = newValue }
//  }
//  var extMinY: CGFloat {
//    get { return frame.minY }
//    set { frame.origin.y = newValue }
//  }
//
//  var extMid: CGPoint {
//    get { return CGPoint(x: frame.midX, y: frame.midY) }
//    set { frame.origin = CGPoint(x: newValue.x - frame.width / 2.0, y: newValue.y - frame.height / 2.0) }
//  }
//  var extMidX: CGFloat {
//    get { return frame.midX }
//    set { frame.origin.x = newValue - frame.width / 2.0 }
//  }
//  var extMidY: CGFloat {
//    get { return frame.midY }
//    set { frame.origin.y = newValue - frame.height / 2.0 }
//  }
//
//  var extMax: CGPoint {
//    get { return CGPoint(x: frame.maxX, y: frame.maxY) }
//    set { frame.origin = CGPoint(x: newValue.x - frame.width, y: newValue.y - frame.height) }
//  }
//  var extMaxX: CGFloat {
//    get { return frame.maxX }
//    set { frame.origin.x = newValue - frame.width }
//  }
//  var extMaxY: CGFloat {
//    get { return frame.maxY }
//    set { frame.origin.y = newValue - frame.height }
//  }

  var extOrigin: CGPoint {
    get { return frame.origin }
    set { frame.origin = newValue }
  }
  var extX: CGFloat {
    get { return frame.origin.x }
    set { frame.origin.x = newValue }
  }
  var extY: CGFloat {
    get { return frame.origin.y }
    set { frame.origin.y = newValue }
  }

  var extSize: CGSize {
    get { return frame.size }
    set { frame.size = newValue }
  }
  var extWidth: CGFloat {
    get { return frame.size.width }
    set { frame.size.width = newValue }
  }
  var extHeight: CGFloat {
    get { return frame.size.height }
    set { frame.size.height = newValue }
  }

  var extIntrinsicContentWidth: CGFloat {
    let size = intrinsicContentSize
    return (size.width > 0.0) ? size.width : 0.0
  }
  var extIntrinsicContentHeight: CGFloat {
    let size = intrinsicContentSize
    return (size.height > 0.0) ? size.height : 0.0
  }

}

extension UIScrollView {
  var extContentWidth: CGFloat {
    get { return contentSize.width }
    set { contentSize.width = newValue }
  }
  var extContentHeight: CGFloat {
    get { return contentSize.height }
    set { contentSize.height = newValue }
  }

  var extViewportTop: CGFloat {
    get { return contentOffset.y }
    set { contentOffset.y = newValue }
  }
  var extViewportLeft: CGFloat {
    get { return contentOffset.x }
    set { contentOffset.x = newValue }
  }
  var extViewportBottom: CGFloat {
    get { return contentOffset.y + frame.height }
    set { contentOffset.y = newValue - frame.height }
  }
  var extViewportRight: CGFloat {
    get { return contentOffset.x + frame.width }
    set { contentOffset.x = newValue - frame.width }
  }
}

extension CGPoint {
//  init(_ value: CGFloat) {
//    self.init(x: value, y: value)
//  }
//  init(_ valueX: CGFloat, _ valueY: CGFloat) {
//    self.init(x: valueX, y: valueY)
//  }

  func with(x: CGFloat) -> CGPoint {
    return CGPoint(x: x, y: y)
  }
  func with(y: CGFloat) -> CGPoint {
    return CGPoint(x: x, y: y)
  }
}

extension CGSize {
//  init(_ value: CGFloat) {
//    self.init(width: value, height: value)
//  }
//  init(_ valueWidth: CGFloat, _ valueHeight: CGFloat) {
//    self.init(width: valueWidth, height: valueHeight)
//  }

  func with(width: CGFloat) -> CGSize {
    return CGSize(width: width, height: height)
  }
  func with(height: CGFloat) -> CGSize {
    return CGSize(width: width, height: height)
  }

  enum ScaleMode {
    case Fill
    case AspectFit
    case AspectFill
  }
  func scaled(_ size: CGSize, _ mode: ScaleMode, _ force: Bool = false) -> CGSize {
    if width.extIsEqual(size.width) && height.extIsEqual(size.height) {
      return self
    }
    if width < size.width && height < size.height {
      if !force { return self }
    }
    switch mode {
    case .Fill:
      return CGSize(width: floor(size.width), height: floor(size.height))
    case .AspectFit:
      let ratio = min(size.width/width, size.height/height)
      return CGSize(width: floor(width * ratio), height: floor(height * ratio))
    case .AspectFill:
      let ratio = max(size.width/width, size.height/height)
      return CGSize(width: floor(width * ratio), height: floor(height * ratio))
    }
  }
}

extension CGRect {
//  init(_ valueWidth: CGFloat, _ valueHeight: CGFloat) {
//    self.init(x: 0, y: 0, width: valueWidth, height: valueHeight)
//  }
//  init(_ valueX: CGFloat, _ valueY: CGFloat, _ valueWidth: CGFloat, _ valueHeight: CGFloat) {
//    self.init(x: valueX, y: valueY, width: valueWidth, height: valueHeight)
//  }

  func with(x: CGFloat, y: CGFloat) -> CGRect {
    return CGRect(x: x, y: y, width: size.width, height: size.height)
  }
  func with(x: CGFloat) -> CGRect {
    return CGRect(x: x, y: origin.y, width: size.width, height: size.height)
  }
  func with(y: CGFloat) -> CGRect {
    return CGRect(x: origin.x, y: y, width: size.width, height: size.height)
  }
  func with(width: CGFloat, height: CGFloat) -> CGRect {
    return CGRect(x: origin.x, y: origin.y, width: width, height: height)
  }
  func with(width: CGFloat) -> CGRect {
    return CGRect(x: origin.x, y: origin.y, width: width, height: size.height)
  }
  func with(height: CGFloat) -> CGRect {
    return CGRect(x: origin.x, y: origin.y, width: size.width, height: height)
  }

  func inset(_ top: CGFloat, _ left: CGFloat, _ bottom: CGFloat, _ right: CGFloat) -> CGRect {
    return CGRect(x: origin.x+left,
                  y: origin.y+top,
                  width: size.width-left-right,
                  height: size.height-top-bottom)
  }

  func offset(_ x: CGFloat, _ y: CGFloat) -> CGRect {
    return CGRect(x: origin.x+x,
                  y: origin.y+y,
                  width: size.width,
                  height: size.height)
  }

}

func ceil(_ point: CGPoint) -> CGPoint {
  return CGPoint(x: ceil(point.x), y: ceil(point.y))
}
func ceil(_ size: CGSize) -> CGSize {
  return CGSize(width: ceil(size.width), height: ceil(size.height))
}
func ceil(_ rect: CGRect) -> CGRect {
  return CGRect(x: ceil(rect.origin.x), y: ceil(rect.origin.y), width: ceil(rect.size.width), height: ceil(rect.size.height))
}

func floor(_ point: CGPoint) -> CGPoint {
  return CGPoint(x: floor(point.x), y: floor(point.y))
}
func floor(_ size: CGSize) -> CGSize {
  return CGSize(width: floor(size.width), height: floor(size.height))
}
func floor(_ rect: CGRect) -> CGRect {
  return CGRect(x: floor(rect.origin.x), y: floor(rect.origin.y), width: floor(rect.size.width), height: floor(rect.size.height))
}

enum LayoutConstraint {
  // 父视图比例
  case Ratio(value: CGFloat)
  // 与父视图距离
  case Offset(value: CGFloat)
  // 指定大小
  case Constant(value: CGFloat)
  // 视图自身大小
  case Intrinsic
}
