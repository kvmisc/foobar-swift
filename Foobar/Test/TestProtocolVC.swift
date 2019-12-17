//
//  TestProtocolVC.swift
//  Foobar
//
//  Created by Kevin Wu on 12/17/19.
//  Copyright (c) firefly.com. All rights reserved.
//

import UIKit
import Async
import Localize_Swift

class TestProtocolVC: UIViewController {

  let infoLabel: UILabel = {
    let ret = UILabel()
    ret.font = UIFont.systemFont(ofSize: 16.0)
    ret.textColor = .red
    return ret
  }()

  override func viewDidLoad() {
    super.viewDidLoad()

    view.backgroundColor = .white

    view.addSubview(infoLabel)
    infoLabel.snp.makeConstraints { (make) in
      make.center.equalToSuperview()
    }

    infoLabel.text = "some_key".localized()

//    observeLanguageChange()
//    Async.main(after: 3.0) {
//      Localize.setCurrentLanguage("zh-Hans")
//    }

  }

}
