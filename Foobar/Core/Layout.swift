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
    get { return self.frame.origin }
    set { self.frame.origin = newValue }
  }
  var minX: CGFloat {
    get { return self.frame.origin.x }
    set { self.frame.origin.x = newValue }
  }
  var minY: CGFloat {
    get { return self.frame.origin.y }
    set { self.frame.origin.y = newValue }
  }

  var mid: CGPoint {
    get { return CGPoint(x: midX, y: midY) }
    set {
      var rect = self.frame
      rect.origin.x = newValue.x - width / 2.0
      rect.origin.y = newValue.y - height / 2.0
      self.frame = rect
    }
  }
  var midX: CGFloat {
    get { return minX + width / 2.0 }
    set { self.frame.origin.x = newValue - width / 2.0 }
  }
  var midY: CGFloat {
    get { return minY + height / 2.0 }
    set { self.frame.origin.y = newValue - height / 2.0 }
  }

  var max: CGPoint {
    get { return CGPoint(x: maxX, y: maxY) }
    set {
      var rect = self.frame
      rect.origin.x = newValue.x - width
      rect.origin.y = newValue.y - height
      self.frame = rect
    }
  }
  var maxX: CGFloat {
    get { return minX + width }
    set { self.frame.origin.x = newValue - width }
  }
  var maxY: CGFloat {
    get { return minY + height }
    set { self.frame.origin.y = newValue - height }
  }


  var size: CGSize {
    get { return self.frame.size }
    set {
      var rect = self.frame
      rect.size.width = newValue.width
      rect.size.height = newValue.height
      self.frame = rect
    }
  }
  var width: CGFloat {
    get { return self.frame.size.width }
    set { self.frame.size.width = newValue }
  }
  var height: CGFloat {
    get { return self.frame.size.height }
    set { self.frame.size.height = newValue }
  }

}

extension UIScrollView {
  var contentWidth: CGFloat {
    get { return self.contentSize.width }
    set { self.contentSize.width = newValue }
  }
  var contentHeight: CGFloat {
    get { return self.contentSize.height }
    set { self.contentSize.height = newValue }
  }

  var viewportTop: CGFloat {
    get { return self.contentOffset.y }
    set { self.contentOffset.y = newValue }
  }
  var viewportLeft: CGFloat {
    get { return self.contentOffset.x }
    set { self.contentOffset.x = newValue }
  }
  var viewportBottom: CGFloat {
    get { return self.contentOffset.y + height }
    set { self.contentOffset.y = newValue - height }
  }
  var viewportRight: CGFloat {
    get { return self.contentOffset.x + width }
    set { self.contentOffset.x = newValue - width }
  }
}

//extension CGRect {
//  init(_ x: CGFloat, _ y: CGFloat, _ w: CGFloat, _ h: CGFloat) {
//  }
//}
