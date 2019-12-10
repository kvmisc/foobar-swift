//
//  RichText.swift
//  Foobar
//
//  Created by Kevin Wu on 12/9/19.
//  Copyright (c) firefly.com. All rights reserved.
//

import UIKit
import TextAttributes

class RichText {
  var attributedText = NSMutableAttributedString()

  func append(_ text: String, _ attribute: TextAttributes) {
    attributedText.append(NSAttributedString(string: text, attributes: attribute))
  }
  func appendLineSeparator() {
    attributedText.append(NSAttributedString(string: LINE_SEPARATOR))
  }
  func appendParagraphSeparator() {
    attributedText.append(NSAttributedString(string: PARAGRAPH_SEPARATOR))
  }

  func reset() {
    attributedText = NSMutableAttributedString()
  }
}
