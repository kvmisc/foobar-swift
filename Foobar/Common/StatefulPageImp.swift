//
//  ViewStateImp.swift
//  Foobar
//
//  Created by Kevin Wu on 12/9/19.
//  Copyright (c) firefly.com. All rights reserved.
//

import UIKit

extension StatefulPage {

  var loadingView: UIView? {
    get { return pageMachine.views[StatefulPageState.Loading.rawValue] }
    set { pageMachine.views[StatefulPageState.Loading.rawValue] = newValue }
  }
  var errorView: UIView? {
    get { return pageMachine.views[StatefulPageState.Error.rawValue] }
    set { pageMachine.views[StatefulPageState.Error.rawValue] = newValue }
  }
  var emptyView: UIView? {
    get { return pageMachine.views[StatefulPageState.Empty.rawValue] }
    set { pageMachine.views[StatefulPageState.Empty.rawValue] = newValue }
  }


//  func setupInitialState(_ completion: CompletionHandler? = nil) {
//    let isLoading = (lastState == .loading)
//    let error: NSError? = (lastState == .error) ? NSError(domain: "", code: -1, userInfo: nil) : nil
//    //transitionViewStates(loading: isLoading, error: error, animated: false, completion: completion)
//  }

  func startLoading(animated: Bool = false, completion: CompletionHandler? = nil) {
    //transitionViewStates(loading: true, animated: animated, completion: completion)
  }

  func endLoading(animated: Bool = true, error: Error? = nil, completion: CompletionHandler? = nil) {
    //transitionViewStates(loading: false, error: error, animated: animated, completion: completion)
  }

}
