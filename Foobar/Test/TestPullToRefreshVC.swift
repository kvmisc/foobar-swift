//
//  TestPullToRefreshVC.swift
//  Foobar
//
//  Created by Kevin Wu on 12/17/19.
//  Copyright (c) firefly.com. All rights reserved.
//

import UIKit
import Reusable
import ESPullToRefresh
import Async

class TestPullToRefreshVC: UIViewController {

  let tableView: UITableView = {
    let ret = UITableView(frame: .zero, style: .plain)
    ret.register(cellType: TestPullToRefreshCell.self)
    return ret
  }()

  var list: [String] = []
  var prevList: [String] = []
  var nextList: [String] = []

  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white

    tableView.dataSource = self
    view.addSubview(tableView)
    tableView.extSetBorder()
    tableView.snp.makeConstraints { (make) in
      make.edges.equalToSuperview().inset(cce(STATUS_BAR_HET, 0, 100, 0))
    }
    setup()

    let bt = UIButton(type: .system)
    bt.extSetTitle("AAA")
    view.addSubview(bt)
    bt.extAddTarget(self, #selector(addMoreData(_:)))
    bt.extSetBorder()
    bt.snp.makeConstraints { (make) in
      make.top.equalToSuperview().offset(STATUS_BAR_HET)
      make.right.equalToSuperview()
    }
  }

  func setup() {
    list = ["AA", "BB", "CC", "DD"]
    for i in 1...20 {
      prevList.append("\(i)")
    }
//    for i in 1...20 {
//      nextList.insert("\(i)", at: 0)
//    }


    tableView.extAddRefreshHeader { [unowned self] in
      self.loadPrev()
    }
  }

  func loadPrev() {
    Async.main(after: 3.0) {
      self.prevComplete()
    }
  }
  func prevComplete() {
    list = prevList.suffix(5) + list
    prevList = prevList.dropLast(5)
    tableView.reloadData()

    let index = 1
    let hasMore = !nextList.isEmpty

    if index == 1 {
      tableView.extStopRefreshHeader()
      tableView.extAddRefreshFooter(hasMore) { [unowned self] in self.loadNext() }
    } else {
      tableView.extStopRefreshFooter(hasMore)
    }

  }

  func loadNext() {
    Async.main(after: 3.0) {
      self.nextComplete()
    }
  }
  func nextComplete() {
    list = list + nextList.prefix(5)
    nextList = Array(nextList.dropFirst(5))
    tableView.reloadData()

    tableView.extStopRefreshFooter(!nextList.isEmpty)
  }

  @objc func addMoreData(_ sender: UIButton) {
    for i in 1...20 {
      nextList.insert("\(i)", at: 0)
    }
  }

}

extension TestPullToRefreshVC : UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return list.count
  }
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell: TestPullToRefreshCell = tableView.dequeueReusableCell(for: indexPath)
    cell.textLabel?.text = list[indexPath.row]
    return cell
  }
}

class TestPullToRefreshCell: UITableViewCell, Reusable {
}
