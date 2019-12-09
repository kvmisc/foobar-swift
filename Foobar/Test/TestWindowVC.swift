//
//  TestWindowVC.swift
//  Foobar
//
//  Created by Kevin Wu on 12/10/19.
//  Copyright (c) firefly.com. All rights reserved.
//

import UIKit
import Async

class TestWindowVC: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()

    let bt = UIButton(type: .system)
    bt.frame = ccr(50, 50, 100, 100)
    view.addSubview(bt)
    bt.extAddTarget(self, #selector(showAction(_:)))
    bt.extSetBorder()

    let tf = UITextField()
    tf.frame = ccr(50, 160, 100, 50)
    view.addSubview(tf)

    print("\(UIWindow.Level.normal) \(UIWindow.Level.statusBar) \(UIWindow.Level.alert)")

    Async.main(after: 5.0) {
      self.printWindows()
    }
  }

  func printWindows() {
    for window in UIApplication.shared.windows {
      print("\(window) \(window.isHidden) \(window.alpha) \(window.isKeyWindow) \(window.windowLevel)")
    }
    print(" ")
    print(" ")
    print(" ")

    Async.main(after: 5.0) {
      self.printWindows()
    }
  }

  lazy var window = UIWindow(frame: UIScreen.main.bounds)

  @objc func showAction(_ sender: UIButton) {
    print("do show")
    //let wnd = UIWindow(frame: UIScreen.main.bounds)
    window.windowLevel = .alert + 10
    window.backgroundColor = .clear
    window.makeKeyAndVisible()
  }

}
