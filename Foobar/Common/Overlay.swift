//
//  Overlay.swift
//  Foobar
//
//  Created by Kevin Wu on 12/10/19.
//  Copyright (c) firefly.com. All rights reserved.
//

import UIKit
import SwiftEntryKit

class Overlay {
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
  static func entryHide() {
    SwiftEntryKit.dismiss()
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
