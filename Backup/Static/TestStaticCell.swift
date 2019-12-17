//
//  TestStaticCell.swift
//  Foobar
//
//  Created by Kevin Wu on 12/11/19.
//  Copyright (c) firefly.com. All rights reserved.
//

import UIKit
import Static

class TestStaticCell: UITableViewCell, Cell {

  @IBOutlet weak var titleLabel: UILabel!

  override func awakeFromNib() {
    super.awakeFromNib()
  }

  static func nib() -> UINib? {
    return UINib(nibName: String(describing: self), bundle: nil)
  }
  func configure(row: Row) {
    titleLabel.text = row.text
    titleLabel.text = row.context?["name"] as? String
  }
}
