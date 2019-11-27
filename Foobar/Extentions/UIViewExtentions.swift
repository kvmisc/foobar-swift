//
//  UIViewExtentions.swift
//  Foobar
//
//  Created by Kevin Wu on 11/27/19.
//  Copyright (c) firefly.com. All rights reserved.
//

import UIKit

extension UIView {

  static func extLoadFromNib() -> UIView? {
    let name = String(describing: self)
    return Bundle.main.loadNibNamed(name, owner: nil, options: nil)?.last as? UIView
  }

  func extSetShadowColor(_ color: UIColor = .black,
                         opacity: Double = 0.1,
                         radius: Double = 4.0,
                         offset: CGSize = .zero) {
    self.layer.masksToBounds = false

    self.layer.shadowColor = color.cgColor;
    self.layer.shadowOpacity = Float(opacity)
    self.layer.shadowRadius = CGFloat(radius);
    self.layer.shadowOffset = offset;
  }

  func extSetRoundedCorner(_ radius: Double = 4.0,
                           corners: UIRectCorner = .allCorners,
                           backgroundColor: UIColor = .white) {
    self.backgroundColor = .clear

    let roundedLayerName = "com.firefly.layer.rounded_layer"

    self.layer.extRemoveSublayerNamed(roundedLayerName)

    let roundedLayer = CALayer()
    roundedLayer.name = roundedLayerName
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

  func extSetGradientLayer(_ gradientLayer: CAGradientLayer) {
    let roundedLayerName = "com.firefly.layer.rounded_layer"

    let roundedLayer = self.layer.extSublayerNamed(roundedLayerName)
    gradientLayer.frame = self.bounds
    (roundedLayer ?? self.layer).addSublayer(gradientLayer)
  }
}
