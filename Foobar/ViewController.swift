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

//      v.extSetShadowColor(opacity: 0.1, radius: 4)
//      v.extSetRoundedCorner(20)

//      var l = CALayer()
//      v.layer.addSublayer(l)
//      l.backgroundColor = UIColor.purple.cgColor
//      l.frame = CGRect(x: 50, y: 50, width: 25, height: 25)
//      l.name = "aa"
//
//      l = CALayer()
//      v.layer.addSublayer(l)
//      l.backgroundColor = UIColor.brown.cgColor
//      l.frame = CGRect(x: 100, y: 100, width: 25, height: 25)
//      l.name = "bb"

//      var r = v.layer.extSublayerNamed("asdf")
//      print("\(r)")


//      let gradient = CAGradientLayer()
//      gradient.colors = [UIColor.red.cgColor,
//                         UIColor.green.cgColor,
//                         UIColor.blue.cgColor]
//      gradient.locations = [0, 0.5, 1]
//      gradient.startPoint = CGPoint(x: 0.5, y: 0)
//      gradient.endPoint = CGPoint(x: 0.5, y: 1)
//      gradient.frame = v.bounds
//      gradient.type = .axial
//      v.layer.addSublayer(gradient)

      v.extSetShadowColor(opacity: 1.0, radius: 4)
      v.extSetRoundedCorner(20)

      let gradient = CAGradientLayer()
      gradient.colors = [UIColor(red: 0.64, green: 0.29, blue: 0.93, alpha: 1).cgColor, UIColor(red: 0.65, green: 0.29, blue: 0.93, alpha: 1).cgColor, UIColor(red: 0.83, green: 0.27, blue: 0.87, alpha: 1).cgColor]
      gradient.locations = [0, 0, 1]
      gradient.frame = v.bounds
      gradient.startPoint = CGPoint(x: 0, y: 0.5)
      gradient.endPoint = CGPoint(x: 1, y: 1)
//      roundedLayer.addSublayer(gradient)
      v.extSetGradientLayer(gradient)
    }

  }


}

