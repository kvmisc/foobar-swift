//
//  FBRootVC.swift
//  Foobar
//
//  Created by Kevin Wu on 11/29/19.
//  Copyright (c) firefly.com. All rights reserved.
//

import UIKit
import Then

class FBRootVC: UIViewController {

  var frame = CGSize().with {
    print("ggg")
    $0.width = 10
  }

  let iv = UIView().then {
    print("ggg")
    $0.backgroundColor = .red
  }

  override func viewDidLoad() {
    super.viewDidLoad()

    self.view.backgroundColor = .lightGray

    frame.do {
      $0.equalTo(CGSize.zero)
    }
    print(frame)

//    let iv = UIView().then {
//      print("ggg")
//      $0.backgroundColor = .red
//    }
    print(iv)

    let gv = FBGreenView.loadFromNib()
    //let gv = FBGreenView.extLoadFromNib() as! FBGreenView
    self.view.addSubview(gv)
    gv.frame = CGRect(x: 10, y: 100, width: 300, height: 500)
  }
}
