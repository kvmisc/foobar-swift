//
//  URLNavigation.swift
//  Foobar
//
//  Created by Kevin Wu on 1/20/20.
//  Copyright (c) firefly.com. All rights reserved.
//

import UIKit
import URLNavigator

class URLNavigation {

  static let shared = URLNavigation()

  private let navigator = Navigator()

  static func setup() {
    URLNavigation.shared.navigator.register("") { url, values, context in
      guard let username = values["username"] as? String else { return nil }
      return UIViewController()
    }

    URLNavigation.shared.navigator.handle("navigator://alert") { (url, values, context) -> Bool in
      let title = url.queryParameters["title"]
      let message = url.queryParameters["message"]
      print("alert: \(title) | \(message)")
      return true
    }
  }

  func alert(_ title: String, _ message: String) {
    let url = "navigator://alert?title=\(title)&message=\(message)"
    navigator.open(url)
  }

}
