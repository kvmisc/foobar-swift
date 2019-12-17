//
//  Overlay.swift
//  Foobar
//
//  Created by Kevin Wu on 12/10/19.
//  Copyright (c) firefly.com. All rights reserved.
//

import UIKit
import PKHUD
import SwiftEntryKit

class Overlay {
  // MARK: Alert & Sheet
  static func popAlert(title: String? = nil,
                       message: String? = nil,
                       confirm: String? = "OK",
                       completion: (()->Void)? = nil)
  {
    let ac = UIAlertController(title: title, message: message, preferredStyle: .alert)
    ac.addAction(UIAlertAction(title: confirm, style: .default) { (action) in
      completion?()
    })
    MainWindow().rootViewController?.present(ac, animated: true, completion: nil)
  }
  static func popConfirm(title: String? = nil,
                         message: String? = nil,
                         cancel: String? = "Cancel",
                         confirm: String? = "Confirm",
                         completion: ((Bool)->Void)? = nil)
  {
    let ac = UIAlertController(title: title, message: message, preferredStyle: .alert)
    ac.addAction(UIAlertAction(title: cancel, style: .cancel) { (action) in
      completion?(false)
    })
    ac.addAction(UIAlertAction(title: confirm, style: .default) { (action) in
      completion?(true)
    })
    MainWindow().rootViewController?.present(ac, animated: true, completion: nil)
  }
  static func popInput(title: String? = nil,
                       message: String? = nil,
                       text: String? = nil,
                       cancel: String? = "Cancel",
                       confirm: String? = "Confirm",
                       completion: ((Bool,String)->Void)? = nil)
  {
    let ac = UIAlertController(title: title, message: message, preferredStyle: .alert)
    ac.addTextField { (tf) in tf.text = text }
    ac.addAction(UIAlertAction(title: cancel, style: .cancel) { [weak ac](action) in
      completion?(false, ac?.textFields?[0].text ?? "")
    })
    ac.addAction(UIAlertAction(title: confirm, style: .default) { [weak ac](action) in
      completion?(true, ac?.textFields?[0].text ?? "")
    })
    MainWindow().rootViewController?.present(ac, animated: true, completion: nil)
  }
  static func popOptions(title: String? = nil,
                         message: String? = nil,
                         options: [String] = [],
                         cancel: String? = "Cancel",
                         completion: ((Int,String)->Void)? = nil)
  {
    let ac = UIAlertController(title: title, message: message, preferredStyle: .actionSheet)
    for (index, option) in options.enumerated() {
      ac.addAction(UIAlertAction(title: option, style: .default) { (action) in
        completion?(index, option)
      })
    }
    ac.addAction(UIAlertAction(title: cancel, style: .cancel) { (action) in
      completion?(-1, "")
    })
    MainWindow().rootViewController?.present(ac, animated: true, completion: nil)
  }

  // MARK: HUD
  static func hudActivity(_ view: UIView? = nil) {
    PKHUD.sharedHUD.hide(false)
    PKHUD.sharedHUD.contentView = PKHUDSystemActivityIndicatorView()
    //PKHUD.sharedHUD.dimsBackground = false
    //PKHUD.sharedHUD.userInteractionOnUnderlyingViewsEnabled = false
    PKHUD.sharedHUD.show(onView: view ?? MainWindow())
  }
  static func hudInfo(_ view: UIView? = nil, info: String, completion: (()->Void)? = nil) {
    PKHUD.sharedHUD.hide(false)
    PKHUD.sharedHUD.contentView = PKHUDTextView(text: info)
    //PKHUD.sharedHUD.dimsBackground = false
    //PKHUD.sharedHUD.userInteractionOnUnderlyingViewsEnabled = false
    PKHUD.sharedHUD.show(onView: view ?? MainWindow())
    PKHUD.sharedHUD.hide(afterDelay: 3.0) { success in completion?() }
  }
  static func hudHide(_ animated: Bool = false) {
    PKHUD.sharedHUD.hide(animated)
  }

  // MARK: Drop
  // 显示在屏幕顶部(MainWindow), 点周围有效果, 点击/时间到消失
  // 后来的会隐藏前面的
  // clicked 和 dismissed 不会周时被调用, 因为点击里面已经知道隐藏了
  static func dropSuccess(_ info: String, clicked: DropAction? = nil, dismissed: DropAction? = nil) {
    Drop.down(info, state: .success, duration: 3.0, action: clicked, completion: dismissed)
  }
  static func dropFailure(_ info: String, clicked: DropAction? = nil, dismissed: DropAction? = nil) {
    Drop.down(info, state: .error, duration: 3.0, action: clicked, completion: dismissed)
  }
  static func dropWarning(_ info: String, clicked: DropAction? = nil, dismissed: DropAction? = nil) {
    Drop.down(info, state: .warning, duration: 3.0, action: clicked, completion: dismissed)
  }
  static func dropMessage(_ info: String, clicked: DropAction? = nil, dismissed: DropAction? = nil) {
    Drop.down(info, state: .info, duration: 3.0, action: clicked, completion: dismissed)
  }
  static func dropHide() {
    Drop.upAll()
  }

  // MARK: Entry
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
}
