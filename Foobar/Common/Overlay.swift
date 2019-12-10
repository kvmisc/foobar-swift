//
//  Overlay.swift
//  Foobar
//
//  Created by Kevin Wu on 12/10/19.
//  Copyright (c) firefly.com. All rights reserved.
//

import UIKit

class Overlay {
  static let shared = Overlay()

  // 显示在屏幕中间, 点周围无效果, 选择后手动消失
  // 后来的显示在上面
  func showAlert() {
  }

  // 显示在屏幕下边, 点周围无效果/消失, 选择后手动消失
  // 后来的显示在上面
  func showSheet() {
  }

  // 显示在屏幕顶部, 点周围有效果, 点击/时间到消失
  // 后来的会隐藏前面的
  func showSuccess(_ info: String, _ action: DropAction? = nil) {
    Drop.down(info, state: .success, duration: 3.0, action: action)
  }
  func showFailure(_ info: String, _ action: DropAction? = nil) {
    Drop.down(info, state: .error, duration: 3.0, action: action)
  }
  func showWarning(_ info: String, _ action: DropAction? = nil) {
    Drop.down(info, state: .warning, duration: 3.0, action: action)
  }
  func showMessage(_ info: String, _ action: DropAction? = nil) {
    Drop.down(info, state: .info, duration: 3.0, action: action)
  }
  func hideAllDrops() {
    Drop.upAll()
  }

}
