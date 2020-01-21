//
//  TestHierachyRedVC.swift
//  Foobar
//
//  Created by Kevin Wu on 12/14/19.
//  Copyright (c) firefly.com. All rights reserved.
//

import UIKit
import Async
import Localize_Swift

class TestHierachyRedVC: BaseViewController {

  var info: String = "unknown" {
    didSet {
      infoLabel.text = info + ": " + String(count)
    }
  }
  var count: Int = 0 {
    didSet {
      infoLabel.text = info + ": " + String(count)
    }
  }

  let infoLabel: UILabel = {
    let ret = UILabel()
    ret.backgroundColor = .yellow
    ret.textColor = .black
    ret.font = UIFont.systemFont(ofSize: 14)
    return ret
  }()

  let shadowView: UIView = {
    let ret = UIView()
    ret.backgroundColor = .brown
    return ret
  }()

  override func viewDidLoad() {
    super.viewDidLoad()

    shouldLoadToolBar = (count % 2) == 0


    navBar?.backgroundColor = .lightGray
    navBar?.contentView?.backgroundColor = .darkGray

    toolBar?.backgroundColor = .lightGray

    contentView?.extSetBorder(width: 2, color: .red)

    contentView?.addSubview(infoLabel)
    infoLabel.snp.makeConstraints { (make) in
      make.top.equalToSuperview().offset(20)
      make.centerX.equalToSuperview()
    }

    setupNavBarTitle("ttl")
//    navBar?.titleLabel.text = infoLabel.text
//    contentView?.addSubview(shadowView)
//    shadowView.extSendToBack()
//    shadowView.snp.makeConstraints { (make) in
//      make.top.equalTo(infoLabel)
//      make.left.equalTo(infoLabel).offset(-5.0)
//      make.right.equalTo(infoLabel).offset(5.0)
//      make.height.equalTo(infoLabel).offset(5)
//    }

    let bt1 = UIButton(type: .system)
    bt1.extSetTitle("push")
    contentView?.addSubview(bt1)
    bt1.snp.makeConstraints { (make) in
      make.centerX.equalToSuperview()
      make.top.equalToSuperview().offset(50)
      make.width.equalTo(100)
      make.height.equalTo(40)
    }
    bt1.extAddTarget(self, #selector(pushIt(_:)))

    let bt2 = UIButton(type: .system)
    bt2.extSetTitle("present")
    contentView?.addSubview(bt2)
    bt2.snp.makeConstraints { (make) in
      make.centerX.equalToSuperview()
      make.top.equalToSuperview().offset(100)
      make.width.equalTo(100)
      make.height.equalTo(40)
    }
    bt2.extAddTarget(self, #selector(presentIt(_:)))

    let bt3 = UIButton(type: .system)
    bt3.extSetTitle("present nav")
    contentView?.addSubview(bt3)
    bt3.snp.makeConstraints { (make) in
      make.centerX.equalToSuperview()
      make.top.equalToSuperview().offset(150)
      make.width.equalTo(100)
      make.height.equalTo(40)
    }
    bt3.extAddTarget(self, #selector(presentNavIt(_:)))

    Async.main(after: 3.0) {
      //Localize.setCurrentLanguage("en")

//      self.occupySafeArea = true
//      self.navBar?.preferredHeight = 100
//      self.toolBar?.preferredHeight = 200
    }
  }
  override func reloadPage() {
    infoLabel.text = "some_key".localized() + " " + info + ": " + String(count)
  }

  @objc func pushIt(_ sender: UIButton) {
    let vc = TestHierachyRedVC()
    vc.info = "push"
    vc.count = count + 1
    navigationController?.pushViewController(vc, animated: true)
  }
  @objc func presentIt(_ sender: UIButton) {
    let vc = TestHierachyRedVC()
    vc.info = "present"
    vc.count = count + 1
    present(vc, animated: true, completion: nil)
  }
  @objc func presentNavIt(_ sender: UIButton) {
    let vc = TestHierachyRedVC()
    vc.info = "present nav"
    vc.count = count + 1

    let nc = UINavigationController(rootViewController: vc)
    nc.isNavigationBarHidden = true

    present(nc, animated: true, completion: nil)
  }

}
