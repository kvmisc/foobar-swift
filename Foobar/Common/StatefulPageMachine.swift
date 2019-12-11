//
//  StateMachine.swift
//  Foobar
//
//  Created by Kevin Wu on 12/9/19.
//  Copyright (c) firefly.com. All rights reserved.
//

import UIKit

class StatefulPageMachine {

  enum State: String {
    case None     = "none"
    case Loading  = "loading"
    case Error    = "error"
    case Empty    = "empty"
    case Content  = "content"
  }

  var view: UIView? = nil
  var state: State = .None

  let containerView: UIView = {
    let ret = UIView()
    ret.backgroundColor = .clear
    return ret
  }()
  var noneView: UIView = {
    let ret = UIView()
    ret.backgroundColor = .lightGray
    return ret
  }()
  var loadingView: UIView? = nil
  var errorView: UIView? = nil
  var emptyView: UIView? = nil

  var hasContent: Bool = false


  // none
  func setupInitialState() {
    state = .None
    reloadPage()
  }
  // loading
  func startLoading() {
    state = .Loading
    reloadPage()
  }
  // hasContent ? content : empty, or error
  func endLoading(_ content: Bool, _ error: Bool) {
    hasContent = content
    if hasContent {
      state = .Content
    } else {
      if error {
        state = .Error
      } else {
        state = .Empty
      }
    }
    reloadPage()
  }

  func reloadPage() {
    if hasContent {
      containerView.extRemoveAllSubviews()
      containerView.removeFromSuperview()
      return
    }

    switch state {
    case .None:
      addContainerViewIfNeeded()
      containerView.extAddSubviewIfNeeded(noneView)
      noneView.snp.remakeConstraints { (make) in
        make.edges.equalToSuperview()
      }
      loadingView?.removeFromSuperview()
      errorView?.removeFromSuperview()
      emptyView?.removeFromSuperview()
    case .Loading:
      addContainerViewIfNeeded()
      noneView.removeFromSuperview()
      if let loadingView = loadingView {
        containerView.extAddSubviewIfNeeded(loadingView)
        loadingView.snp.remakeConstraints { (make) in
          make.edges.equalToSuperview()
        }
      }
      errorView?.removeFromSuperview()
      emptyView?.removeFromSuperview()
    case .Error:
      addContainerViewIfNeeded()
      noneView.removeFromSuperview()
      loadingView?.removeFromSuperview()
      if let errorView = errorView {
        containerView.extAddSubviewIfNeeded(errorView)
        errorView.snp.remakeConstraints { (make) in
          make.edges.equalToSuperview()
        }
      }
      emptyView?.removeFromSuperview()
    case .Empty:
      addContainerViewIfNeeded()
      noneView.removeFromSuperview()
      loadingView?.removeFromSuperview()
      errorView?.removeFromSuperview()
      if let emptyView = emptyView {
        containerView.extAddSubviewIfNeeded(emptyView)
        emptyView.snp.remakeConstraints { (make) in
          make.edges.equalToSuperview()
        }
      }
    case .Content:
      containerView.extRemoveAllSubviews()
      containerView.removeFromSuperview()
    }
  }

  fileprivate func addContainerViewIfNeeded() {
    guard let view = view else { return }
    view.extAddSubviewIfNeeded(containerView)
    containerView.snp.remakeConstraints { (make) in
      make.edges.equalToSuperview()
    }
  }
}

class StatefulPageContainerView: UIView {

  override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
    for view in subviews {
      if !view.isHidden
        && view.alpha > 0
        && view.isUserInteractionEnabled
        && view.point(inside: convert(point, to: view), with:event)
      {
        return true
      }
    }
    return false
  }

}
