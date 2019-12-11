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

  let pageMachine: StatefulPageMachine = StatefulPageMachine()

  override func viewDidLoad() {
    super.viewDidLoad()

    view.backgroundColor = .brown

    pageMachine.view = view

    let loadingView = UIView()
    loadingView.backgroundColor = .red
    pageMachine.loadingView = loadingView

    let errorView = UIView()
    errorView.backgroundColor = .green
    pageMachine.errorView = errorView

    let emptyView = UIView()
    emptyView.backgroundColor = .blue
    pageMachine.emptyView = emptyView

    pageMachine.setupInitialState()

  }

  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)

    pageMachine.startLoading()
    doLoading()
  }

  func doLoading() {
    Async.main(after: 3.0) {
      self.loadComplete()
    }
  }
  func loadComplete() {
//    pageMachine.endLoading(true, false)
//    pageMachine.endLoading(true, true)
//    pageMachine.endLoading(false, true)
    pageMachine.endLoading(false, false)
  }

}
