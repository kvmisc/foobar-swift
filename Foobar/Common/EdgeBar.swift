//
//  EdgeBar.swift
//  Foobar
//
//  Created by Kevin Wu on 12/12/19.
//  Copyright (c) firefly.com. All rights reserved.
//

import UIKit

class EdgeBar: UIView {

  static let defaultNavHeight: CGFloat = 44.0
  static let defaultToolHeight: CGFloat = 49.0

  var preferredHeight: CGFloat = 0.0 {
    didSet { invalidateIntrinsicContentSize() }
  }
  var safeAreaHeight: CGFloat = 0.0 {
    didSet { invalidateIntrinsicContentSize() }
  }
  override var intrinsicContentSize: CGSize {
    return ccs(UIView.noIntrinsicMetric, preferredHeight + safeAreaHeight)
  }

  var contentView: UIView? = nil {
    didSet {
      oldValue?.removeFromSuperview()
      extAddSubviewIfNeeded(contentView)
      setNeedsUpdateConstraints()
    }
  }
  enum ContentAlignment {
    case Top(offset: CGFloat)
    case Bottom(offset: CGFloat)
  }
  var alignment = ContentAlignment.Bottom(offset: 0.0) {
    didSet { setNeedsUpdateConstraints() }
  }
  override func updateConstraints() {
    contentView?.snp.remakeConstraints({ (make) in
      make.left.right.equalToSuperview()
      switch alignment {
      case .Top(let offset):
        make.top.equalToSuperview().offset(offset)
      case .Bottom(let offset):
        make.bottom.equalToSuperview().offset(-offset)
      }
    })
    super.updateConstraints()
  }

}


class NavBarContentView: UIView {

  var leftView: UIView? = nil {
    didSet {
      oldValue?.removeFromSuperview()
      extAddSubviewIfNeeded(leftView)
      leftView?.setContentHuggingPriority(.required, for: .horizontal)
      leftView?.setContentCompressionResistancePriority(.required, for: .horizontal)
      setNeedsUpdateConstraints()
    }
  }
  var rightView: UIView? = nil {
    didSet {
      oldValue?.removeFromSuperview()
      extAddSubviewIfNeeded(rightView)
      rightView?.setContentHuggingPriority(.required, for: .horizontal)
      rightView?.setContentCompressionResistancePriority(.required, for: .horizontal)
      setNeedsUpdateConstraints()
    }
  }
  var titleView: UIView? = nil {
    didSet {
      oldValue?.removeFromSuperview()
      extAddSubviewIfNeeded(titleView)
      titleView?.setContentHuggingPriority(.defaultLow, for: .horizontal)
      titleView?.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
      setNeedsUpdateConstraints()
    }
  }

  let leftButton: UIButton = {
    let ret = UIButton(type: .custom)
    ret.extUseAutoLayout()
    ret.extSetTitleFont(UIFont.preferredFont(forTextStyle: .body))
    ret.extSetTitleColor(.black)
    //ret.extSetTitle(nil)
    //ret.extSetImage(nil)
    return ret
  }()
  let rightButton: UIButton = {
    let ret = UIButton(type: .custom)
    ret.extUseAutoLayout()
    ret.extSetTitleFont(UIFont.preferredFont(forTextStyle: .body))
    ret.extSetTitleColor(.black)
    //ret.extSetTitle(nil)
    //ret.extSetImage(nil)
    return ret
  }()
  let titleLabel: UILabel = {
    let ret = UILabel()
    ret.extUseAutoLayout()
    ret.textAlignment = .center
    ret.lineBreakMode = .byTruncatingTail
    ret.numberOfLines = 1
    ret.adjustsFontSizeToFitWidth = false
    ret.backgroundColor = .clear
    ret.font = UIFont.preferredFont(forTextStyle: .title1)
    ret.textColor = .black
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
    leftView = leftButton
    rightView = rightButton
    titleView = titleLabel
  }

  enum EdgeHConstraint {
    case Intrinsic(offset: CGFloat, minWidth: CGFloat)
    case Constant(offset: CGFloat, width: CGFloat)
  }
  var leftHConstraint = EdgeHConstraint.Intrinsic(offset: 8.0, minWidth: 0.0) {
    didSet { setNeedsUpdateConstraints() }
  }
  var rightHConstraint = EdgeHConstraint.Intrinsic(offset: 8.0, minWidth: 0.0) {
    didSet { setNeedsUpdateConstraints() }
  }

  enum EdgeVConstraint {
    case Occupy
    case Top(offset: CGFloat)
    case Center(offset: CGFloat)
    case Bottom(offset: CGFloat)
  }
  var leftVConstraint = EdgeVConstraint.Occupy {
    didSet { setNeedsUpdateConstraints() }
  }
  var rightVConstraint = EdgeVConstraint.Occupy {
    didSet { setNeedsUpdateConstraints() }
  }

  enum TitleHConstraint {
    case Occupy(margin1: CGFloat, margin2: CGFloat)
    case Center(margin: CGFloat)
  }
  var titleConstraint = TitleHConstraint.Center(margin: 5.0) {
    didSet { setNeedsUpdateConstraints() }
  }

  override var intrinsicContentSize: CGSize {
    return ccs(UIView.noIntrinsicMetric, EdgeBar.defaultNavHeight)
  }

  override func updateConstraints() {

    leftView?.snp.remakeConstraints({ (make) in
      switch leftHConstraint {
      case .Intrinsic(let offset, let minWidth):
        make.left.equalToSuperview().offset(offset)
        make.width.greaterThanOrEqualTo(minWidth)
      case .Constant(let offset, let width):
        make.left.equalToSuperview().offset(offset)
        make.width.equalTo(width)
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
      switch rightHConstraint {
      case .Intrinsic(let offset, let minWidth):
        make.right.equalToSuperview().offset(-offset)
        make.width.greaterThanOrEqualTo(minWidth)
      case .Constant(let offset, let width):
        make.right.equalToSuperview().offset(-offset)
        make.width.equalTo(width)
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
      switch titleConstraint {
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

