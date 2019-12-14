//
//  TestAutolayoutView.swift
//  Foobar
//
//  Created by Kevin Wu on 12/14/19.
//  Copyright (c) firefly.com. All rights reserved.
//

import UIKit

class TestAutolayoutView: UIView {
  override init(frame: CGRect) {
    super.init(frame: frame)
    setup()
  }
  required init?(coder: NSCoder) {
    super.init(coder: coder)
    setup()
  }
  let redView: UIView = {
    let ret = UIView()
    ret.backgroundColor = .green
    return ret
  }()
  func setup() {
    addSubview(redView)
    redView.frame = ccr(1, 2, 3, 4)
    redView.snp.makeConstraints { (make) in
      make.left.equalToSuperview().offset(10)
      make.top.equalToSuperview().offset(20)
      make.width.equalTo(30)
      make.height.equalTo(40)
    }
    print("setup \(redView.frame)")
  }
  override func layoutSubviews() {
    super.layoutSubviews()
    print("layoutSubviews \(redView.frame)")
  }
}
