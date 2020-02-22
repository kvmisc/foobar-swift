//
//  Core.swift
//  Foobar
//
//  Created by Kevin Wu on 12/9/19.
//  Copyright (c) firefly.com. All rights reserved.
//

import UIKit

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

func RandomString(_ length: Int) -> String {
  guard length > 0 else { return "" }
  var ret = ""
  let base = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
  for _ in 1...length {
    ret.append(base.randomElement()!)
  }
  return ret
}


#if DEBUG
// Print object as json via lldb
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
#endif
