//
//  UIViewExtentions.swift
//  Foobar
//
//  Created by Kevin Wu on 11/27/19.
//  Copyright (c) firefly.com. All rights reserved.
//

import UIKit

extension UIView {

  struct LayerName {
    static let RoundedLayer = "com.firefly.layer.rounded_layer"
    static let GradientLayer = "com.firefly.layer.gradient_layer"
  }

  func extSetBorderWidth(_ width: Double = 1.0, color: UIColor = .black) {
    self.layer.borderWidth = CGFloat(width)
    self.layer.borderColor = color.cgColor
  }

  func extSetShadowColor(_ color: UIColor = .black,
                         opacity: Double = 0.1,
                         radius: Double = 4.0,
                         offset: CGSize = .zero)
  {
    self.layer.masksToBounds = false

    self.layer.shadowColor = color.cgColor;
    self.layer.shadowOpacity = Float(opacity)
    self.layer.shadowRadius = CGFloat(radius);
    self.layer.shadowOffset = offset;
  }

  func extSetRoundedCorner(_ radius: Double = 4.0,
                           corners: UIRectCorner = .allCorners,
                           backgroundColor: UIColor = .white)
  {
    self.backgroundColor = .clear

    self.layer.extRemoveSublayerNamed(LayerName.RoundedLayer)

    let roundedLayer = CALayer()
    roundedLayer.name = LayerName.RoundedLayer
    roundedLayer.frame = self.bounds
    roundedLayer.backgroundColor = backgroundColor.cgColor

    let shapeLayer = CAShapeLayer()
    let bezierPath = UIBezierPath(roundedRect: self.bounds,
                                  byRoundingCorners: corners,
                                  cornerRadii: CGSize(width: radius, height: radius))
    shapeLayer.path = bezierPath.cgPath
    roundedLayer.mask = shapeLayer

    self.layer.addSublayer(roundedLayer)
  }

  func extAddGradientLayer(_ gradientLayer: CAGradientLayer) {
    let roundedLayer = self.layer.extSublayerNamed(LayerName.RoundedLayer)
    let contentLayer = roundedLayer ?? self.layer
    contentLayer.extRemoveSublayerNamed(LayerName.GradientLayer)

    gradientLayer.frame = self.bounds
    gradientLayer.name = LayerName.GradientLayer
    contentLayer.addSublayer(gradientLayer)
  }
  func extRemoveGradientLayer() {
    let roundedLayer = self.layer.extSublayerNamed(LayerName.RoundedLayer)
    let contentLayer = roundedLayer ?? self.layer
    contentLayer.extRemoveSublayerNamed(LayerName.GradientLayer)
  }
}
