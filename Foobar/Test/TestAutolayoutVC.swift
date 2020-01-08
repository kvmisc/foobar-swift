//
//  TestAutolayoutVC.swift
//  Foobar
//
//  Created by Kevin Wu on 12/17/19.
//  Copyright (c) firefly.com. All rights reserved.
//

import UIKit
import Async

class TestAutolayoutVC: UIViewController {

  let redView: UIView = {
    let ret = UIView()
    ret.backgroundColor = .red
    return ret
  }()

  let greenView: UIView = {
    let ret = UIView()
    ret.backgroundColor = .green
    return ret
  }()

  override func viewDidLoad() {
    super.viewDidLoad()

    view.backgroundColor = .white

//    print(Unmanaged.passUnretained(view).toOpaque())
//    print(Unmanaged.passUnretained(redView).toOpaque())
//    print(Unmanaged.passUnretained(greenView).toOpaque())

    view.addSubview(redView)
    redView.translatesAutoresizingMaskIntoConstraints = false
    print("1: \(self.redView.constraints)")
    let top1 = NSLayoutConstraint(item: redView, attribute: .top, relatedBy: .equal, toItem: view, attribute: .top, multiplier: 1.0, constant: 50)
    top1.isActive = true
    let left1 = NSLayoutConstraint(item: redView, attribute: .left, relatedBy: .equal, toItem: view, attribute: .left, multiplier: 1.0, constant: 50)
    left1.isActive = true
    let width1 = NSLayoutConstraint(item: redView, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 200)
    width1.isActive = true
    let height1 = NSLayoutConstraint(item: redView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 300)
    height1.isActive = true

//    redView.snp.makeConstraints { (make) in
//      make.top.equalToSuperview().offset(50)
//      make.left.equalToSuperview().offset(50)
//      make.bottom.equalToSuperview().offset(-50)
//      make.right.equalToSuperview().offset(-50)
//    }
    print("2: \(self.redView.constraints)")

    greenView.translatesAutoresizingMaskIntoConstraints = false
    redView.addSubview(greenView)
    let top2 = NSLayoutConstraint(item: greenView, attribute: .top, relatedBy: .equal, toItem: redView, attribute: .top, multiplier: 1.0, constant: 50)
    top2.isActive = true
    let left2 = NSLayoutConstraint(item: greenView, attribute: .left, relatedBy: .equal, toItem: redView, attribute: .left, multiplier: 1.0, constant: 50)
    left2.isActive = true
    let width2 = NSLayoutConstraint(item: greenView, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 50)
    width2.isActive = true
    let height2 = NSLayoutConstraint(item: greenView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 50)
    height2.isActive = true
    print("3: \(self.greenView.constraints)")

    Async.main(after: 3.0) {
      print("4: \(self.redView.constraints)")
      print("5: \(self.greenView.constraints)")
      //self.log(self.redView.constraints)
    }


    let rv = EXRedView()
    rv.backgroundColor = .brown
    view.addSubview(rv)
    rv.snp.makeConstraints { (make) in
      make.center.equalToSuperview()
    }

  }

  func log(_ list: [NSLayoutConstraint]) {
    for c in list {
      print(String(describing: type(of: c)))
      if c.firstItem != nil {
        print("first")
        print(Unmanaged.passUnretained(c.firstItem!).toOpaque())
      }
      if c.secondItem != nil {
        print("second")
        print(Unmanaged.passUnretained(c.secondItem!).toOpaque())
      }
      print("==========")
//      let className = String(describing: type(of: c))
//      let second = Unmanaged.passUnretained(c.secondItem!).toOpaque()
//      print("\(className) \(first) \(second)")
    }
  }

}

class EXRedView: UIView {
  override var intrinsicContentSize: CGSize {
    return ccs(100)
  }
}
