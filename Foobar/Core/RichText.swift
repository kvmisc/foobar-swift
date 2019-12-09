//
//  RichText.swift
//  Foobar
//
//  Created by Kevin Wu on 12/9/19.
//  Copyright (c) firefly.com. All rights reserved.
//

import UIKit
import Then
import TextAttributes

class RichText: Then {
  let attributedText = NSMutableAttributedString()

  func append(_ text: String, _ attribute: TextAttributes) {
    attributedText.append(NSAttributedString(string: text, attributes: attribute))
  }

  func appendLineSeparator() {
    attributedText.append(NSAttributedString(string: LINE_SEPARATOR))
  }

  func appendParagraphSeparator() {
    attributedText.append(NSAttributedString(string: PARAGRAPH_SEPARATOR))
  }
  

//  static func attributedText(_ texts: [String], _ attributes: [TextAttributes], _ separator: String? = nil) -> NSAttributedString {
//    let text = NSMutableAttributedString()
//    for (index, item) in texts.enumerated() {
//      if index < attributes.count {
//        if let separator = separator, index > 0 {
//          text.append(NSAttributedString(string: separator))
//        }
//        text.append(NSAttributedString(string: item, attributes: attributes[index]))
//      }
//    }
//    return text
//  }
}
