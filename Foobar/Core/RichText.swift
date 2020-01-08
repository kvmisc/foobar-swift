//
//  RichText.swift
//  Foobar
//
//  Created by Kevin Wu on 12/9/19.
//  Copyright (c) firefly.com. All rights reserved.
//

import UIKit
import TextAttributes

// "\n", "\r", "\r\n" 来断行时，行为不确定
// Unicode 定义了两个明确的字符来断行和分段, NSAttributedString 中用断行符不会产生段落
let LINE_SEPARATOR      = "\u{2028}"
let PARAGRAPH_SEPARATOR = "\u{2029}"

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
