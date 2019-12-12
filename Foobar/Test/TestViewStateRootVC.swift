//
//  TestViewStateRootVC.swift
//  Foobar
//
//  Created by Kevin Wu on 12/11/19.
//  Copyright (c) firefly.com. All rights reserved.
//

import UIKit

class TestViewStateRootVC: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .red

    view.addSubview(bt)
    bt.snp.makeConstraints { (make) in
      make.center.equalToSuperview()
    }

    bt.extCenterHorizontally(6)
    //bt.extCenterHorizontally(6, true)
    bt.extCenterVertically(6.0)
    bt.extExpand(10, 10, 10, 10)
  }

  let bt: UIButton = {
    let ret = UIButton(type: .custom)
    ret.extSetImage(cci("settings"))
    ret.extSetTitle("asdf")
    ret.extSetBorder()
    ret.imageView?.extSetBorder(width: 1.0, color: .darkGray)
    ret.titleLabel?.extSetBorder(width: 1.0, color: .darkGray)
    return ret
  }()

//  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//    let vc = TestViewStateVC()
//    self.navigationController?.pushViewController(vc, animated: true)
//  }
}
