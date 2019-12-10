//
//  ThroughView.swift
//  Foobar
//
//  Created by Kevin Wu on 12/10/19.
//  Copyright (c) firefly.com. All rights reserved.
//

import UIKit

class ThroughView: UIView {
//  override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
////    for view in subviews {
////      if !view.isHidden
////        && view.alpha > 0
////        && view.isUserInteractionEnabled
////        && view.point(inside: convert(point, to: view), with:event)
////      {
////        return true
////      }
////    }
//    return false
//  }
//  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//    //super.touchesBegan(touches, with: event)
//    self.next?.touchesBegan(touches, with: event)
//  }
//  override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
//    self.next?.touchesMoved(touches, with: event)
//  }
//  override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
//    //super.touchesEnded(touches, with: event)
//    self.next?.touchesEnded(touches, with: event)
//  }
//  override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
//    self.next?.touchesCancelled(touches, with: event)
//  }

  override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
    print("in hit test \(event?.type)")
    return self
  }
}
