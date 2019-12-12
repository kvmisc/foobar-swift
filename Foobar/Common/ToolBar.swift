//
//  ToolBar.swift
//  Foobar
//
//  Created by Kevin Wu on 12/12/19.
//  Copyright (c) firefly.com. All rights reserved.
//

import UIKit

class ToolBar: UIView {
  var contentView: UIView? = nil {
    willSet { contentView?.removeFromSuperview() }
    didSet {
      extAddSubviewIfNeeded(contentView)
      setNeedsLayout()
    }
  }

  override var intrinsicContentSize: CGSize {
    if let contentView = contentView {
      return contentView.intrinsicContentSize
    }
    return ccs(UIView.noIntrinsicMetric)
  }

  override func layoutSubviews() {
    super.layoutSubviews()
    contentView?.frame = bounds
  }
}
