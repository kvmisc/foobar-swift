//
//  UIViewExtentions.swift
//  Foobar
//
//  Created by Kevin Wu on 11/27/19.
//  Copyright (c) firefly.com. All rights reserved.
//

import UIKit

extension UIView {

  func extSetBorder(width: Double = 1.0, color: UIColor = .black) {
    layer.borderWidth = CGFloat(width)
    layer.borderColor = color.cgColor
  }

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

  enum LayerName: String {
    case RoundedLayer = "rounded_layer"
    case GradientLayer = "gradient_layer"
  }

  func extSetRoundedCorner(radius: Double = 4.0,
                           corners: UIRectCorner = .allCorners,
                           color: UIColor = .white)
  {
    backgroundColor = .clear

    layer.sublayers?.first { $0.name == LayerName.RoundedLayer.rawValue }?.removeFromSuperlayer()

    let roundedLayer = CALayer()
    roundedLayer.name = LayerName.RoundedLayer.rawValue
    roundedLayer.frame = bounds
    roundedLayer.backgroundColor = color.cgColor

    let shapeLayer = CAShapeLayer()
    let bezierPath = UIBezierPath(roundedRect: bounds,
                                  byRoundingCorners: corners,
                                  cornerRadii: CGSize(width: radius, height: radius))
    shapeLayer.path = bezierPath.cgPath
    roundedLayer.mask = shapeLayer

    layer.addSublayer(roundedLayer)
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
