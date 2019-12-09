//
//  TestViewStateVC.swift
//  Foobar
//
//  Created by Kevin Wu on 12/9/19.
//  Copyright (c) firefly.com. All rights reserved.
//

import UIKit

class TestViewStateVC: UIViewController, StatefulPage {

  var pageMachine: StatefulPageMachine = StatefulPageMachine()

  override func viewDidLoad() {
    super.viewDidLoad()

    view.backgroundColor = .brown

//    self.loadingView = nil
    self.loadingView = UIView()

    print(self.loadingView)
  }
}
