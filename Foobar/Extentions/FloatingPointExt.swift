//
//  FloatingPointExt.swift
//  Foobar
//
//  Created by Kevin Wu on 12/8/19.
//  Copyright (c) firefly.com. All rights reserved.
//

import UIKit

extension FloatingPoint {
  // 保留 xxx 位, 四舍五入
  // 1.12351234 -> 1.124
  // https://codereview.stackexchange.com/questions/142748/swift-floatingpoint-rounded-to-places
  func extRound(_ places: Int) -> Self {
    guard places >= 0 else { return self }
    var divisor: Self = 1
    for _ in 0..<places { divisor *= 10 }
    return (self * divisor).rounded() / divisor
  }
  // 保留 xxx 位, 向下
  // 1.12351234 -> 1.123
  func extFloor(_ places: Int) -> Self {
    guard places >= 0 else { return self }
    var divisor: Self = 1
    for _ in 0..<places { divisor *= 10 }
    return floor(self * divisor) / divisor
  }
  // 保留 xxx 位, 向上
  // 1.12351234 -> 1.124
  func extCeil(_ places: Int) -> Self {
    guard places >= 0 else { return self }
    var divisor: Self = 1
    for _ in 0..<places { divisor *= 10 }
    return ceil(self * divisor) / divisor
  }

  // 相等判断
  func extEqual(_ value: Self) -> Bool {
    return ( abs(self - value) < Self.ulpOfOne )
  }
}
