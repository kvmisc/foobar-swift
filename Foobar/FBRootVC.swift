//
//  FBRootVC.swift
//  Foobar
//
//  Created by Kevin Wu on 11/29/19.
//  Copyright (c) firefly.com. All rights reserved.
//

import UIKit
import Alamofire
import SnapKit
import SwiftyJSON
import WLEmptyState
import MBProgressHUD
import YYModel
import Async
import IHKeyboardAvoiding
import DeviceKit
import TextAttributes

class FBRootVC: UIViewController, WLEmptyStateDataSource, WLEmptyStateDelegate {

  let frame = UIView().then {
    $0.backgroundColor = .red
  }

  @IBOutlet weak var tableView: UITableView!
  @IBOutlet weak var aaaBt: UIButton!
  
  @IBAction func doit(_ sender: Any) {
    print("hehe")
  }
  override func viewDidLoad() {
    super.viewDidLoad()


    let bt = UIButton(type: .custom)
    view.addSubview(bt)
    bt.snp.makeConstraints { (make) in
      make.top.equalToSuperview().offset(150)
      make.centerX.equalToSuperview()
//      make.width.equalTo(100)
//      make.height.equalTo(100)
    }

//    Async.main(after: 3.0) {
//    }

  }

  @objc func doxx(_ sender: UIButton) {
    print("doit")
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
