//
//  UIButtonExt.swift
//  Foobar
//
//  Created by Kevin Wu on 12/8/19.
//  Copyright (c) firefly.com. All rights reserved.
//

import UIKit

extension UIButton {

  func extRemoveAllTargets() {
    removeTarget(nil, action: nil, for: .allEvents)
  }

  func extSetImage(_ image: UIImage?, _ state: UIControl.State = .normal) {
    setImage(image, for: state)
  }
  func extSetBackgroundImage(_ image: UIImage?, _ state: UIControl.State = .normal) {
    setBackgroundImage(image, for: state)
  }

  func extSetTitle(_ title: String?, _ state: UIControl.State = .normal) {
    setTitle(title, for: state)
  }
  func extSetTitleColor(_ color: UIColor?, _ state: UIControl.State = .normal) {
    setTitleColor(color, for: state)
  }
  func extSetAttributedTitle(_ title: NSAttributedString?, _ state: UIControl.State = .normal) {
    setAttributedTitle(title, for: state)
  }
}

extension UIButton {

  func extCenterHorizontally(_ spacing: CGFloat, _ swap: Bool = false) {
    if swap {
      let imageWidth = imageView?.frame.size.width ?? 0.0
      let titleWidth = titleLabel?.frame.size.width ?? 0.0

      let offset = spacing / 2.0

      let imageOffset = titleWidth + offset
      let titleOffset = imageWidth + offset

      imageEdgeInsets = UIEdgeInsets(top: 0.0, left: imageOffset, bottom: 0.0, right: -imageOffset)
      titleEdgeInsets = UIEdgeInsets(top: 0.0, left: -titleOffset, bottom: 0.0, right: titleOffset)
      contentEdgeInsets = UIEdgeInsets(top: 0, left: offset, bottom: 0, right: offset)
    } else {
      let offset = spacing / 2.0
      imageEdgeInsets = UIEdgeInsets(top: 0.0, left: -offset, bottom: 0.0, right: offset)
      titleEdgeInsets = UIEdgeInsets(top: 0.0, left: offset, bottom: 0.0, right: -offset)
      contentEdgeInsets = UIEdgeInsets(top: 0, left: offset, bottom: 0, right: offset)
    }
  }
  func extCenterVertically(_ spacing: CGFloat) {
    let imageSize = imageView?.frame.size ?? .zero
    let titleSize = titleLabel?.frame.size ?? .zero

    let titleOffsetV = (imageSize.height + spacing) / 2.0
    titleEdgeInsets = UIEdgeInsets(top: titleOffsetV, left: -imageSize.width, bottom: -titleOffsetV, right: 0.0)

    let imageOffsetV = (titleSize.height + spacing) / 2.0
    let imageOffsetH = titleSize.width / 2.0
    imageEdgeInsets = UIEdgeInsets(top: -imageOffsetV, left: imageOffsetH, bottom: imageOffsetV, right: -imageOffsetH)


    let oldHeight = max(imageSize.height, titleSize.height)
    let newHeight = imageSize.height + titleSize.height + spacing
    let offsetV = (newHeight - oldHeight) / 2.0

    let oldWidth = imageSize.width + titleSize.width
    let newWidth = max(imageSize.width, titleSize.width)
    let offsetH = (newWidth - oldWidth) / 2.0

    contentEdgeInsets = UIEdgeInsets(top: offsetV, left: offsetH, bottom: offsetV, right: offsetH)
  }

}
