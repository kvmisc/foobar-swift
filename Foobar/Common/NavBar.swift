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
      setNeedsLayout()
    }
  }
  var rightView: UIView? = nil {
    didSet {
      oldValue?.removeFromSuperview()
      containerView.extAddSubviewIfNeeded(rightView)
      rightView?.setContentHuggingPriority(.required, for: .horizontal)
      rightView?.setContentCompressionResistancePriority(.required, for: .horizontal)
      setNeedsLayout()
    }
  }
  var titleView: UIView? = nil {
    didSet {
      oldValue?.removeFromSuperview()
      containerView.extAddSubviewIfNeeded(titleView)
      titleView?.setContentHuggingPriority(.defaultLow, for: .horizontal)
      titleView?.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
      setNeedsLayout()
    }
  }

  var leftButton: UIButton? {
    return leftView as? UIButton
  }
  var rightButton: UIButton? {
    return rightView as? UIButton
  }
  var titleLabel: UILabel? {
    return titleView as? UILabel
  }

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
  }

  func setupPopButton() {
    let button = UIButton(type: .custom)
    button.extSetTitleFont(UIFont.preferredFont(forTextStyle: .body))
    button.extSetTitleColor(.black)
    leftView = button
  }
  func setupCloseButton() {
    let button = UIButton(type: .custom)
    button.extSetTitleFont(UIFont.preferredFont(forTextStyle: .body))
    button.extSetTitleColor(.black)
    leftView = button
  }
  func setupLeftButton() {
    let button = UIButton(type: .custom)
    button.extSetTitleFont(UIFont.preferredFont(forTextStyle: .body))
    button.extSetTitleColor(.black)
    leftView = button
  }
  func setupRightButton() {
    let button = UIButton(type: .custom)
    button.extSetTitleFont(UIFont.preferredFont(forTextStyle: .body))
    button.extSetTitleColor(.black)
    rightView = button
  }
  func setupTitleLabel() {
    let label = UILabel()
    label.font = UIFont.preferredFont(forTextStyle: .title1)
    label.textColor = .black
    label.textAlignment = .center
    label.lineBreakMode = .byTruncatingTail
    label.numberOfLines = 1
    label.adjustsFontSizeToFitWidth = false
    label.backgroundColor = .clear
    titleView = label
  }

  override var intrinsicContentSize: CGSize {
    return CGSize(width: UIView.noIntrinsicMetric, height: preferredHeight)
  }


  static let defaultHeight: CGFloat = 44.0

  var preferredHeight: CGFloat = NavBar.defaultHeight;


  enum EdgeHConstraint {
    case Intrinsic(offset: CGFloat)
    case Constant(value: CGFloat, offset: CGFloat)
  }
  var leftConstraint: EdgeHConstraint = .Intrinsic(offset: 8.0)
  var rightConstraint: EdgeHConstraint = .Intrinsic(offset: 8.0)

  enum TitleHAlignment {
    case Occupy(margin1: CGFloat, margin2: CGFloat)
    case Center(margin: CGFloat)
  }
  var titleAlignment: TitleHAlignment = .Center(margin: 5.0)


  override func updateConstraints() {

    containerView.snp.remakeConstraints { (make) in
      make.left.bottom.right.equalToSuperview()
      make.height.equalTo(preferredHeight)
    }

    leftView?.snp.remakeConstraints({ (make) in
      make.top.bottom.equalToSuperview()
      switch leftConstraint {
      case .Intrinsic(let offset):
        make.left.equalToSuperview().offset(offset)
      case .Constant(let value, let offset):
        make.left.equalToSuperview().offset(offset)
        make.width.equalTo(value)
      }
      if leftView is UIButton {
        make.width.greaterThanOrEqualTo(44.0)
      }
    })

    rightView?.snp.remakeConstraints({ (make) in
      make.top.bottom.equalToSuperview()
      switch rightConstraint {
      case .Intrinsic(let offset):
        make.right.equalToSuperview().offset(-offset)
      case .Constant(let value, let offset):
        make.right.equalToSuperview().offset(-offset)
        make.width.equalTo(value)
      }
      if rightView is UIButton {
        make.width.greaterThanOrEqualTo(44.0)
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
