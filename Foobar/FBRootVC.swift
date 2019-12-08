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

class FBRootVC: UIViewController, WLEmptyStateDataSource, WLEmptyStateDelegate {

  let frame = UIView().then {
    $0.backgroundColor = .red
  }

  @IBOutlet weak var tableView: UITableView!

  override func viewDidLoad() {
    super.viewDidLoad()

//    view.backgroundColor = .darkGray



//    let contentView = UIImageView()
//    contentView.image = cci("grass")
//    contentView.backgroundColor = .clear
//    contentView.contentMode = .scaleToFill
//    contentView.frame = ccr(0, 0, 50, 40)
//    //contentView.extAddRoundedCorner(radius: 10.0, corners: [.topLeft, .topRight])
//
//    let boxView = UIView()
//    view.addSubview(boxView)
//    boxView.addSubview(contentView)
//    boxView.frame = ccr(100, 100, 50, 40)
//    boxView.backgroundColor = .clear
//    boxView.extSetShadow()

    let contentView = UIView()
    contentView.backgroundColor = .clear
    contentView.frame = ccr(100, 100, 50, 40)
    view.addSubview(contentView)
    contentView.extAddRoundedLayer(radius: 10, corners: [.topLeft, .topRight], color: .brown)
    contentView.extSetShadow(opacity: 1.0)


    Async.main(after: 3.0) {
//      redView.extRemoveRoundedCorder()
//      redView.extRemoveRoundedBorder()
    }

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
