//
//  TestReusableXXTC.swift
//  Foobar
//
//  Created by Kevin Wu on 12/9/19.
//  Copyright (c) firefly.com. All rights reserved.
//

import UIKit
import Reusable

class TestReusableXXTC: UITableViewCell, Reusable {

  func addLabel() {
    let label = UILabel()
    label.text = "fasdf"
    label.textColor = .red
    contentView.addSubview(label)
    label.frame = ccr(10, 20, 200, 30)
  }
  override func awakeFromNib() {
    super.awakeFromNib()
  }

  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
  }

}
