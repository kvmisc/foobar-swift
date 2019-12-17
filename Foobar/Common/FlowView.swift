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

  var alwaysScrollable = false

  func addLine(_ line: FlowLineView) {
    scrollView.extAddSubviewIfNeeded(line)
    if !lines.contains(line) {
      lines.append(line)
      lines.sort { $0.index < $1.index }
    }
    setNeedsLayout()
  }
  func removeLine(_ line: FlowLineView) {
    let at = lines.firstIndex(of: line)
    if let at = at {
      line.removeFromSuperview()
      lines.remove(at: at)
      setNeedsLayout()
    }
  }
  func removeLine(_ at: Int) {
    if at < lines.count {
      let line = lines[at]
      line.removeFromSuperview()
      lines.remove(at: at)
      setNeedsLayout()
    }
  }

  func layoutLines() {
    setNeedsLayout()
  }

  override func layoutSubviews() {
    super.layoutSubviews()
    scrollView.frame = bounds

    var offsetY: CGFloat = 0.0
    for line in lines {
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
  weak var flowView: FlowView? = nil
  var insets: UIEdgeInsets = .zero
  var index = 0
  var contentView: UIView? = nil {
    didSet { setup() }
  }
//  override init(frame: CGRect) {
//    super.init(frame: frame)
//  }
  required init?(coder: NSCoder) {
    super.init(coder: coder)
  }
  init(_ view: UIView) {
    contentView = view
    super.init(frame: .zero)
    setup()
  }
  func setup() {
    extAddSubviewIfNeeded(contentView)
    setNeedsLayout()
    invalidateIntrinsicContentSize()
    if self.superview == flowView?.scrollView {
      flowView?.layoutLines()
    }
  }
  override func layoutSubviews() {
    super.layoutSubviews()
    contentView?.frame = bounds
  }
  override var intrinsicContentSize: CGSize {
    if let contentView = contentView {
      return contentView.intrinsicContentSize
    }
    return ccs(0, 0)
  }
}
