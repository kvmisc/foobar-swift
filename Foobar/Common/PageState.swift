//
//  PageState.swift
//  Foobar
//
//  Created by Kevin Wu on 12/9/19.
//  Copyright (c) firefly.com. All rights reserved.
//

import UIKit

class PageState {

  enum State {
    case None
    case Loading
    case Empty
    case Error
    case Content
  }

  var view: UIView? = nil
  var state: State = .None

  let containerView: UIView = {
    let ret = UIView()
    ret.extUseAutoLayout()
    ret.backgroundColor = .white
    return ret
  }()
  var loadingView: UIView = PageStateLoadingView()
  var emptyView: UIView = PageStateEmptyView()
  var errorView: UIView = PageStateErrorView()

  var hasContent: Bool = false


  // content ? content : none
  func setupInitialState(_ content: Bool = false) {
    hasContent = content
    if hasContent {
      state = .Content
    } else {
      state = .None
    }
    reloadPage()
  }
  // loading
  func startLoading() {
    state = .Loading
    reloadPage()
  }
  // content ? content : (empty or error)
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
    } else {
      switch state {
      case .None:
        addContainerViewIfNeeded()
        loadingView.removeFromSuperview()
        errorView.removeFromSuperview()
        emptyView.removeFromSuperview()
      case .Loading:
        addContainerViewIfNeeded()
        showViewIfNeeded(loadingView)
      case .Empty:
        addContainerViewIfNeeded()
        showViewIfNeeded(emptyView)
      case .Error:
        addContainerViewIfNeeded()
        showViewIfNeeded(errorView)
      case .Content:
        containerView.extRemoveAllSubviews()
        containerView.removeFromSuperview()
      }
    }
  }

  private func addContainerViewIfNeeded() {
    guard let view = view else { return }
    view.extAddSubviewIfNeeded(containerView)
    containerView.snp.remakeConstraints { (make) in
      make.edges.equalToSuperview()
    }
  }
  private func showViewIfNeeded(_ view: UIView) {
    if view != loadingView { loadingView.removeFromSuperview() }
    if view != emptyView { emptyView.removeFromSuperview() }
    if view != errorView { errorView.removeFromSuperview() }
    containerView.extAddSubviewIfNeeded(view)
    view.snp.remakeConstraints { (make) in
      make.edges.equalToSuperview()
    }
  }
}
