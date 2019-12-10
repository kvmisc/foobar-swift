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

  let tf: UITextField = {
    let ret = UITextField()
    ret.frame = ccr(50, 160, 100, 50)
    ret.extSetBorder()
    return ret
  }()

  let bt: UIButton = {
    let ret = UIButton(type: .system)
    ret.frame = ccr(50, 50, 100, 100)
    ret.extAddTarget(self, #selector(showAction(_:)))
    ret.extSetBorder()
    return ret
  }()

  let lb: UILabel = {
    let ret = UILabel()
    ret.font = ccf(14)
    ret.text = "fasdf"
    ret.textColor = .red
    ret.frame = ccr(100, 100, 100, 100)
    ret.extSetBorder()
    return ret
  }()

  let bigBt: UIButton = {
    let ret = UIButton(type: .system)
    ret.frame = UIScreen.main.bounds
    ret.extAddTarget(self, #selector(doit(_:)))
    ret.extSetBorder(width: 2.0, color: .red)
    return ret
  }()

  let throughView: ThroughView = {
    let ret = ThroughView()
    ret.frame = UIScreen.main.bounds.inset(50, 50, 50, 50)
    ret.extSetBorder(width: 2.0, color: .green)
    ret.isUserInteractionEnabled = false
    return ret
  }()

  override func viewDidLoad() {
    super.viewDidLoad()

//    view.addSubview(tf)
//    view.addSubview(bt)

//    self.printWindows()
//
//    Async.main(after: 1.0) {
//      self.printWindows()
//    }
//
//    Async.main(after: 8.0) {
//      self.showAction(self.bt)
//    }

//    view.addSubview(bigBt)
//    view.addSubview(throughView)

    Async.main(after: 1.0) {
      print(MainWindow())
      //Overlay.shared.showSuccess("fas")
      Overlay.shared.showSuccess("123") {
        print("xxx end")
      }
//      Overlay.shared.showSuccess("suc") {
//        print("suc end")
//      }
    }
//    Async.main(after: 3.0) {
//      Overlay.shared.showFailure("fai") {
//        print("fai end")
//      }
//    }
//    Async.main(after: 5.0) {
//      Overlay.shared.showWarning("war") {
//        print("war end")
//      }
//    }
//    Async.main(after: 7.0) {
//      Overlay.shared.showMessage("msg") {
//        print("msg end")
//      }
//    }

  }

  @objc func doit(_ sender: UIButton) {
    print("doit")
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
    window.backgroundColor = .lightGray
    window.isHidden = false
    window.alpha = 1.0

    //UIApplication.shared.windows.last?.addSubview(self.lb)
    //window.makeKeyAndVisible()
    //window.makeKeyAndVisible()

    Async.main(after: 2.0) {
      print("resign")
      UIApplication.shared.windows.forEach { (wnd) in
        wnd.endEditing(true)
      }
//      UIApplication.shared.windows.last?.addSubview(self.lb)
//      print("show label")
    }

//    Async.main(after: 4.0) {
//      print("resign")
//      self.tf.resignFirstResponder()
//    }
  }

}
