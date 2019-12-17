//
//  FlowView.swift
//  Foobar
//
//  Created by Kevin Wu on 12/17/19.
//  Copyright (c) firefly.com. All rights reserved.
//

import UIKit

class FlowView: UIScrollView {

  override init(frame: CGRect) {
    super.init(frame: frame)
    setup()
  }
  required init?(coder: NSCoder) {
    super.init(coder: coder)
    setup()
  }
  func setup() {
    addSubview(containerView)
  }

  let containerView: UIView = {
    let ret = UIView()
    ret.backgroundColor = .clear
    return ret
  }()

  var lines: [FlowLineView] = []

  func addLine(_ line: FlowLineView) {
    containerView.extAddSubviewIfNeeded(line)
    if !lines.contains(line) {
      lines.append(line)
      lines.sort { $0.index < $1.index }
    }
    setNeedsUpdateConstraints()
  }
  func removeLine(_ line: FlowLineView) {
    let at = lines.firstIndex(of: line)
    if let at = at {
      line.removeFromSuperview()
      lines.remove(at: at)
      setNeedsUpdateConstraints()
    }
  }
  func removeLine(_ at: Int) {
    if at < lines.count {
      let line = lines[at]
      line.removeFromSuperview()
      lines.remove(at: at)
      setNeedsUpdateConstraints()
    }
  }
  func layoutLines() {
    setNeedsUpdateConstraints()
  }

  override func updateConstraints() {
    containerView.snp.remakeConstraints { (make) in
      make.edges.equalTo(self)
      make.width.equalTo(self)
    }

    var prevView: FlowLineView? = nil
    for line in lines {
      line.snp.remakeConstraints { (make) in
        if let prevView = prevView {
          make.top.equalTo(prevView.snp.bottom).offset(prevView.insets.bottom+line.insets.top)
        } else {
          make.top.equalToSuperview().offset(line.insets.top)
        }
        make.left.equalToSuperview().offset(line.insets.left)
        make.right.equalToSuperview().offset(-line.insets.right)
      }
      prevView = line
    }

    if let prevView = prevView {
      containerView.snp.makeConstraints { (make) in
        make.bottom.equalTo(prevView).offset(prevView.insets.bottom)
      }
    } else {
      containerView.snp.makeConstraints { (make) in
        make.height.equalTo(0)
      }
    }

    super.updateConstraints()
  }
}

class FlowLineView: UIView {
//  override init(frame: CGRect) {
//    super.init(frame: frame)
//  }
  required init?(coder: NSCoder) {
    super.init(coder: coder)
  }
  init(_ view: UIView? = nil) {
    super.init(frame: .zero)
    if view != nil {
      contentView = view
      extAddSubviewIfNeeded(contentView)
      setNeedsUpdateConstraints()
    }
  }
  func setup() {
    extAddSubviewIfNeeded(contentView)
    setNeedsUpdateConstraints()
    invalidateIntrinsicContentSize()
  }

  var insets: UIEdgeInsets = .zero
  var index = 0
  var contentView: UIView? = nil {
    didSet { setup() }
  }

  override func updateConstraints() {
    contentView?.snp.remakeConstraints({ (make) in
      make.edges.equalToSuperview()
    })
    super.updateConstraints()
  }
//  override var intrinsicContentSize: CGSize {
//    if let contentView = contentView {
//      return contentView.intrinsicContentSize
//    }
//    return ccs(0, 0)
//  }
}
