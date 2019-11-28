//
//  CALayerExtentions.swift
//  Foobar
//
//  Created by Kevin Wu on 11/27/19.
//  Copyright (c) firefly.com. All rights reserved.
//

import UIKit

extension CALayer {

  func extSublayerNamed(_ name: String) -> CALayer? {
    if name.isEmpty { return nil }
    if let layerAry = self.sublayers {
      for item in layerAry {
        if let layerName = item.name, layerName == name {
          return item
        }
      }
    }
    return nil
  }

  func extRemoveSublayerNamed(_ name: String) {
    if name.isEmpty { return }
    if let layerAry = self.sublayers {
      for item in layerAry {
        if let layerName = item.name, layerName == name {
          item.removeFromSuperlayer()
        }
      }
    }
  }

}
