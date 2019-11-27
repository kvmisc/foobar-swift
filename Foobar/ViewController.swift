//
//  ViewController.swift
//  Foobar
//
//  Created by Kevin Wu on 11/27/19.
//  Copyright (c) firefly.com. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()

    UIImage(named: "fals")
    
    let tv = FBTestView.extLoadFromNib()
    if let v = tv as? FBTestView {
      v.doit()
      view.addSubview(v)
      v.frame = CGRect(x: 50, y: 50, width: 300, height: 500)

      v.extSetShadowColor(opacity: 0.1, radius: 4)
      v.extSetRoundedCorner(20)

      var l = CALayer()
      v.layer.addSublayer(l)
      l.backgroundColor = UIColor.purple.cgColor
      l.frame = CGRect(x: 50, y: 50, width: 20, height: 20)
      l.name = "aa"

      l = CALayer()
      v.layer.addSublayer(l)
      l.backgroundColor = UIColor.brown.cgColor
      l.frame = CGRect(x: 100, y: 100, width: 20, height: 20)
      l.name = "bb"

      var r = v.layer.extSublayerNamed("asdf")
      print("\(r)")
    }

  }


}

