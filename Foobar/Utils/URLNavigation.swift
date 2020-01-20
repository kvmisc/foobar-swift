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

  static let navigator = Navigator()

  static func setup() {
    URLNavigation.navigator.register("theapp://info") { url, values, context in
      let vc = TestNavSubVC()
      vc.should = context as? Bool ?? false
      return vc
    }

    URLNavigation.navigator.handle("theapp://alert") { (url, values, context) -> Bool in
      let title = url.queryParameters["title"]
      let message = url.queryParameters["message"]
      print("alert: \(title) | \(message)")
      return true
    }
  }




  static func alert(_ title: String, _ message: String) {
    let url = "theapp://alert?title=\(title)&message=\(message)"
    navigator.open(url)
  }

  static func info(_ aa: String, _ bb: String) {
    let url = "theapp://info?aa=\(aa)&bb=\(bb)"
    navigator.push(url)
    //navigator.present(url, wrap: UINavigationController.self)
    //navigator.present(url, context: true)
  }

}
