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
  // 制作阴影
  //
  // a) 如果内容不是纯色, 将内容视图切割好, 放到另一视图中, 在其中做阴影
  //
  //  let contentView = UIImageView(image: cci("grass"))
  //  contentView.contentMode = .scaleToFill
  //  contentView.frame = ccr(10, 10, 100, 40)
  //
  //  let boxView = UIView()
  //  view.addSubview(boxView)
  //  boxView.addSubview(contentView)
  //  boxView.frame = ccr(100, 100, 120, 60)
  //
  //> contentView.extMaskRoundedLayer(radius: 20.0, corners: [.topLeft, .topRight])
  //> boxView.backgroundColor = .clear
  //> boxView.extSetShadow(color: .red, opacity: 1.0, radius: 5.0, offset: .zero)
  //
  // b) 如果内容背景是纯色, 不需要另一视图就能做阴影
  //
  //  let contentView = UIView()
  //  contentView.frame = ccr(100, 100, 100, 40)
  //  view.addSubview(contentView)
  //
  //> contentView.backgroundColor = .clear
  //> contentView.extAddRoundedLayer(radius: 10.0,
  //>                                corners: [.topLeft, .topRight],
  //>                                borderWidth: 0.0,
  //>                                borderColor: .brown,
  //>                                fillColor: .brown)
  //> contentView.extSetShadow(color: .red, opacity: 1.0, radius: 5.0, offset: .zero)

  //////////////////////////////////////////////////////////////////////////////
  // 制作边框
  //
  //  let contentView = UIImageView(image: cci("grass"))
  //  contentView.contentMode = .scaleToFill
  //  contentView.frame = ccr(100, 100, 100, 40)
  //  view.addSubview(contentView)
  //
  //  // 四角全圆
  //  contentView.extSetCorner(radius: 10.0)
  //  contentView.extSetBorder(width: 2.0, color: .red)
  //
  //  // 部分圆角
  //  contentView.extMaskRoundedLayer(radius: 10.0, corners: [.topLeft, .topRight])
  //  contentView.extAddRoundedLayer(radius: 10.0,
  //                                 corners: [.topLeft, .topRight],
  //                                 borderWidth: 2.0,
  //                                 borderColor: .red,
  //                                 fillColor: .clear)

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

  // 设置边框
  func extSetBorder(width: Double = 1.0, color: UIColor = .lightGray) {
    layer.borderWidth = CGFloat(width)
    layer.borderColor = color.cgColor
  }

  // 设置圆角
  func extSetCorner(radius: Double = 4.0) {
    layer.masksToBounds = true
    layer.cornerRadius = CGFloat(radius)
  }


  // 遮罩圆角, 如果视图设置了阴影, 阴影会被切掉
  func extMaskRoundedLayer(radius: Double = 4.0, corners: UIRectCorner = .allCorners) {
    let shapeLayer = CAShapeLayer()
    let bezierPath = UIBezierPath(roundedRect: bounds,
                                  byRoundingCorners: corners,
                                  cornerRadii: CGSize(width: radius, height: radius))
    shapeLayer.path = bezierPath.cgPath
    layer.mask = shapeLayer
  }
  func extUnmaskRoundedLayer() {
    layer.mask = nil
  }

  // 添加圆角/有边框/无填充图层, 如果视图设置了阴影, 阴影会绕着这个图层的边界, 由于图层无填充, 边框内外都有阴影
  // 添加圆角/无边框/有填充图层, 如果视图设置了阴影, 阴影会绕着这个图层的边界
  func extAddRoundedLayer(radius: Double = 4.0,
                          corners: UIRectCorner = .allCorners,
                          borderWidth: Double = 1.0,
                          borderColor: UIColor = .lightGray,
                          fillColor: UIColor = .white)
  {
    extRemoveRoundedLayer()

    let roundedLayer = CAShapeLayer()
    roundedLayer.name = "rounded_border_layer"
    roundedLayer.frame = bounds
    let bezierPath = UIBezierPath(roundedRect: bounds,
                                  byRoundingCorners: corners,
                                  cornerRadii: CGSize(width: radius, height: radius))
    roundedLayer.path = bezierPath.cgPath
    roundedLayer.lineWidth = CGFloat(borderWidth)
    roundedLayer.strokeColor = borderColor.cgColor
    roundedLayer.fillColor = fillColor.cgColor

    layer.addSublayer(roundedLayer)
  }
  func extRemoveRoundedLayer() {
    layer.sublayers?.first { $0.name == "rounded_border_layer" }?.removeFromSuperlayer()
  }
}
