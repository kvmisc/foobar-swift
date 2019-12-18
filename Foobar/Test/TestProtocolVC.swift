//
//  TestProtocolVC.swift
//  Foobar
//
//  Created by Kevin Wu on 12/17/19.
//  Copyright (c) firefly.com. All rights reserved.
//

import UIKit
import Async
import PKHUD

class TestHUDView: PKHUDSquareBaseView {
//  override var intrinsicContentSize: CGSize {
//    return ccs(50)
//  }
//  override init(frame: CGRect) {
//    super.init(frame: frame)
//    setup()
//  }
//  required init?(coder: NSCoder) {
//    super.init(coder: coder)
//    setup()
//  }
  func setup() {
    let bt = UIButton(type: .system)
    bt.extSetTitle("asdf")
    addSubview(bt)
    bt.snp.makeConstraints { (make) in
      make.edges.equalToSuperview()
    }
  }
}

class TestProtocolVC: UIViewController {

  let flowView: FlowView = {
    let ret = FlowView()
    ret.extSetBorder()
    return ret
  }()

  override func viewDidLoad() {
    super.viewDidLoad()

    view.backgroundColor = .white

    view.addSubview(flowView)
    flowView.snp.makeConstraints { (make) in
      make.edges.equalToSuperview().inset(cce(50, 50, 50, 50))
    }

  }

  var count = 0

  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {

    let hud = TestHUDView(image: nil, title: nil, subtitle: nil)
    hud.setup()
    hud.backgroundColor = .red
    PKHUD.sharedHUD.contentView = hud
    PKHUD.sharedHUD.show()
    return

    if count > 5 {
      flowView.removeLine(2)
      return
    }

    let line = TestLineView()
    switch count {
    case 0:
      line.backgroundColor = .red
    case 1:
      line.backgroundColor = .green
    case 2:
      line.backgroundColor = .blue
    case 3:
      line.backgroundColor = .brown
    case 4:
      line.backgroundColor = .purple
    default:
      line.backgroundColor = .yellow
    }
    line.contentHeight = CGFloat(count+1) * 40.0 
    count += 1

    let ln = FlowLineView(line)
    //ln.contentView = line
    ln.insets.top = 5
    ln.insets.left = 5
    ln.insets.right = 10
    ln.insets.bottom = 5
    ln.index = 10 - count

    line.setup()
    line.translatesAutoresizingMaskIntoConstraints = false

    flowView.addLine(ln)

  }

}

class TestLineView: UIView {
  var contentHeight: CGFloat = 0.0 {
    didSet {
      invalidateIntrinsicContentSize()
    }
  }

  func setup() {
//    let bt = UIButton(type: .system)
//    bt.extSetTitle("flaks")
//    addSubview(bt)
//    bt.snp.makeConstraints { (make) in
//      make.edges.equalToSuperview().inset(cce(5, 5, 5, 5))
//    }
  }

  override var intrinsicContentSize: CGSize {
    return ccs(0.0, contentHeight)
  }
}
