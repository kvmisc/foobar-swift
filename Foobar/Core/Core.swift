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

func MainWindow() -> UIWindow {
  return ((UIApplication.shared.delegate as? AppDelegate)?.window)!
}
func TopmostWindow() -> UIWindow {
  for window in UIApplication.shared.windows.reversed() {
    if !window.isHidden && window.alpha>0.0 {
      return window
    }
  }
  // Should not be here
  return UIWindow()
}

func TopmostViewController() -> UIViewController {
  if let vc = FindTopmostViewController(MainWindow().rootViewController) {
    return vc
  }
  // Should not be here
  return UIViewController()
}
private func FindTopmostViewController(_ vc: UIViewController?) -> UIViewController? {
  if let nav = vc as? UINavigationController {
    return FindTopmostViewController(nav.topViewController)
  } else if let tab = vc as? UITabBarController, let selected = tab.selectedViewController {
    return FindTopmostViewController(selected)
  } else if let split = vc as? UISplitViewController, let detail = split.viewControllers.last {
    return FindTopmostViewController(detail)
  } else if let presented = vc?.presentedViewController {
    return FindTopmostViewController(presented)
  }
  return vc
}

func HideKeyboard() {
  for window in UIApplication.shared.windows {
    window.endEditing(true)
  }
}

// po pnt(xxx)
func pnt(_ object: Any) {
  do {
    let data = try JSONSerialization.data(withJSONObject: object, options: .prettyPrinted)
    let string = String(data: data, encoding: .utf8)
    print(string ?? "[pnt] json empty")
  } catch {
    print("[pnt] json failed")
  }
}
