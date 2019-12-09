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

  let richText = RichText().then {

    let attr1 = TextAttributes()
      .font(ccf(16))
      .foregroundColor(.red)
      .alignment(.center)
      .lineSpacing(10) // 行间距
    $0.append("关注", attr1)

    $0.appendLineSeparator()

    let attr2 = TextAttributes()
      .font(ccf(12))
      .foregroundColor(.darkGray)
      .alignment(.center)
    $0.append("125", attr2)
  }
  bt.extSetAttributedTitle(richText.attributedText)
  bt.titleLabel?.numberOfLines = 0

}

