//
//  FBRootVC.swift
//  Foobar
//
//  Created by Kevin Wu on 11/29/19.
//  Copyright (c) firefly.com. All rights reserved.
//

import UIKit
import SnapKit

class FBRootVC: UIViewController {

//  @IBOutlet weak var tableView: UITableView!
//  @IBOutlet weak var imageView: UIImageView!
//  @IBOutlet weak var button: UIButton!
  
  override func viewDidLoad() {
    super.viewDidLoad()

    let navbar = NavBar()
    view.addSubview(navbar)
    navbar.snp.makeConstraints { (make) in
      make.left.equalToSuperview().offset(10)
      make.right.equalToSuperview().offset(-10)
      make.top.equalToSuperview().offset(100)
      make.height.equalTo(100)
    }
    navbar.extSetBorder()
    navbar.containerView.extSetBorder()

    navbar.setupPopButton()
    navbar.setupRightButton()
    navbar.setupTitleLabel()

//    navbar.leftButton?.extSetBorder()
//    navbar.rightButton?.extSetBorder()
//    navbar.titleLabel?.extSetBorder()

    //navbar.leftButton?.extSetTitle("AA")
    navbar.rightButton?.extSetTitle("Done")
    navbar.titleLabel?.text = "Welcome"
  }
}


