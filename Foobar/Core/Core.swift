//
//  Core.swift
//  Foobar
//
//  Created by Kevin Wu on 12/9/19.
//  Copyright (c) firefly.com. All rights reserved.
//

import UIKit

// "\n", "\r", "\r\n" 来断行不确定
// Unicode 定义了两个明确的字符来断行和分段, NSAttributedString 中用断行符不会产生段落
let LINE_SEPARATOR      = "\u{2028}"
let PARAGRAPH_SEPARATOR = "\u{2029}"
