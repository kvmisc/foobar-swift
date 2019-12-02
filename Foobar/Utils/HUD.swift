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

  typealias CompletionHandler = () -> Void

  static func showActivity(inView: UIView, info: String? = nil) {
    MBProgressHUD(for: inView)?.hide(animated: false)

    let hud = MBProgressHUD(view: inView)

    hud.mode = .customView
    hud.removeFromSuperViewOnHide = true
    hud.isSquare = true
    hud.contentColor = nil

    hud.margin = 15.0

    //hud.bezelView.layer.cornerRadius = 0.0
    hud.bezelView.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.8)

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

    inView.addSubview(hud)
    hud.show(animated: true)
  }

  static func showInfo(inView: UIView, info: String, completion: CompletionHandler? = nil) {
    MBProgressHUD(for: inView)?.hide(animated: false)

    let hud = MBProgressHUD(view: inView)

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

    inView.addSubview(hud)
    hud.show(animated: true)
    hud.hide(animated: true, afterDelay: 2.0)
  }

  static func hide(inView: UIView, animated: Bool = false) {
    let hud = MBProgressHUD(for: inView)
    hud?.hide(animated: animated)
  }
}
