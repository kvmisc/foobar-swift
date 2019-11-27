//
//  FBTestView.swift
//  TestSwift
//
//  Created by Haiping Wu on 11/27/19.
//  Copyright © 2019 Haiping Wu. All rights reserved.
//

import UIKit

class FBBaseView: UIView {
  override init(frame: CGRect) {
    super.init(frame: frame)
    setup()
  }
  required init?(coder: NSCoder) {
    super.init(coder: coder)
    print("in coder")
    setup()
    //fatalError("init(coder:) has not been implemented")
  }
  func setup() {
    print("in base")
  }
}

class FBTestView: FBBaseView {

  lazy var redView: UIView = {
    let view = UIView()
    view.backgroundColor = .red
    return view
  }()

  override func setup() {
    print("in child")
    backgroundColor = .green
    addSubview(redView)
    redView.frame = CGRect(x: 5, y: 5, width: 20, height: 20)
  }

  func doit() {
    print("do it")
  }

//  func setup() {
//    backgroundColor = .green
//    addSubview(redView)
//    redView.frame = CGRect(x: 5, y: 5, width: 20, height: 20)
//  }

}
