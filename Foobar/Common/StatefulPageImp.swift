//
//  ViewStateImp.swift
//  Foobar
//
//  Created by Kevin Wu on 12/9/19.
//  Copyright (c) firefly.com. All rights reserved.
//

import UIKit

extension StatefulPage {

  public var loadingView: UIView? {
    get { return pageMachine.views[StatefulPageState.Loading.rawValue] }
    set { pageMachine.views[StatefulPageState.Loading.rawValue] = newValue }
  }

//  public var errorView: UIView? {
//    get { return nil }
//    set { }
//  }
//
//  public var emptyView: UIView? {
//    get { return nil }
//    set { }
//  }

}
