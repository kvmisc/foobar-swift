//
//  Layout.swift
//  Foobar
//
//  Created by Kevin Wu on 12/6/19.
//  Copyright (c) firefly.com. All rights reserved.
//

import UIKit

extension UIView {

  var min: CGPoint {
    get { return frame.origin }
    set { frame.origin = newValue }
  }
  var minX: CGFloat {
    get { return frame.minX }
    set { frame.origin.x = newValue }
  }
  var minY: CGFloat {
    get { return frame.minY }
    set { frame.origin.y = newValue }
  }

  var mid: CGPoint {
    get { return CGPoint(x: frame.midX, y: frame.midY) }
    set { frame.origin = CGPoint(x: newValue.x - frame.width / 2.0, y: newValue.y - frame.height / 2.0) }
  }
  var midX: CGFloat {
    get { return frame.midX }
    set { frame.origin.x = newValue - frame.width / 2.0 }
  }
  var midY: CGFloat {
    get { return frame.midY }
    set { frame.origin.y = newValue - frame.height / 2.0 }
  }

  var max: CGPoint {
    get { return CGPoint(x: frame.maxX, y: frame.maxY) }
    set { frame.origin = CGPoint(x: newValue.x - frame.width, y: newValue.y - frame.height) }
  }
  var maxX: CGFloat {
    get { return frame.maxX }
    set { frame.origin.x = newValue - frame.width }
  }
  var maxY: CGFloat {
    get { return frame.maxY }
    set { frame.origin.y = newValue - frame.height }
  }


  var size: CGSize {
    get { return frame.size }
    set { frame.size = newValue }
  }
  var width: CGFloat {
    get { return frame.size.width }
    set { frame.size.width = newValue }
  }
  var height: CGFloat {
    get { return frame.size.height }
    set { frame.size.height = newValue }
  }

}

extension UIScrollView {
  var contentWidth: CGFloat {
    get { return contentSize.width }
    set { contentSize.width = newValue }
  }
  var contentHeight: CGFloat {
    get { return contentSize.height }
    set { contentSize.height = newValue }
  }

  var viewportTop: CGFloat {
    get { return contentOffset.y }
    set { contentOffset.y = newValue }
  }
  var viewportLeft: CGFloat {
    get { return contentOffset.x }
    set { contentOffset.x = newValue }
  }
  var viewportBottom: CGFloat {
    get { return contentOffset.y + frame.height }
    set { contentOffset.y = newValue - frame.height }
  }
  var viewportRight: CGFloat {
    get { return contentOffset.x + frame.width }
    set { contentOffset.x = newValue - frame.width }
  }
}

extension CGPoint {
  init(_ value: CGFloat) {
    self.init(x: value, y: value)
  }
  init(_ valueX: CGFloat, _ valueY: CGFloat) {
    self.init(x: valueX, y: valueY)
  }

  func with(x: CGFloat) -> CGPoint {
    return CGPoint(x: x, y: y)
  }
  func with(y: CGFloat) -> CGPoint {
    return CGPoint(x: x, y: y)
  }
}

extension CGSize {
  init(_ value: CGFloat) {
    self.init(width: value, height: value)
  }
  init(_ valueWidth: CGFloat, _ valueHeight: CGFloat) {
    self.init(width: valueWidth, height: valueHeight)
  }

  func with(width: CGFloat) -> CGSize {
    return CGSize(width: width, height: height)
  }
  func with(height: CGFloat) -> CGSize {
    return CGSize(width: width, height: height)
  }
}

extension CGRect {
  init(_ valueWidth: CGFloat, _ valueHeight: CGFloat) {
    self.init(x: 0, y: 0, width: valueWidth, height: valueHeight)
  }
  init(_ valueX: CGFloat, _ valueY: CGFloat, _ valueWidth: CGFloat, _ valueHeight: CGFloat) {
    self.init(x: valueX, y: valueY, width: valueWidth, height: valueHeight)
  }

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
}
