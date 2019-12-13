//
//  BaseViewController.swift
//  Foobar
//
//  Created by Kevin Wu on 12/12/19.
//  Copyright (c) firefly.com. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

  fileprivate (set) var viewAppeared: Bool = false
  fileprivate (set) var appearedEver: Bool = false

  var occupySafeArea: Bool = false

  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    viewAppeared = true
  }
  override func viewDidDisappear(_ animated: Bool) {
    super.viewDidDisappear(animated)
    viewAppeared = false
    appearedEver = true
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    loadNavBarIfNeeded()
    loadToolBarIfNeeded()
    loadContentViewIfNeeded()
    setup()
  }
  func setup() {
  }
  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()

    var topUsage: CGFloat = 0.0
    if let navBar = navBar {
      var navHeight = navBar.extIntrinsicContentHeight
      if !occupySafeArea { navHeight += CGFloat(SAFE_AREA_TOP) }
      navBar.frame = ccr(view.extWidth, navHeight)
      topUsage = navHeight
    } else {
      topUsage = occupySafeArea ? 0.0 : CGFloat(STATUS_BAR_HET)
    }

    var botUsage: CGFloat = 0.0
    if let toolBar = toolBar {
      var toolHeight = toolBar.extIntrinsicContentHeight
      if !occupySafeArea { toolHeight += CGFloat(SAFE_AREA_BOT) }
      toolBar.frame = ccr(0.0,
                          view.extHeight-toolHeight,
                          view.extWidth,
                          toolHeight)
      botUsage = toolHeight
    } else {
      botUsage = occupySafeArea ? 0.0 : CGFloat(SAFE_AREA_BOT)
    }

    contentView?.frame = ccr(0.0,
                             topUsage,
                             view.extWidth,
                             view.extHeight - topUsage - botUsage)
  }

  // MARK: NavBar
  var navBar: NavBar? = nil {
    didSet {
      oldValue?.removeFromSuperview()
      view.extAddSubviewIfNeeded(navBar)
    }
  }
  func shouldLoadNavBar() -> Bool {
    return true
  }
  func preferredNavBarHeight() -> CGFloat {
    return NavBar.defaultHeight
  }
  func loadNavBarIfNeeded() {
    if shouldLoadNavBar() {
      if navBar == nil {
        navBar = NavBar()
      }
      navBar?.preferredHeight = preferredNavBarHeight()
      setupNavBar()
    } else {
      navBar = nil
    }
  }
  func setupNavBar() {
    if extCanBePopped() {
      // 在导航中且不是根, 设置 back
      // ...
    } else {
      if extCanBeDismissed() || extNavCanBeDismissed() {
        // 不在导航中, 被 present, 设置 dismiss
        // 在导航中且是根, 导航被 present, 设置 dismiss
        // ...
      }
    }
  }

  // MARK: ToolBar
  var toolBar: ToolBar? = nil {
    didSet {
      oldValue?.removeFromSuperview()
      view.extAddSubviewIfNeeded(toolBar)
    }
  }
  func shouldLoadToolBar() -> Bool {
    return true
  }
  func preferredToolBarHeight() -> CGFloat {
    return ToolBar.defaultHeight
  }
  func loadToolBarIfNeeded() {
    if shouldLoadToolBar() {
      if toolBar == nil {
        toolBar = ToolBar()
      }
      toolBar?.preferredHeight = preferredToolBarHeight()
      setupToolBar()
    } else {
      toolBar = nil
    }
  }
  func setupToolBar() {
  }

  // MARK: ContentView
  var contentView: UIView? = nil
  func shouldLoadContentView() -> Bool {
    return true
  }
  func loadContentViewIfNeeded() {
    guard contentView == nil else { return }
    guard shouldLoadContentView() else { return }

    if contentView == nil {
      contentView = UIView()
      view.addSubview(contentView!)
    }
  }

  // MARK: Public methods
  func disableContentInsetAdjustment(_ scrollView: UIScrollView) {
    if #available(iOS 11.0, *) {
      scrollView.contentInsetAdjustmentBehavior = .never
    } else {
      automaticallyAdjustsScrollViewInsets = false
    }
  }
}
