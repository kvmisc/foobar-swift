//
//  FBRootVC.swift
//  Foobar
//
//  Created by Kevin Wu on 11/29/19.
//  Copyright (c) firefly.com. All rights reserved.
//

import UIKit
import Alamofire

class FBRootVC: UIViewController {

  let frame = UIView().then {
    $0.backgroundColor = .red
  }

  @IBOutlet weak var tableView: UITableView!

  override func viewDidLoad() {
    super.viewDidLoad()

    tableView.register(cellType: FBRootCell.self)
    tableView.rowHeight = 44

    let sm = SessionManager.default
    print(sm.session.configuration.httpAdditionalHeaders)
    sm.session.configuration.httpAdditionalHeaders = ["aa":"bb"]
    sm.request("https://www.baidu.com/",
               method: .get,
               parameters: nil,
               encoding: URLEncoding.queryString,
               headers: nil)

  }

  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
  }
}

extension FBRootVC : UITableViewDataSource, UITableViewDelegate {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 5
  }
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell: FBRootCell = tableView.dequeueReusableCell(for: indexPath)
    cell.titleLabel.text = "asdf"
    return cell
  }
}
