//
//  Layout.swift
//  Foobar
//
//  Created by Kevin Wu on 12/6/19.
//  Copyright (c) firefly.com. All rights reserved.
//

import UIKit

extension UIView {

  var extMin: CGPoint {
    get { return frame.origin }
    set { frame.origin = newValue }
  }
  var extMinX: CGFloat {
    get { return frame.minX }
    set { frame.origin.x = newValue }
  }
  var extMinY: CGFloat {
    get { return frame.minY }
    set { frame.origin.y = newValue }
  }

  var extMid: CGPoint {
    get { return CGPoint(x: frame.midX, y: frame.midY) }
    set { frame.origin = CGPoint(x: newValue.x - frame.width / 2.0, y: newValue.y - frame.height / 2.0) }
  }
  var extMidX: CGFloat {
    get { return frame.midX }
    set { frame.origin.x = newValue - frame.width / 2.0 }
  }
  var extMidY: CGFloat {
    get { return frame.midY }
    set { frame.origin.y = newValue - frame.height / 2.0 }
  }

  var extMax: CGPoint {
    get { return CGPoint(x: frame.maxX, y: frame.maxY) }
    set { frame.origin = CGPoint(x: newValue.x - frame.width, y: newValue.y - frame.height) }
  }
  var extMaxX: CGFloat {
    get { return frame.maxX }
    set { frame.origin.x = newValue - frame.width }
  }
  var extMaxY: CGFloat {
    get { return frame.maxY }
    set { frame.origin.y = newValue - frame.height }
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
