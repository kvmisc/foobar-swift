//
//  ToolBar.swift
//  Foobar
//
//  Created by Kevin Wu on 12/12/19.
//  Copyright (c) firefly.com. All rights reserved.
//

import UIKit

class ToolBar: UIView {

  static let defaultHeight: CGFloat = 49.0

  var preferredHeight: CGFloat = 0.0 {
    didSet { setNeedsUpdateConstraints() }
  }

  var safeAreaHeight: CGFloat = 0.0 {
    didSet { invalidateIntrinsicContentSize() }
  }

  var contentView: UIView? = nil {
    didSet {
      oldValue?.removeFromSuperview()
      extAddSubviewIfNeeded(contentView)
      setNeedsUpdateConstraints()
    }
  }

  override func updateConstraints() {
    contentView?.snp.makeConstraints({ (make) in
      make.edges.equalToSuperview()
    })
    super.updateConstraints()
  }

  override var intrinsicContentSize: CGSize {
    return ccs(UIView.noIntrinsicMetric, preferredHeight+safeAreaHeight)
  }
}
