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

  override var intrinsicContentSize: CGSize {
    return ccs(UIView.noIntrinsicMetric, preferredHeight+safeAreaHeight)
  }


  var contentView: UIView? = nil {
    didSet {
      oldValue?.removeFromSuperview()
      extAddSubviewIfNeeded(contentView)
      setNeedsLayout()
    }
  }

  override func layoutSubviews() {
    super.layoutSubviews()
    contentView?.frame = bounds
  }
}
