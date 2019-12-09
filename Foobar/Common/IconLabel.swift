//
//  IconLabel.swift
//  Foobar
//
//  Created by Kevin Wu on 12/7/19.
//  Copyright (c) firefly.com. All rights reserved.
//

import UIKit

class IconLabel: UIView {
  override init(frame: CGRect) {
    super.init(frame: frame)
    setup()
  }
  required init?(coder: NSCoder) {
    super.init(coder: coder)
    setup()
  }

  let stackView: UIStackView = {
    let ret = UIStackView()
    ret.alignment = .center
    ret.spacing = 5.0
    return ret
  }()

  let iconView: UIImageView = {
    let ret = UIImageView()
    return ret
  }()

  let valueLabel: UILabel = {
    let ret = UILabel()
    return ret
  }()

  func setup() {
    addSubview(stackView)
    stackView.snp.makeConstraints { (make) in
      make.edges.equalToSuperview()
    }

    stackView.addArrangedSubview(iconView)
    stackView.addArrangedSubview(valueLabel)
  }
}
