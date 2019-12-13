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

  var preferredHeight: CGFloat = 0.0

  var contentView: UIView? = nil {
    didSet {
      oldValue?.removeFromSuperview()
      extAddSubviewIfNeeded(contentView)
      setNeedsLayout()
    }
  }

  override var intrinsicContentSize: CGSize {
    if preferredHeight > 0.0 {
      return CGSize(width: UIView.noIntrinsicMetric, height: preferredHeight)
    }
    if let contentView = contentView {
      return contentView.intrinsicContentSize
    }
    return CGSize(width: UIView.noIntrinsicMetric, height: ToolBar.defaultHeight)
  }

  override func layoutSubviews() {
    super.layoutSubviews()
    contentView?.frame = bounds
  }
}
