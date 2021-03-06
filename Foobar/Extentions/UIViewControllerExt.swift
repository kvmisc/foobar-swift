//
//  UIViewControllerExt.swift
//  Foobar
//
//  Created by Kevin Wu on 12/8/19.
//  Copyright (c) firefly.com. All rights reserved.
//

import UIKit

extension UIViewController {
  func extAddChild(_ child: UIViewController, _ inView: UIView? = nil) {
    addChild(child)
    (inView ?? view).addSubview(child.view)
    child.didMove(toParent: self)
  }
  func extRemoveChild(_ child: UIViewController) {
    child.willMove(toParent: nil)
    child.view.removeFromSuperview()
    child.removeFromParent()
  }

  var extCanBePopped: Bool {
    if let nav = navigationController {
      return self != nav.viewControllers.first
    }
    return false
  }
  var extCanBeDismissed: Bool {
    return presentingViewController != nil
  }
}

extension UINavigationController {
  var extRootViewController: UIViewController? {
    return viewControllers.first
  }
  func extPopViewController(_ count: Int, _ animated: Bool) {
    let vcCount = viewControllers.count
    guard vcCount > 1 else { return }

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
