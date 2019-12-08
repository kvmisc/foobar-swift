//
//  UIViewExtentions.swift
//  Foobar
//
//  Created by Kevin Wu on 11/27/19.
//  Copyright (c) firefly.com. All rights reserved.
//

import UIKit

extension UIView {

  // 设置阴影
  func extSetShadow(color: UIColor = .black,
                    opacity: Double = 0.1,
                    radius: Double = 4.0,
                    offset: CGSize = .zero)
  {
    layer.masksToBounds = false

    layer.shadowColor = color.cgColor;
    layer.shadowOpacity = Float(opacity)
    layer.shadowRadius = CGFloat(radius);
    layer.shadowOffset = offset;
  }

  // 设置圆角和边框, 会切割内容
  func extSetCorner(radius: CGFloat) {
    layer.masksToBounds = true
    layer.cornerRadius = radius
  }
  func extSetBorder(width: Double = 1.0, color: UIColor = .lightGray) {
    layer.borderWidth = CGFloat(width)
    layer.borderColor = color.cgColor
  }

  // 添加圆角图层, 会切割内容, 功效和 extSetCorner 相同, 只是这里能自由选择切哪些角
  func extAddRoundedCorner(radius: Double = 4.0,
                           corners: UIRectCorner = .allCorners)
  {
    let shapeLayer = CAShapeLayer()
    let bezierPath = UIBezierPath(roundedRect: bounds,
                                  byRoundingCorners: corners,
                                  cornerRadii: CGSize(width: radius, height: radius))
    shapeLayer.path = bezierPath.cgPath
    layer.mask = shapeLayer


//    let shapeLayer = CAShapeLayer()
//    let bezierPath = UIBezierPath(roundedRect: bounds,
//                                  byRoundingCorners: corners,
//                                  cornerRadii: CGSize(width: radius, height: radius))
//    shapeLayer.path = bezierPath.cgPath
//
//    shapeLayer.backgroundColor = UIColor.green.cgColor
//    shapeLayer.fillColor = UIColor.green.cgColor
//    shapeLayer.lineWidth = 0.0
//    shapeLayer.strokeColor = UIColor.green.cgColor
//
//    shapeLayer.shadowColor = UIColor.red.cgColor;
//    shapeLayer.shadowOpacity = Float(1.0)
//    shapeLayer.shadowRadius = CGFloat(5.0);
//    shapeLayer.shadowOffset = .zero;
//
//    layer.mask = shapeLayer
//
//    self.backgroundColor = .clear
//    layer.backgroundColor = UIColor.clear.cgColor
//    layer.cornerRadius = 30
//
//    layer.backgroundColor = UIColor.clear.cgColor
//    layer.shadowColor = UIColor.red.cgColor;
//    layer.shadowOpacity = Float(1.0)
//    layer.shadowRadius = CGFloat(5.0);
//    layer.shadowOffset = .zero;
  }
  func extRemoveRoundedCorder() {
    layer.mask = nil
  }

  // 添加圆角图层, 可用于添加圆角线, 可用于添加圆角填充区, 阴影边界会跟着这个图层
  func extAddRoundedLayer(radius: Double = 4.0,
                          corners: UIRectCorner = .allCorners,
                          fillColor: UIColor = .clear,
                          borderWidth: Double = 1.0,
                          borderColor: UIColor = .lightGray)
  {
    extRemoveRoundedLayer()

    let roundedLayer = CAShapeLayer()
    roundedLayer.name = "rounded_layer"
    roundedLayer.frame = bounds
    let bezierPath = UIBezierPath(roundedRect: bounds,
                                  byRoundingCorners: corners,
                                  cornerRadii: CGSize(width: radius, height: radius))
    roundedLayer.path = bezierPath.cgPath
    roundedLayer.fillColor = fillColor.cgColor
    roundedLayer.lineWidth = CGFloat(borderWidth)
    roundedLayer.strokeColor = borderColor.cgColor

    layer.addSublayer(roundedLayer)
  }
  func extRemoveRoundedLayer() {
    layer.sublayers?.first { $0.name == "rounded_layer" }?.removeFromSuperlayer()
  }


  enum LayerName: String {
    case RoundedLayer = "rounded_layer"
    case GradientLayer = "gradient_layer"
  }

  func extAddGradientLayer(_ gradientLayer: CAGradientLayer) {
    let roundedLayer = layer.sublayers?.first { $0.name == LayerName.RoundedLayer.rawValue }
    let contentLayer = roundedLayer ?? layer
    contentLayer.sublayers?.first { $0.name == LayerName.GradientLayer.rawValue }?.removeFromSuperlayer()

    gradientLayer.frame = bounds
    gradientLayer.name = LayerName.GradientLayer.rawValue
    contentLayer.addSublayer(gradientLayer)
  }
  func extRemoveGradientLayer() {
    let roundedLayer = layer.sublayers?.first { $0.name == LayerName.RoundedLayer.rawValue }
    let contentLayer = roundedLayer ?? layer
    contentLayer.sublayers?.first { $0.name == LayerName.GradientLayer.rawValue }?.removeFromSuperlayer()
  }
}
