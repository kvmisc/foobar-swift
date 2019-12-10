//
//  Core.swift
//  Foobar
//
//  Created by Kevin Wu on 12/9/19.
//  Copyright (c) firefly.com. All rights reserved.
//

import UIKit

// "\n", "\r", "\r\n" 来断行时，行为不确定
// Unicode 定义了两个明确的字符来断行和分段, NSAttributedString 中用断行符不会产生段落
let LINE_SEPARATOR      = "\u{2028}"
let PARAGRAPH_SEPARATOR = "\u{2029}"

func TopmostWindow() -> UIWindow {
  for window in UIApplication.shared.windows.reversed() {
    if !(window.isHidden) && (window.alpha>0.0) {
      return window
    }
  }
  // Should not be here
  return UIWindow()
}
func MainWindow() -> UIWindow {
  return (UIApplication.shared.delegate as! AppDelegate).window!
}

//func TopmostViewController() -> UIViewController {
//  return TopViewController(UIApplication.shared.keyWindow?.rootViewController)
//}
func TopViewController(_ controller: UIViewController?) -> UIViewController? {
  if let nav = controller as? UINavigationController {
    return TopViewController(nav.topViewController)
  } else if let tab = controller as? UITabBarController, let selected = tab.selectedViewController {
    return TopViewController(selected)
  } else if let split = controller as? UISplitViewController, let detail = split.viewControllers.last {
    return TopViewController(detail)
  }
  return controller
}

func HideKeyboard() {
  for window in UIApplication.shared.windows {
    window.endEditing(true)
  }
}
