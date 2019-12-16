//
//  BaseViewController.swift
//  Foobar
//
//  Created by Kevin Wu on 12/12/19.
//  Copyright (c) firefly.com. All rights reserved.
//

import UIKit
import Localize_Swift

class BaseViewController: UIViewController {

  // MARK: View lifecycle
  private (set) var viewAppeared: Bool = false
  private (set) var appearedEver: Bool = false
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
    view.backgroundColor = .white
    loadNavBarIfNeeded()
    loadToolBarIfNeeded()
    loadContentViewIfNeeded()

    observeLanguageChange()
    setup()
    reloadPage()
  }

  func observeLanguageChange() {
    NotificationCenter.default.addObserver(self,
                                           selector: #selector(languageChange(_:)),
                                           name: NSNotification.Name(LCLLanguageChangeNotification),
                                           object: nil)
  }
  @objc func languageChange(_ notification: NSNotification) {
    reloadPage()
  }
  func setup() {
  }
  func reloadPage() {
  }

  var occupySafeArea: Bool = false
  override func updateViewConstraints() {
    if let navBar = navBar {
      navBar.preferredHeight = preferredNavBarHeight()
      navBar.safeAreaHeight = occupySafeArea ? 0.0 : STATUS_BAR_HET
      navBar.snp.remakeConstraints { (make) in
        make.left.top.right.equalToSuperview()
      }
    }

    if let toolBar = toolBar {
      toolBar.preferredHeight = preferredToolBarHeight()
      toolBar.safeAreaHeight = occupySafeArea ? 0.0 : SAFE_AREA_BOT
      toolBar.snp.remakeConstraints { (make) in
        make.left.bottom.right.equalToSuperview()
      }
    }

    contentView?.snp.remakeConstraints({ (make) in
      if let navBar = navBar {
        make.top.equalTo(navBar.snp.bottom)
      } else {
        let offset = occupySafeArea ? 0.0 : STATUS_BAR_HET
        make.top.equalToSuperview().offset(offset)
      }
      make.left.right.equalToSuperview()
      if let toolBar = toolBar {
        make.bottom.equalTo(toolBar.snp.top)
      } else {
        let offset = occupySafeArea ? 0.0 : SAFE_AREA_BOT
        make.bottom.equalToSuperview().offset(-offset)
      }
    })

    super.updateViewConstraints()
  }
//  override func viewDidLayoutSubviews() {
//    super.viewDidLayoutSubviews()
//
//    var topUsage: CGFloat = 0.0
//    if let navBar = navBar {
//      var navHeight = navBar.extIntrinsicContentHeight
//      if !occupySafeArea { navHeight += SAFE_AREA_TOP }
//      navBar.frame = ccr(view.extWidth, navHeight)
//      topUsage = navHeight
//    } else {
//      topUsage = occupySafeArea ? 0.0 : STATUS_BAR_HET
//    }
//
//    var botUsage: CGFloat = 0.0
//    if let toolBar = toolBar {
//      var toolHeight = toolBar.extIntrinsicContentHeight
//      if !occupySafeArea { toolHeight += SAFE_AREA_BOT }
//      toolBar.frame = ccr(0.0,
//                          view.extHeight-toolHeight,
//                          view.extWidth,
//                          toolHeight)
//      botUsage = toolHeight
//    } else {
//      botUsage = occupySafeArea ? 0.0 : SAFE_AREA_BOT
//    }
//
//    contentView?.frame = ccr(0.0,
//                             topUsage,
//                             view.extWidth,
//                             view.extHeight - topUsage - botUsage)
//  }

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
        navBar?.translatesAutoresizingMaskIntoConstraints = false
        navBar?.leftButton.extAddTarget(self, #selector(navBarLeftAction(_:)))
        navBar?.rightButton.extAddTarget(self, #selector(navBarRightAction(_:)))
      }
      setupNavBar()
    } else {
      navBar = nil
    }
  }
  func setupNavBar() {
    if let nav = navigationController {
      if self != nav.viewControllers.first {
        setupNavBarBackButton()
      } else {
        if nav.presentingViewController != nil {
          setupNavBarDismissButton()
        }
      }
    } else {
      if presentingViewController != nil {
        setupNavBarDismissButton()
      }
    }
  }
  func setupNavBarBackButton() {
    navBar?.leftButton.extSetTitle("返回")
  }
  func setupNavBarDismissButton() {
    navBar?.leftButton.extSetTitle("关闭")
  }
  @objc func navBarLeftAction(_ sender: UIButton) {
    if let nav = navigationController {
      if self != nav.viewControllers.first {
        nav.popViewController(animated: true)
      } else {
        if nav.presentingViewController != nil {
          nav.dismiss(animated: true, completion: nil)
        }
      }
    } else {
      if presentingViewController != nil {
        dismiss(animated: true, completion: nil)
      }
    }
  }
  @objc func navBarRightAction(_ sender: UIButton) {
  }

  // MARK: ToolBar
  var toolBar: ToolBar? = nil {
    didSet {
      oldValue?.removeFromSuperview()
      view.extAddSubviewIfNeeded(toolBar)
    }
  }
  func shouldLoadToolBar() -> Bool {
    return false
  }
  func preferredToolBarHeight() -> CGFloat {
    return ToolBar.defaultHeight
  }
  func loadToolBarIfNeeded() {
    if shouldLoadToolBar() {
      if toolBar == nil {
        toolBar = ToolBar()
      }
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
    if shouldLoadContentView() {
      if contentView == nil {
        contentView = UIView()
        contentView?.backgroundColor = .white
        view.addSubview(contentView!)
        contentView?.extSendToBack()
      }
    } else {
      contentView?.removeFromSuperview()
      contentView = nil
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
