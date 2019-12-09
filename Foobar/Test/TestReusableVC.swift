//
//  TestReusableVC.swift
//  Foobar
//
//  Created by Kevin Wu on 12/9/19.
//  Copyright (c) firefly.com. All rights reserved.
//

import UIKit

class TestReusableVC: UIViewController {

  @IBOutlet weak var tableView: UITableView!

  override func viewDidLoad() {
    super.viewDidLoad()

    tableView.register(cellType: TestReusableTC.self)
    tableView.register(cellType: TestReusableXXTC.self)
  }
}

extension TestReusableVC : UITableViewDataSource, UITableViewDelegate {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 10
  }
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    if indexPath.row < 5 {
      let cell: TestReusableTC = tableView.dequeueReusableCell(for: indexPath)
      return cell
    }
    let cell: TestReusableXXTC = tableView.dequeueReusableCell(for: indexPath)
    cell.addLabel()
    return cell
  }
}

