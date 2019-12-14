//
//  NavBar.swift
//  Foobar
//
//  Created by Kevin Wu on 12/13/19.
//  Copyright (c) firefly.com. All rights reserved.
//

import UIKit

class NavBar: UIView {

  let containerView: UIView = {
    let ret = UIView()
    ret.backgroundColor = .clear
    return ret
  }()
  var leftView: UIView? = nil {
    didSet {
      oldValue?.removeFromSuperview()
      containerView.extAddSubviewIfNeeded(leftView)
      leftView?.setContentHuggingPriority(.required, for: .horizontal)
      leftView?.setContentCompressionResistancePriority(.required, for: .horizontal)
      setNeedsUpdateConstraints()
    }
  }
  var rightView: UIView? = nil {
    didSet {
      oldValue?.removeFromSuperview()
      containerView.extAddSubviewIfNeeded(rightView)
      rightView?.setContentHuggingPriority(.required, for: .horizontal)
      rightView?.setContentCompressionResistancePriority(.required, for: .horizontal)
      setNeedsUpdateConstraints()
    }
  }
  var titleView: UIView? = nil {
    didSet {
      oldValue?.removeFromSuperview()
      containerView.extAddSubviewIfNeeded(titleView)
      titleView?.setContentHuggingPriority(.defaultLow, for: .horizontal)
      titleView?.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
      setNeedsUpdateConstraints()
    }
  }

  let leftButton: UIButton = {
    let ret = UIButton(type: .custom)
    ret.extSetTitleFont(UIFont.preferredFont(forTextStyle: .body))
    ret.extSetTitleColor(.black)
    //ret.extSetTitle(nil)
    //ret.extSetImage(nil)
    return ret
  }()
  let rightButton: UIButton = {
    let ret = UIButton(type: .custom)
    ret.extSetTitleFont(UIFont.preferredFont(forTextStyle: .body))
    ret.extSetTitleColor(.black)
    //ret.extSetTitle(nil)
    //ret.extSetImage(nil)
    return ret
  }()
  let titleLabel: UILabel = {
    let ret = UILabel()
    ret.font = UIFont.preferredFont(forTextStyle: .title1)
    ret.textColor = .black
    ret.textAlignment = .center
    ret.lineBreakMode = .byTruncatingTail
    ret.numberOfLines = 1
    ret.adjustsFontSizeToFitWidth = false
    ret.backgroundColor = .clear
    //label.text = nil
    return ret
  }()

  override init(frame: CGRect) {
    super.init(frame: frame)
    setup()
  }
  required init?(coder: NSCoder) {
    super.init(coder: coder)
    setup()
  }
  func setup() {
    backgroundColor = .white
    addSubview(containerView)
    leftView = leftButton
    rightView = rightButton
    titleView = titleLabel
  }


  static let defaultHeight: CGFloat = 44.0

  // 实体占用高度
  var preferredHeight: CGFloat = NavBar.defaultHeight {
    didSet { setNeedsUpdateConstraints() }
  }
  var safeAreaHeight: CGFloat = 0.0 {
    didSet { invalidateIntrinsicContentSize() }
  }

  override var intrinsicContentSize: CGSize {
    return ccs(UIView.noIntrinsicMetric, preferredHeight+safeAreaHeight)
  }


  enum EdgeHConstraint {
    case Intrinsic(offset: CGFloat, minWidth: CGFloat)
    case Constant(value: CGFloat, offset: CGFloat)
  }
  enum EdgeVConstraint {
    case Occupy
    case Top(offset: CGFloat)
    case Center(offset: CGFloat)
    case Bottom(offset: CGFloat)
  }
  var leftHConstraint: EdgeHConstraint = .Intrinsic(offset: 8.0, minWidth: 0.0) {
    didSet { setNeedsUpdateConstraints() }
  }
  var leftVConstraint: EdgeVConstraint = .Occupy {
    didSet { setNeedsUpdateConstraints() }
  }
  var rightHConstraint: EdgeHConstraint = .Intrinsic(offset: 8.0, minWidth: 0.0) {
    didSet { setNeedsUpdateConstraints() }
  }
  var rightVConstraint: EdgeVConstraint = .Occupy {
    didSet { setNeedsUpdateConstraints() }
  }

  enum TitleHAlignment {
    case Occupy(margin1: CGFloat, margin2: CGFloat)
    case Center(margin: CGFloat)
  }
  var titleAlignment: TitleHAlignment = .Center(margin: 5.0) {
    didSet { setNeedsUpdateConstraints() }
  }

  override func updateConstraints() {

    containerView.snp.remakeConstraints { (make) in
      make.left.bottom.right.equalToSuperview()
      make.height.equalTo(preferredHeight)
    }

    leftView?.snp.remakeConstraints({ (make) in
      switch leftHConstraint {
      case .Intrinsic(let offset, let minWidth):
        make.left.equalToSuperview().offset(offset)
        make.width.greaterThanOrEqualTo(minWidth)
      case .Constant(let value, let offset):
        make.left.equalToSuperview().offset(offset)
        make.width.equalTo(value)
      }
      switch leftVConstraint {
      case .Occupy:
        make.top.bottom.equalToSuperview()
      case .Top(let offset):
        make.top.equalToSuperview().offset(offset)
      case .Center(let offset):
        make.centerY.equalToSuperview().offset(offset)
      case .Bottom(let offset):
        make.bottom.equalToSuperview().offset(-offset)
      }
    })

    rightView?.snp.remakeConstraints({ (make) in
      make.top.bottom.equalToSuperview()
      switch rightHConstraint {
      case .Intrinsic(let offset, let minWidth):
        make.right.equalToSuperview().offset(-offset)
        make.width.greaterThanOrEqualTo(minWidth)
      case .Constant(let value, let offset):
        make.right.equalToSuperview().offset(-offset)
        make.width.equalTo(value)
      }
      switch rightVConstraint {
      case .Occupy:
        make.top.bottom.equalToSuperview()
      case .Top(let offset):
        make.top.equalToSuperview().offset(offset)
      case .Center(let offset):
        make.centerY.equalToSuperview().offset(offset)
      case .Bottom(let offset):
        make.bottom.equalToSuperview().offset(-offset)
      }
    })

    titleView?.snp.remakeConstraints({ (make) in
      make.centerY.equalToSuperview()
      switch titleAlignment {
      case .Occupy(let margin1, let margin2):
        if let leftView = leftView {
          make.left.equalTo(leftView.snp.right).offset(margin1)
        } else {
          make.left.equalToSuperview().offset(margin1)
        }
        if let rightView = rightView {
          make.right.equalTo(rightView.snp.left).offset(-margin2)
        } else {
          make.right.equalToSuperview().offset(-margin2)
        }
      case .Center(let margin):
        make.centerX.equalToSuperview()
        if let leftView = leftView {
          make.left.greaterThanOrEqualTo(leftView.snp.right).offset(margin)
        } else {
          make.left.greaterThanOrEqualToSuperview().offset(margin)
        }
        if let rightView = rightView {
          make.right.lessThanOrEqualTo(rightView.snp.left).offset(-margin)
        } else {
          make.right.lessThanOrEqualToSuperview().offset(-margin)
        }
      }
    })

    super.updateConstraints()
  }
}
