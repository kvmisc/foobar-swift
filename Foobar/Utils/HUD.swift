//
//  HUD.swift
//  Foobar
//
//  Created by Kevin Wu on 12/2/19.
//  Copyright (c) firefly.com. All rights reserved.
//

import UIKit
import MBProgressHUD

class HUD: NSObject {

  static weak var window: UIWindow? = nil

  static func showActivity(inView: UIView? = nil, info: String? = nil) {

    var view: UIView? = nil

    if let inView = inView {
      view = inView
    } else {
      if let oldWindow = window {
        MBProgressHUD(for: oldWindow)?.hide(animated: false)
      }
      window = topmostWindow()
      view = window
    }

    guard let containerView = view else { return }


    MBProgressHUD(for: containerView)?.hide(animated: false)

    let hud = MBProgressHUD(view: containerView)

    hud.mode = .customView
    hud.removeFromSuperViewOnHide = true
    hud.isSquare = true
    hud.contentColor = nil

    hud.margin = 15.0

    //hud.bezelView.layer.cornerRadius = 0.0
    hud.bezelView.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1.0)

    if #available(iOS 13, *) {
      let aiv = UIActivityIndicatorView(style: .large)
      aiv.color = .white
      aiv.hidesWhenStopped = false
      aiv.startAnimating()
      hud.customView = aiv
    } else {
      let aiv = UIActivityIndicatorView(style: .whiteLarge)
      aiv.hidesWhenStopped = false
      aiv.startAnimating()
      hud.customView = aiv
    }

    hud.label.font = UIFont.systemFont(ofSize: 14.0)
    hud.label.textColor = .white
    hud.label.text = info

    containerView.addSubview(hud)
    hud.show(animated: true)
  }

  static func showInfo(inView: UIView? = nil, info: String, completion: (()->Void)? = nil) {

    var view: UIView? = nil

    if let inView = inView {
      view = inView
    } else {
      if let oldWindow = window {
        MBProgressHUD(for: oldWindow)?.hide(animated: false)
      }
      window = topmostWindow()
      view = window
    }

    guard let containerView = view else { return }


    MBProgressHUD(for: containerView)?.hide(animated: false)

    let hud = MBProgressHUD(view: containerView)

    hud.mode = .text
    hud.removeFromSuperViewOnHide = true
    hud.isSquare = false
    hud.contentColor = nil

    hud.margin = 15.0

    hud.bezelView.layer.cornerRadius = 0.0
    hud.bezelView.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.8)

    hud.label.font = UIFont.systemFont(ofSize: 14.0)
    hud.label.textColor = .white
    hud.label.text = info

    hud.completionBlock = completion

    containerView.addSubview(hud)
    hud.show(animated: true)
    hud.hide(animated: true, afterDelay: 2.0)
  }

  static func hide(inView: UIView? = nil, animated: Bool = false) {
    if let inView = inView {
      MBProgressHUD(for: inView)?.hide(animated: animated)
    } else {
      if let oldWindow = window {
        MBProgressHUD(for: oldWindow)?.hide(animated: false)
      }
    }
  }

  fileprivate static func topmostWindow() -> UIWindow? {
    for window in UIApplication.shared.windows.reversed() {
      if !(window.isHidden) && (window.alpha>0.0) {
        return window
      }
    }
    return nil
  }
}
