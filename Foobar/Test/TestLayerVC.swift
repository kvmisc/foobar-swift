//
//  TestLayerVC.swift
//  Foobar
//
//  Created by Kevin Wu on 1/8/20.
//  Copyright (c) firefly.com. All rights reserved.
//

import UIKit

class TestLayerVC: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()

    view.backgroundColor = .white
    print("doit")

//    let contentView = UIImageView(image: cci("grass"))
//    contentView.contentMode = .scaleToFill
//    contentView.frame = ccr(100, 100, 100, 40)
//    view.addSubview(contentView)
//
//    // 四角全圆
//    contentView.extSetCorner(radius: 10.0)
//    contentView.extSetBorder(width: 2.0, color: .red)
//
//    // 部分圆角
//    contentView.extMaskRoundedLayer(radius: 10.0, corners: [.topLeft, .topRight])
//    contentView.extAddRoundedLayer(radius: 10.0,
//                                   corners: [.topLeft, .topRight],
//                                   borderWidth: 2.0,
//                                   borderColor: .red,
//                                   fillColor: .clear)

    let bt = UIButton(type: .custom)
    print("\(bt.buttonType)")
    bt.frame = ccr(100, 100, 100, 100)
    view.addSubview(bt)
    doTestMultiLineButton(bt)

  }

}
