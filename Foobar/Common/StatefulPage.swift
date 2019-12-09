//
//  ViewStateProtocol.swift
//  Foobar
//
//  Created by Kevin Wu on 12/9/19.
//  Copyright (c) firefly.com. All rights reserved.
//

import UIKit

enum StatefulPageState: String {
  case Content  = "content"
  case Loading  = "loading"
  case Error    = "error"
  case Empty    = "empty"
}

protocol StatefulPage {

  var pageMachine: StatefulPageMachine { get }

//  var backingView: UIView { get }

  var loadingView: UIView? { get set }
//  var errorView: UIView? { get set }
//  var emptyView: UIView? { get set }

//  func hasContent() -> Bool
//  func handleErrorWhenContentAvailable(_ error: Error)
}
