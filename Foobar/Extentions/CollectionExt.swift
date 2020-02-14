//
//  CollectionExt.swift
//  Foobar
//
//  Created by Kevin Wu on 2020/2/14.
//  Copyright (c) firefly.com. All rights reserved.
//

import UIKit

extension Collection {

  var extIsNonempty: Bool {
    return !isEmpty
  }

}

extension Array where Element: Equatable {

//  subscript (safe index: Int) -> Element? {
//    return (0..<count).contains(index) ? self[index] : nil
//  }

  mutating func extRemoveObject(_ object: Element) {
    if let index = firstIndex(of: object) {
      remove(at: index)
    }
  }

}
