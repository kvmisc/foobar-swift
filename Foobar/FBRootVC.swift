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

    let redView = UIImageView()
    redView.image = cci("grass")
    redView.contentMode = .scaleToFill
//    redView.backgroundColor = .red
    view.addSubview(redView)
    redView.frame = ccr(50, 100, 200, 100)

//    redView.extSetCorner(radius: 10.0)
//    redView.extSetBorder()
//    redView.clipsToBounds = true
//    redView.extAddRoundedLayer(radius: 30, corners: [.topLeft, .topRight], color: .brown)
//    redView.extAddRoundedBorder(radius: 30,
//                                corners: [.topLeft,.topRight],
//                                fillColor: .clear,
//                                borderWidth: 1.0,
//                                borderColor: .red)

    redView.extAddRoundedCorner(radius: 30.0, corners: [.topLeft,.topRight])

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
