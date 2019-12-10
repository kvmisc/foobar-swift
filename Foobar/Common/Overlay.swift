//
//  Overlay.swift
//  Foobar
//
//  Created by Kevin Wu on 12/10/19.
//  Copyright (c) firefly.com. All rights reserved.
//

import UIKit
import MBProgressHUD
import SwiftEntryKit

class Overlay {
  static func hudActivity(view: UIView? = nil, info: String? = nil) {
    hudHide(view: view, animated: false)

    let inView = view ?? MainWindow()
    let hud = MBProgressHUD(view: inView)

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

    inView.addSubview(hud)
    hud.show(animated: true)
  }
  static func hudMessage(view: UIView? = nil, info: String, completion: (()->Void)? = nil) {
    hudHide(view: view, animated: false)

    let inView = view ?? MainWindow()
    let hud = MBProgressHUD(view: inView)

    hud.mode = .text
    hud.removeFromSuperViewOnHide = true
    hud.isSquare = false
    hud.contentColor = nil

    hud.margin = 10.0

    hud.bezelView.layer.cornerRadius = 5.0
    hud.bezelView.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.8)

    hud.label.font = UIFont.systemFont(ofSize: 14.0)
    hud.label.textColor = .white
    hud.label.text = info

    hud.completionBlock = completion

    inView.addSubview(hud)
    hud.show(animated: true)
    hud.hide(animated: true, afterDelay: 2.0)
  }
  static func hudHide(view: UIView? = nil, animated: Bool = false) {
    MBProgressHUD(for: MainWindow())?.hide(animated: animated)
    if let inView = view {
      MBProgressHUD(for: inView)?.hide(animated: animated)
    }
  }

  // 显示在屏幕中间, 点周围无效果 且 视图不消失, 选择后手动消失
  // 后来的会隐藏前面的
  static func entryAlert(_ view: UIView, width: EKAttributes.PositionConstraints.Edge = .intrinsic) {
    var attributes = EKAttributes()
    //attributes.windowLevel = .statusBar
    attributes.position = .center
    //attributes.precedence = .override(priority: .normal, dropEnqueuedEntries: false)
    attributes.displayDuration = .infinity
    attributes.positionConstraints.size = .init(width: width, height: .intrinsic)
    attributes.screenInteraction = .absorbTouches
    attributes.entryInteraction = .absorbTouches
    attributes.scroll = .disabled
    //attributes.hapticFeedbackType = .none
    //attributes.displayMode = .inferred
    //attributes.entryBackground = .clear
    //attributes.screenBackground = .clear
    //attributes.shadow = .none
    //attributes.roundCorners = .none
    //attributes.border = .none
    //attributes.statusBar = .inferred
    attributes.entranceAnimation = .init(translate: .init(duration: 0.25, spring: .init(damping: 1, initialVelocity: 0)))
    attributes.exitAnimation = .init(translate: .init(duration: 0.25, spring: .init(damping: 1, initialVelocity: 0)))
    //attributes.popBehavior = .overridden

    SwiftEntryKit.display(entry: view, using: attributes, presentInsideKeyWindow: true, rollbackWindow: .main)
  }
  // 显示在屏幕下边, 点周围无效果 但 视图消失, 选择后手动消失
  // 后来的会隐藏前面的
  static func entrySheet(_ view: UIView,
                         width: EKAttributes.PositionConstraints.Edge = .ratio(value: 1.0),
                         offset: CGFloat = 0.0)
  {
    HideKeyboard()

    var attributes = EKAttributes()
    //attributes.windowLevel = .statusBar
    attributes.position = .bottom
    //attributes.precedence = .override(priority: .normal, dropEnqueuedEntries: false)
    attributes.displayDuration = .infinity
    attributes.positionConstraints.size = .init(width: width, height: .intrinsic)
    attributes.positionConstraints.verticalOffset = offset
    attributes.screenInteraction = .dismiss
    attributes.entryInteraction = .absorbTouches
    attributes.scroll = .disabled
    //attributes.hapticFeedbackType = .none
    //attributes.displayMode = .inferred
    //attributes.entryBackground = .clear
    //attributes.screenBackground = .clear
    //attributes.shadow = .none
    //attributes.roundCorners = .none
    //attributes.border = .none
    //attributes.statusBar = .inferred
    attributes.entranceAnimation = .init(translate: .init(duration: 0.25, spring: .init(damping: 1, initialVelocity: 0)))
    attributes.exitAnimation = .init(translate: .init(duration: 0.25, spring: .init(damping: 1, initialVelocity: 0)))
    //attributes.popBehavior = .overridden

    SwiftEntryKit.display(entry: view, using: attributes, presentInsideKeyWindow: false, rollbackWindow: .main)
  }
  static func entryHide(_ completion: SwiftEntryKit.DismissCompletionHandler? = nil) {
    SwiftEntryKit.dismiss(.all, with: completion)
  }


  // 显示在屏幕顶部(MainWindow), 点周围有效果, 点击/时间到消失
  // 后来的会隐藏前面的
  static func dropSuccess(_ info: String, _ action: DropAction? = nil) {
    Drop.down(info, state: .success, duration: 5.0, action: action)
  }
  static func dropFailure(_ info: String, _ action: DropAction? = nil) {
    Drop.down(info, state: .error, duration: 3.0, action: action)
  }
  static func dropWarning(_ info: String, _ action: DropAction? = nil) {
    Drop.down(info, state: .warning, duration: 3.0, action: action)
  }
  static func dropMessage(_ info: String, _ action: DropAction? = nil) {
    Drop.down(info, state: .info, duration: 3.0, action: action)
  }
  static func dropHide() {
    Drop.upAll()
  }
}
