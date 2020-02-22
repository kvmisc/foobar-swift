//
//  FloatingPointExt.swift
//  Foobar
//
//  Created by Kevin Wu on 12/8/19.
//  Copyright (c) firefly.com. All rights reserved.
//

import UIKit

extension FloatingPoint {

  func extIsEqual(_ to: Self) -> Bool {
    return ( abs(self - to) < Self.ulpOfOne )
  }

}
