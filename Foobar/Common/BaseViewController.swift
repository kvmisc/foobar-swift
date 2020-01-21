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


  var shouldOccupySafeArea = false

  override func updateViewConstraints() {
    navBar?.snp.remakeConstraints { (make) in
      make.left.top.right.equalToSuperview()
    }

    toolBar?.snp.remakeConstraints { (make) in
      make.left.bottom.right.equalToSuperview()
    }

    contentView?.snp.remakeConstraints({ (make) in
      if let navBar = navBar {
        make.top.equalTo(navBar.snp.bottom)
      } else {
        let offset = shouldOccupySafeArea ? 0.0 : STATUS_BAR_HET
        make.top.equalToSuperview().offset(offset)
      }
      make.left.right.equalToSuperview()
      if let toolBar = toolBar {
        make.bottom.equalTo(toolBar.snp.top)
      } else {
        let offset = shouldOccupySafeArea ? 0.0 : SAFE_AREA_BOT
        make.bottom.equalToSuperview().offset(-offset)
      }
    })

    super.updateViewConstraints()
  }

  // MARK: NavBar
  var navBar: EdgeBar? = nil
  var shouldLoadNavBar = true
  func loadNavBarIfNeeded() {
    if shouldLoadNavBar {
      if navBar == nil {
        navBar = EdgeBar()
        navBar?.extUseAutoLayout()
        view.extAddSubviewIfNeeded(navBar)

        let cv = NavBarContentView()
        cv.extUseAutoLayout()
        cv.leftButton.extAddTarget(self, #selector(navBarLeftAction(_:)))
        cv.rightButton.extAddTarget(self, #selector(navBarRightAction(_:)))
        navBar?.contentView = cv

        navBar?.preferredHeight = EdgeBar.defaultNavHeight
        navBar?.safeAreaHeight = shouldOccupySafeArea ? 0.0 : STATUS_BAR_HET

        navBar?.alignment = .Bottom(offset: 0.0)

        setupNavBar()
      }
    } else {
      navBar?.removeFromSuperview()
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
    if let cv = navBar?.contentView as? NavBarContentView {
      cv.leftButton.extSetTitle("返回")
    }
  }
  func setupNavBarDismissButton() {
    if let cv = navBar?.contentView as? NavBarContentView {
      cv.leftButton.extSetTitle("关闭")
    }
  }
  func setupNavBarTitle(_ title: String) {
    if let cv = navBar?.contentView as? NavBarContentView {
      cv.titleLabel.text = title
    }
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
  var toolBar: EdgeBar? = nil
  var shouldLoadToolBar = false
  func loadToolBarIfNeeded() {
    if shouldLoadToolBar {
      if toolBar == nil {
        toolBar = EdgeBar()
        toolBar?.extUseAutoLayout()
        view.extAddSubviewIfNeeded(toolBar)

        toolBar?.preferredHeight = EdgeBar.defaultToolHeight
        toolBar?.safeAreaHeight = shouldOccupySafeArea ? 0.0 : SAFE_AREA_BOT

        toolBar?.alignment = .Top(offset: 0.0)

        setupToolBar()
      }
    } else {
      toolBar?.removeFromSuperview()
      toolBar = nil
    }
  }
  func setupToolBar() {
  }

  // MARK: ContentView
  var contentView: UIView? = nil
  var shouldLoadContentView = true
  func loadContentViewIfNeeded() {
    if shouldLoadContentView {
      if contentView == nil {
        contentView = UIView()
        contentView?.extUseAutoLayout()
        view.addSubview(contentView!)
        contentView?.backgroundColor = .white
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
