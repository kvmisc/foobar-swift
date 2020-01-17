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
let SEPARATOR_LINE      = "\u{2028}"
let SEPARATOR_PARAGRAPH = "\u{2029}"

class RichText {
  var attributedText = NSMutableAttributedString()

  func append(_ text: String, _ config: (TextAttributes)->Void) -> RichText {
    let attribute = TextAttributes()
    config(attribute)
    attributedText.append(NSAttributedString(string: text, attributes: attribute))
    return self
  }
  func appendSeparatorLine() -> RichText {
    attributedText.append(NSAttributedString(string: SEPARATOR_LINE))
    return self
  }
  func appendSeparatorParagraph() -> RichText {
    attributedText.append(NSAttributedString(string: SEPARATOR_PARAGRAPH))
    return self
  }

  func reset() {
    attributedText = NSMutableAttributedString()
  }

}
