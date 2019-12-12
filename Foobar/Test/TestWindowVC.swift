//
//  TestWindowVC.swift
//  Foobar
//
//  Created by Kevin Wu on 12/10/19.
//  Copyright (c) firefly.com. All rights reserved.
//

import UIKit
import Async
import TextAttributes
import YYText
import YYCache

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
  @IBOutlet weak var textLabel: UILabel!


  enum xxx {
    case main, userInteractive, userInitiated, utility, background, custom(queue: DispatchQueue)

    var queue: DispatchQueue {
      switch self {
      case .main: return .main
      case .userInteractive: return .global(qos: .userInteractive)
      case .userInitiated: return .global(qos: .userInitiated)
      case .utility: return .global(qos: .utility)
      case .background: return .global(qos: .background)
      case .custom(let queue): return queue
      }
    }
  }

  override func viewDidLoad() {
    super.viewDidLoad()

//    Async.main(after: 1) {
//      print("xxx")
//    }

//    let queue = DispatchQueue(label: "foo", attributes: .concurrent)

//    print("to do")
//    DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
//      print("haha")
//    }
//    DispatchQueue.main.asyncAfter(wallDeadline: .now() + 2.0) {
//      print("haha")
//    }

    Async.main { () -> Int in
      return 0
    }
    Async.main {
      print("xx")
    }
    Async.main(after: 2) { () -> String in
      return ""
    }
    Async.main(after: 2) {
      print("asfd")
    }


    let cache = YYDiskCache(path: Path.document("asdf.ch"))
    let obj = cache?.object(forKey: "kk") as? TestCodingObject ?? TestCodingObject()

    print("\(obj.name) \(obj.age)")

//    let obj = TestCodingObject()
//    obj.name = "Kevin"
//    obj.age = 17
//    print("\(obj.name) \(obj.age)")
//    cache?.setObject(obj, forKey: "kk")


//    view.addSubview(tf)
//    view.addSubview(bt)

    let sz = CGSize(width: 2.5, height: 5.1)
    print(ceil(sz))

    let ta = TextAttributes()
      .font(ccf(15.0))
      .lineBreakMode(.byWordWrapping)
      .lineSpacing(ccf(15).extLineSpacing())

    let str = "This worked for me. First open the simulator and select a device that works in Hardware Device. Then select Manage Devices and delete the ones that aren't working. Add the same devices you deleted and they should be working"

    textLabel.numberOfLines = 2
    textLabel.attributedText = NSAttributedString(string: str, attributes: ta)

//    textLabel.text = str
//    textLabel.numberOfLines = 2
//    textLabel.lineBreakMode = .byTruncatingTail
    textLabel.backgroundColor = .lightGray

    var dict: [NSAttributedString.Key:Any] = [:]
    dict[.font] = ccf(15)

    let paragraph = NSMutableParagraphStyle()
    paragraph.lineBreakMode = .byTruncatingTail
    paragraph.lineSpacing = ccf(15).extLineSpacing()
    dict[.paragraphStyle] = paragraph

//    NSMutableParagraphStyle *paragraph = [[NSMutableParagraphStyle alloc] init];
//    paragraph.lineBreakMode = lineBreakMode;
//    paragraph.lineSpacing = lineSpacing;
//    [attributes setObject:paragraph forKey:NSParagraphStyleAttributeName];

    print("str".extSizeWith(ta.dictionary, 200))
    print("jfJFG".extSizeWith(ccf(15)))



    //self.printWindows()

//    Async.main(after: 1.0) {
//      self.printWindows()
//    }

//    Async.main(after: 3.0) {
//      print("show entry")
//      let v = TestEntryView()
//      //Overlay.shared.showAlert(v, width: .ratio(value: 0.8))
//      Overlay.shared.showSheet(v, width: .ratio(value: 0.9))
//    }

//    Async.main(after: 4.0) {
//      print("show entry")
//      let v = TestEntryView()
//      v.backgroundColor = .green
//      Overlay.shared.showAlert(v)
//    }

//    view.addSubview(bigBt)
//    view.addSubview(throughView)

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


    //Overlay.shared.showAlert(v, width: .ratio(value: 0.8))
    //Overlay.entrySheet(v)
//    Overlay.entryAlert(v)
//    Async.main(after: 2.0) {
//      Overlay.entryHide { print("did hide") }
//    }
//    Overlay.entryHide { print("did hide") }

//    Overlay.dropSuccess("asdf")

//    Overlay.popAlert(title: "ttl", message: "msg", confirm: "xxx") {
//      print("got it")
//    }
//    Overlay.popConfirm(title: "ttl", message: "msg") { (result) in
//      print(result)
//    }
//    Overlay.popInput(title: "ttl", message: "msg", text: "adsf") { (result, text) in
//      print("\(result) H\(text)H")
//    }
    Overlay.popOptions(title: "ttl", message: "msg", options: ["AA","BB"]) { (index, option) in
      print("\(index) H\(option)H")
    }

    Async.main(after: 3.0) {
      let v = TestEntryView()
      Overlay.entrySheet(v)
    }

//    Overlay.hudActivity()
//    Overlay.hudActivity(view: nil, info: nil)
//    Overlay.hudActivity(view: nil, info: "加载中...")

//    Async.main(after: 4.0) {
//      print("resign")
//      Overlay.hudHide()
////      Overlay.hudHide(view: nil, animated: true)
////      Overlay.hudMessage(view: nil, info: "suc") {
////        print("did hide hud")
////      }
//    }

    return

//    print("do show")
//    //let wnd = UIWindow(frame: UIScreen.main.bounds)
//    window.windowLevel = .alert + 10
//    window.backgroundColor = .lightGray
//    window.isHidden = false
//    window.alpha = 1.0
//
//    //UIApplication.shared.windows.last?.addSubview(self.lb)
//    //window.makeKeyAndVisible()
//    //window.makeKeyAndVisible()
//
//    Async.main(after: 2.0) {
//      print("resign")
//      UIApplication.shared.windows.forEach { (wnd) in
//        wnd.endEditing(true)
//      }
////      UIApplication.shared.windows.last?.addSubview(self.lb)
////      print("show label")
//    }

//    Async.main(after: 4.0) {
//      print("resign")
//      self.tf.resignFirstResponder()
//    }
  }

}
