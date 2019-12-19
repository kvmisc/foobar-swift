//
//  TestStaticVC.swift
//  Foobar
//
//  Created by Kevin Wu on 12/19/19.
//  Copyright (c) firefly.com. All rights reserved.
//

import UIKit
import Reusable

class TestStaticVC: BaseViewController {

  var lines: [UIView] = []

  lazy var tableView: UITableView = {
    let ret = UITableView(frame: .zero, style: .plain)
    ret.delegate = self
    ret.dataSource = self
    return ret
  }()

  let bt: UIButton = {
    let ret = UIButton(type: .system)
    ret.extSetTitleColor(.red)
    ret.titleLabel?.font = UIFont.systemFont(ofSize: 16)
    ret.extSetTitle("asdf")
    return ret
  }()

  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white

    contentView?.addSubview(tableView)
    tableView.register(cellType: TestStaticCell.self)
    tableView.extSetBorder()
    tableView.extOccupySuperview()
    disableContentInsetAdjustment(tableView)

    for i in 1...5 {
      let v = TestStaticBodyView()
      switch i {
      case 1: v.backgroundColor = .red
      case 2: v.backgroundColor = .green
      case 3: v.backgroundColor = .blue
      case 4: v.backgroundColor = .purple
      case 5: v.backgroundColor = .brown
      default: v.backgroundColor = .yellow
      }
      lines.append(v)
    }
//    let v = TestStaticBodyView()
//    v.backgroundColor = .red
//    lines.append(v)
  }

}

extension TestStaticVC: UITableViewDataSource, UITableViewDelegate {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return lines.count
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell: TestStaticCell = tableView.dequeueReusableCell(for: indexPath)
    cell.bodyView = lines[indexPath.row]
    return cell
  }

  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return lines[indexPath.row].extIntrinsicContentHeight
  }
}

class TestStaticBodyView: UIView {
  override var intrinsicContentSize: CGSize {
    return ccs(UIView.noIntrinsicMetric, 55.0)
  }
}

class TestStaticCell: UITableViewCell, Reusable {

  var bodyView: UIView? = nil {
    didSet {
      oldValue?.removeFromSuperview()
      contentView.extAddSubviewIfNeeded(bodyView)
      setNeedsUpdateConstraints()
    }
  }

  override func updateConstraints() {
    bodyView?.snp.remakeConstraints({ (make) in
      make.edges.equalToSuperview()
    })
    super.updateConstraints()
  }

}

