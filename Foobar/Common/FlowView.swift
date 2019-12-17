//
//  FlowView.swift
//  Foobar
//
//  Created by Kevin Wu on 12/17/19.
//  Copyright (c) firefly.com. All rights reserved.
//

import UIKit

class FlowView: UIView {

  override init(frame: CGRect) {
    super.init(frame: frame)
    setup()
  }
  required init?(coder: NSCoder) {
    super.init(coder: coder)
    setup()
  }
  func setup() {
    addSubview(scrollView)
  }

  let scrollView: UIScrollView = {
    let ret = UIScrollView()
    return ret
  }()

  var lines: [FlowLineView] = []

  var alwaysScrollable = true

  func addLine(_ line: FlowLineView) {
    if line.superview != self {
      line.removeFromSuperview()
      addSubview(line)
    } else {
    }
  }
  func removeLine(_ line: FlowLineView) {
  }
  func removeLine(_ at: Int) {
  }

  func layoutLines() {
    setNeedsLayout()
  }

  override func layoutSubviews() {
    super.layoutSubviews()
    scrollView.frame = bounds

    var offsetY: CGFloat = 0.0
    for line in lines.sorted(by: { $0.index < $1.index }) {
      let contentHeight = line.extIntrinsicContentHeight
      line.frame = ccr(line.insets.left,
                       offsetY+line.insets.top,
                       extWidth-line.insets.left-line.insets.right,
                       contentHeight)
      offsetY += line.insets.top
      offsetY += contentHeight
      offsetY += line.insets.bottom
    }

    if alwaysScrollable {
      let contentHeight = max(extHeight+1, offsetY)
      scrollView.contentSize = ccs(extWidth, contentHeight)
    } else {
      scrollView.contentSize = ccs(extWidth, offsetY)
    }
  }
}

class FlowLineView: UIView {
  var insets: UIEdgeInsets = .zero
  var index = 0
  var contentView: UIView? = nil {
    didSet {
      extAddSubviewIfNeeded(contentView)
      invalidateIntrinsicContentSize()
    }
  }
  override var intrinsicContentSize: CGSize {
    if let contentView = contentView {
      return contentView.intrinsicContentSize
    }
    return ccs(0, 0)
  }
}
