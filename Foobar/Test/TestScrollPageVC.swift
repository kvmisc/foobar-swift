//
//  TestScrollPageVC.swift
//  Foobar
//
//  Created by Kevin Wu on 12/19/19.
//  Copyright (c) firefly.com. All rights reserved.
//

import UIKit

class TestScrollPageVC: UIViewController {

  lazy var scrollView: UIScrollView = {
    let ret = UIScrollView()
    ret.isPagingEnabled = true
    ret.delegate = self
    return ret
  }()
  let containerView: UIView = {
    let ret = UIView()
    ret.backgroundColor = .clear
    print("here")
    return ret
  }()
  

  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .lightGray
    view.addSubview(scrollView)
    scrollView.snp.makeConstraints { (make) in
      make.edges.equalToSuperview().inset(cce(50))
    }

    scrollView.addSubview(containerView)
    containerView.snp.remakeConstraints { (make) in
      make.edges.equalTo(scrollView)
      make.height.equalTo(scrollView)
    }

    var prevView: UIView? = nil
    for i in 1...5 {
      let page = TestScrollPage()
      switch i {
      case 1: page.backgroundColor = .red
      case 2: page.backgroundColor = .green
      case 3: page.backgroundColor = .blue
      case 4: page.backgroundColor = .purple
      case 5: page.backgroundColor = .brown
      default: page.backgroundColor = .yellow
      }
      page.label.text = String(i)
      containerView.addSubview(page)
      page.snp.makeConstraints { (make) in
        if let prevView = prevView {
          make.left.equalTo(prevView.snp.right)
        } else {
          make.left.equalToSuperview()
        }
        make.top.bottom.equalToSuperview()
      }
      prevView = page
    }
    if let prevView = prevView {
      containerView.snp.makeConstraints { (make) in
        make.right.equalTo(prevView)
      }
    }
  }

}

extension TestScrollPageVC: UIScrollViewDelegate {
  func scrollViewDidScroll(_ scrollView: UIScrollView) {
    print("did scroll")
  }
  func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
    print("scroll did end: end decelerating")
  }
  func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
    if !decelerate {
      print("scroll did end: end dragging")
    }
  }
}

class TestScrollPage: UIView {

  override init(frame: CGRect) {
    super.init(frame: frame)
    setup()
  }
  required init?(coder: NSCoder) {
    super.init(coder: coder)
    setup()
  }
//  init(_ color: UIColor) {
//    super.init(frame: .zero)
//    backgroundColor = color
//    setup()
//  }

  let label: UILabel = {
    let ret = UILabel()
    ret.font = UIFont.systemFont(ofSize: 20)
    ret.textColor = .black
    return ret
  }()

  func setup() {
    addSubview(label)
    label.snp.makeConstraints { (make) in
      make.center.equalToSuperview()
    }
  }

  override var intrinsicContentSize: CGSize {
    return ccs(SCREEN_WID-100, SCREEN_HET-100)
  }

}
