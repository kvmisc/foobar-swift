//
//  TestAlertView.swift
//  Foobar
//
//  Created by Kevin Wu on 12/10/19.
//  Copyright (c) firefly.com. All rights reserved.
//

import UIKit

class TestEntryView: UIView {

  override init(frame: CGRect) {
    super.init(frame: frame)
    backgroundColor = .red
  }
  required init?(coder: NSCoder) {
    super.init(coder: coder)
    backgroundColor = .red
  }

  override var intrinsicContentSize: CGSize {
    return ccs(200, 80)
  }

  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    print("in touch")
    //Overlay.shared.hide()

//    let v = TestEntryView()
//    v.backgroundColor = .green
//    Overlay.shared.showAlert(v, width: .ratio(value: 0.8))
  }

}
