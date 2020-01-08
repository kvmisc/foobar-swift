//
//  PageStateView.swift
//  Foobar
//
//  Created by Kevin Wu on 12/11/19.
//  Copyright (c) firefly.com. All rights reserved.
//

import UIKit

class PageStateView: UIView {
  override init(frame: CGRect) {
    super.init(frame: frame)
    setup()
  }
  required init?(coder: NSCoder) {
    super.init(coder: coder)
    setup()
  }
  func setup() {
    self.extUseAutoLayout()
    addSubview(stackView)
  }

  let stackView: UIStackView = {
    let ret = UIStackView()
    ret.extUseAutoLayout()
    ret.axis = .vertical
    ret.alignment = .center
    ret.spacing = 10
    ret.distribution = .fill
    return ret
  }()

  var widthConstraint: LayoutConstraint = .Ratio(value: 0.8) {
    didSet { setNeedsUpdateConstraints() }
  }

  override func updateConstraints() {
    switch widthConstraint {
    case .Ratio(let value):
      stackView.snp.remakeConstraints { (make) in
        make.center.equalToSuperview()
        make.width.equalToSuperview().multipliedBy(value)
      }
    case .Offset(let value):
      stackView.snp.remakeConstraints { (make) in
        make.centerY.equalToSuperview()
        make.left.equalToSuperview().offset(value)
        make.right.equalToSuperview().offset(-value)
      }
    case .Constant(let value):
      stackView.snp.remakeConstraints { (make) in
        make.center.equalToSuperview()
        make.width.equalTo(value)
      }
    case .Intrinsic:
      stackView.snp.remakeConstraints { (make) in
        make.center.equalToSuperview()
        make.width.lessThanOrEqualToSuperview()
      }
    }
    super.updateConstraints()
  }
}

class PageStateLoadingView: PageStateView {
  override func setup() {
    super.setup()
    stackView.addArrangedSubview(indicatorView)
    stackView.addArrangedSubview(infoLabel)
  }
  let indicatorView: UIActivityIndicatorView = {
    if #available(iOS 13.0, *) {
      let ret = UIActivityIndicatorView(style: .medium)
      ret.extUseAutoLayout()
      ret.color = .gray
      ret.hidesWhenStopped = false
      ret.startAnimating()
      return ret
    } else {
      let ret = UIActivityIndicatorView(style: .gray)
      ret.extUseAutoLayout()
      ret.hidesWhenStopped = false
      ret.startAnimating()
      return ret
    }
  }()
  let infoLabel: UILabel = {
    let ret = UILabel()
    ret.extUseAutoLayout()
    ret.backgroundColor = .clear
    ret.textAlignment = .center
    ret.font = UIFont.preferredFont(forTextStyle: .subheadline)
    ret.textColor = ccc("#333333")
    ret.text = "加载中..."
    return ret
  }()
}

class PageStateEmptyView: PageStateView {
  override func setup() {
    super.setup()
    stackView.addArrangedSubview(imageView)
    stackView.addArrangedSubview(titleLabel)
    stackView.addArrangedSubview(infoLabel)
  }
  let imageView: UIImageView = {
    let ret = UIImageView()
    ret.extUseAutoLayout()
    ret.backgroundColor = .clear
    ret.contentMode = .center
    ret.image = cci("page_empty")
    return ret
  }()
  let titleLabel: UILabel = {
    let ret = UILabel()
    ret.extUseAutoLayout()
    ret.backgroundColor = .clear
    ret.textAlignment = .center
    ret.font = UIFont.preferredFont(forTextStyle: .body)
    ret.textColor = ccc("#333333")
    ret.text = "暂无数据"
    return ret
  }()
  let infoLabel: UILabel = {
    let ret = UILabel()
    ret.extUseAutoLayout()
    ret.backgroundColor = .clear
    ret.textAlignment = .center
    ret.font = UIFont.preferredFont(forTextStyle: .subheadline)
    ret.textColor = ccc("#666666")
    ret.numberOfLines = 0
    ret.text = "这里是空的，想一想为什么？快去看看是不是网络问题或者其它什么鬼！"
    return ret
  }()
}

class PageStateErrorView: PageStateView {
  override func setup() {
    super.setup()
    stackView.addArrangedSubview(imageView)
    stackView.addArrangedSubview(titleLabel)
    stackView.addArrangedSubview(infoLabel)
  }
  let imageView: UIImageView = {
    let ret = UIImageView()
    ret.extUseAutoLayout()
    ret.backgroundColor = .clear
    ret.contentMode = .center
    ret.image = cci("page_empty")
    return ret
  }()
  let titleLabel: UILabel = {
    let ret = UILabel()
    ret.extUseAutoLayout()
    ret.backgroundColor = .clear
    ret.textAlignment = .center
    ret.font = UIFont.preferredFont(forTextStyle: .body)
    ret.textColor = ccc("#333333")
    ret.text = "出错了"
    return ret
  }()
  let infoLabel: UILabel = {
    let ret = UILabel()
    ret.extUseAutoLayout()
    ret.backgroundColor = .clear
    ret.textAlignment = .center
    ret.font = UIFont.preferredFont(forTextStyle: .subheadline)
    ret.textColor = ccc("#666666")
    ret.numberOfLines = 0
    ret.text = "快去看看哪里出错了！"
    return ret
  }()
}
