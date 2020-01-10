//
//  ThirdMedia.swift
//  Foobar
//
//  Created by Kevin Wu on 1/10/20.
//  Copyright (c) firefly.com. All rights reserved.
//

import UIKit
import MonkeyKing

class ThirdMedia: UIView {

  static let shared = ThirdMedia()

  static func setup() {
    let wechat = MonkeyKing.Account.weChat(appID: "wx006e361d6d59ce44",
                                           appKey: "2d148528ba1596005c7619a550f552f4",
                                           miniAppID: nil)
    MonkeyKing.registerAccount(wechat)
  }

  static func parseURL(_ url: URL) -> Bool {
    return MonkeyKing.handleOpenURL(url)
  }
}

extension ThirdMedia {
  // LSApplicationQueriesSchemes
  //   weixin

  func wechatSession(_ text: String, _ completion: @escaping ((Bool)->Void)) {
    let info = MonkeyKing.Info(title: text,
                               description: nil,
                               thumbnail: nil,
                               media: nil)
    let message = MonkeyKing.Message.weChat(.session(info: info))
    MonkeyKing.deliver(message) { result in
      switch result {
      case .success:
        completion(true)
      case .failure:
        completion(false)
      }
    }
  }
}
