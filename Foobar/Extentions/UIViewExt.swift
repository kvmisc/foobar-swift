//
//  UIViewExtentions.swift
//  Foobar
//
//  Created by Kevin Wu on 11/27/19.
//  Copyright (c) firefly.com. All rights reserved.
//

import UIKit

extension UIView {
  func extSendToBack() {
    self.superview?.sendSubviewToBack(self)
  }
  func extBringToFront() {
    self.superview?.bringSubviewToFront(self)
  }

  func extImageRep() -> UIImage {
    let renderer = UIGraphicsImageRenderer(bounds: bounds)
    return renderer.image { (ctx) in
      layer.render(in: ctx.cgContext)
    }
  }

  func extUseAutoLayout() {
    translatesAutoresizingMaskIntoConstraints = false
  }

  func extAddSubviews(_ views : [UIView]) {
    for view in views {
      addSubview(view)
    }
  }
  func extAddSubviewIfNeeded(_ view: UIView?) {
    guard let view = view else { return }
    if view.superview != self {
      view.removeFromSuperview()
      addSubview(view)
    }
  }
  func extRemoveAllSubviews() {
    subviews.forEach { (view) in
      view.removeFromSuperview()
    }
  }
}

extension UIView {

  //////////////////////////////////////////////////////////////////////////////
  // 不要阴影
  //
  // 设置四角全圆, 会切割内容
  func extSetCorner(radius: CGFloat) {
    layer.masksToBounds = true
    layer.cornerRadius = radius
  }
  // 设置四角全圆边框
  func extSetBorder(width: Double = 1.0, color: UIColor = .lightGray) {
    layer.borderWidth = CGFloat(width)
    layer.borderColor = color.cgColor
  }
  // 添加部分圆角, 会切割内容
  func extAddRoundedCorner(radius: Double = 4.0, corners: UIRectCorner = .allCorners)
  {
    let shapeLayer = CAShapeLayer()
    let bezierPath = UIBezierPath(roundedRect: bounds,
                                  byRoundingCorners: corners,
                                  cornerRadii: CGSize(width: radius, height: radius))
    shapeLayer.path = bezierPath.cgPath
    layer.mask = shapeLayer
  }
  func extRemoveRoundedCorder() {
    layer.mask = nil
  }
  // 设置部分圆角边框
  func extAddRoundedBorder(radius: Double = 4.0,
                           corners: UIRectCorner = .allCorners,
                           width: Double = 1.0,
                           color: UIColor = .lightGray)
  {
    extRemoveRoundedLayer()

    let roundedLayer = CAShapeLayer()
    roundedLayer.name = "rounded_border_layer"
    roundedLayer.frame = bounds
    let bezierPath = UIBezierPath(roundedRect: bounds,
                                  byRoundingCorners: corners,
                                  cornerRadii: CGSize(width: radius, height: radius))
    roundedLayer.path = bezierPath.cgPath
    roundedLayer.fillColor = UIColor.clear.cgColor
    roundedLayer.lineWidth = CGFloat(width)
    roundedLayer.strokeColor = color.cgColor

    layer.addSublayer(roundedLayer)
  }
  func extRemoveRoundedBorder() {
    layer.sublayers?.first { $0.name == "rounded_border_layer" }?.removeFromSuperlayer()
  }

  //////////////////////////////////////////////////////////////////////////////
  // 需要阴影
  //
  // a) 如果内容不是纯色, 将内容视图切割好, 放到另一视图中, 在其中做阴影
  //
  //  let contentView = UIImageView()
  //  contentView.image = cci("grass")
  //  contentView.backgroundColor = .clear
  //  contentView.contentMode = .scaleToFill
  //  contentView.frame = ccr(0, 0, 50, 40)
  //  contentView.extAddRoundedCorner(radius: 10.0, corners: [.topLeft, .topRight])
  //
  //  let boxView = UIView()
  //  view.addSubview(boxView)
  //  boxView.addSubview(contentView)
  //  boxView.frame = ccr(100, 100, 50, 40)
  //  boxView.backgroundColor = .clear
  //  boxView.extSetShadow()
  //
  // b) 如果内容背景是纯色, 不需要另一视图就能做阴影
  //
  //  let contentView = UIView()
  //  contentView.backgroundColor = .clear
  //  contentView.frame = ccr(100, 100, 50, 40)
  //  view.addSubview(contentView)
  //  contentView.extAddRoundedLayer(radius: 10, corners: [.topLeft, .topRight], color: .brown)
  //  contentView.extSetShadow(opacity: 1.0)

  // 设置阴影
  func extSetShadow(color: UIColor = .black,
                    opacity: Double = 0.5,
                    radius: Double = 5.0,
                    offset: CGSize = .zero)
  {
    layer.masksToBounds = false

    layer.shadowColor = color.cgColor
    layer.shadowOpacity = Float(opacity)
    layer.shadowRadius = CGFloat(radius)
    layer.shadowOffset = offset
  }
  // 添加部分圆角图层, 阴影边界会跟着这个图层
  func extRoundedLayer() -> CAShapeLayer? {
    return layer.sublayers?.first { $0.name == "rounded_layer" } as? CAShapeLayer
  }
  func extAddRoundedLayer(radius: Double = 4.0,
                          corners: UIRectCorner = .allCorners,
                          color: UIColor = .clear)
  {
    extRemoveRoundedLayer()

    let roundedLayer = CAShapeLayer()
    roundedLayer.name = "rounded_layer"
    roundedLayer.frame = bounds
    let bezierPath = UIBezierPath(roundedRect: bounds,
                                  byRoundingCorners: corners,
                                  cornerRadii: CGSize(width: radius, height: radius))
    roundedLayer.path = bezierPath.cgPath
    roundedLayer.fillColor = color.cgColor
    roundedLayer.lineWidth = 0.0
    roundedLayer.strokeColor = color.cgColor

    layer.addSublayer(roundedLayer)
  }
  func extRemoveRoundedLayer() {
    layer.sublayers?.first { $0.name == "rounded_layer" }?.removeFromSuperlayer()
  }
}
