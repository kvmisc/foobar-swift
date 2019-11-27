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
    guard !(name.isEmpty) else { return nil }
    guard self.sublayers != nil else { return nil }

    for it in self.sublayers! {
      let layerName = it.name ?? ""
      if layerName==name {
        return it
      }
    }
    return nil
  }

  func extRemoveSublayerNamed(_ name: String) {
    guard !(name.isEmpty) else { return }
    guard self.sublayers != nil else { return }

    for it in self.sublayers! {
      let layerName = it.name ?? ""
      if layerName==name {
        it.removeFromSuperlayer()
      }
    }
  }

}
