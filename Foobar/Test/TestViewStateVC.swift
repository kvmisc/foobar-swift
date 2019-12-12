//
//  TestViewStateVC.swift
//  Foobar
//
//  Created by Kevin Wu on 12/9/19.
//  Copyright (c) firefly.com. All rights reserved.
//

import UIKit
import Async

class TestViewStateVC: UIViewController {

  let pageState = PageState()

  override func viewDidLoad() {
    super.viewDidLoad()

    view.backgroundColor = .brown

    pageState.view = view

//    let loadingView = UIView()
//    loadingView.backgroundColor = .red
//    pageMachine.loadingView = loadingView
//
//    let errorView = UIView()
//    errorView.backgroundColor = .green
//    pageMachine.errorView = errorView
//
//    let emptyView = UIView()
//    emptyView.backgroundColor = .blue
//    pageMachine.emptyView = emptyView

//    print("init")
//    pageState.setupInitialState()

  }

  let bt: UIButton = {
    let ret = UIButton(type: .custom)
    ret.extSetImage(cci("settings"))
    ret.extSetTitle("asdf")
    ret.extSetBorder()
    ret.imageView?.extSetBorder(width: 1.0, color: .darkGray)
    ret.titleLabel?.extSetBorder(width: 1.0, color: .darkGray)
    return ret
  }()

  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)

    view.addSubview(bt)
    bt.snp.makeConstraints { (make) in
      make.center.equalToSuperview()
    }

    bt.extCenterHorizontally(5)
    bt.contentEdgeInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)

//    print("loading")
//    pageState.startLoading()
//    doLoading()
  }

  func doLoading() {
    Async.main(after: 3.0) {
      self.loadComplete()
    }
  }
  func loadComplete() {
    print("complete")
//    pageState.endLoading(true, false)
//    pageState.endLoading(true, true)
//    pageState.endLoading(false, true)
    pageState.endLoading(false, true)
  }

}
