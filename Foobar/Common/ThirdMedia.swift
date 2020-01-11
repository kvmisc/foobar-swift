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

  static func setup() {
    // LSApplicationQueriesSchemes
    //   weixin
    // URL Types
    //   wx006e361d6d59ce44
    let wechat = MonkeyKing.Account.weChat(appID: "wx006e361d6d59ce44",
                                           appKey: "2d148528ba1596005c7619a550f552f4",
                                           miniAppID: nil)
    MonkeyKing.registerAccount(wechat)
  }

  static func parseURL(_ url: URL) -> Bool {
    return MonkeyKing.handleOpenURL(url)
  }
}
