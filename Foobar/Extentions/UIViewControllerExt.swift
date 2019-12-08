//
//  UIViewControllerExt.swift
//  Foobar
//
//  Created by Kevin Wu on 12/8/19.
//  Copyright (c) firefly.com. All rights reserved.
//

import UIKit

extension UIViewController {
  func extAddChild(_ child: UIViewController, inView: UIView? = nil) {
    addChild(child)
    (inView ?? view).addSubview(child.view)
    child.didMove(toParent: self)
  }
  func extRemoveChild(_ child: UIViewController) {
    child.willMove(toParent: nil)
    child.view.removeFromSuperview()
    child.removeFromParent()
  }
}

extension UINavigationController {
  func extPopViewController(_ count: Int, _ animated: Bool) {
    let vcCount = viewControllers.count
    if vcCount > 1 {
      if count == 1 {
        popViewController(animated: animated)
      } else if count > 1 {
        if count >= (vcCount - 1) {
          popToRootViewController(animated: animated)
        } else {
          popToViewController(viewControllers[vcCount-count-1], animated: animated)
        }
      }
    }
  }
}
