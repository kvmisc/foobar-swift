//
//  Base64.swift
//  Foobar
//
//  Created by Kevin Wu on 12/6/19.
//  Copyright (c) firefly.com. All rights reserved.
//

import UIKit
import TextAttributes

func doTestMultiLineButton(_ bt: UIButton) {

  let richText = RichText()

  richText.append("关注") { (ta) in
    ta.font(ccf(16))
      .foregroundColor(.red)
      .alignment(.center)
      .lineSpacing(10) // 行间距
  }

  richText.appendSeparatorLine()

  richText.append("125") { (ta) in
    ta.font(ccf(12))
      .foregroundColor(.darkGray)
      .alignment(.center)
  }

  bt.extSetAttributedTitle(richText.attributedText)
  bt.titleLabel?.numberOfLines = 0

}

