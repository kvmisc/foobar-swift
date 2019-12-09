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
  @IBOutlet weak var aaaBt: UIButton!
  
  @IBAction func doit(_ sender: Any) {
    print("hehe")
  }
  override func viewDidLoad() {
    super.viewDidLoad()

//    Async.main(after: 4.0) {
//      print("sdf")
//      self.aaaBt.extRemoveAllTargets()
//    }

    let bt = UIButton(type: .custom)
    view.addSubview(bt)
    bt.snp.makeConstraints { (make) in
      make.top.equalToSuperview().offset(150)
      make.centerX.equalToSuperview()
//      make.width.equalTo(100)
//      make.height.equalTo(100)
    }


    bt.setImage(cci("fav"), for: .normal)
    bt.setTitle("Adding", for: .normal)
    bt.setTitleColor(.red, for: .normal)

    bt.extSetBorder()
    bt.titleLabel?.extSetBorder()
    bt.imageView?.extSetBorder()

    Async.main(after: 3.0) {
      //bt.extCenterHorizontally(6.0)
      print(bt.frame)
      bt.extCenterVertically(6.0)
      print(bt.frame)
      
//      print(self.aaaBt.intrinsicContentSize)
//      self.aaaBt.snp.makeConstraints { (make) in
//        let size = self.aaaBt.intrinsicContentSize
//        print(size)
//        make.width.equalTo(size.width).offset(5.0)
//      }
    }

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
    contentView.backgroundColor = .red
    contentView.frame = ccr(100, 100, 50, 40)
    view.addSubview(contentView)
    contentView.extAddRoundedCorner(radius: 10, corners: [.topLeft, .topRight])
//    contentView.extAddRoundedBorder(radius: 10, corners: [.topLeft, .topRight], width: 1, color: .white)
//    contentView.extAddRoundedLayer(radius: 10, corners: [.topLeft, .topRight], color: .brown)
    contentView.extSetShadow(color: .blue, opacity: 1.0)

    let image = contentView.extImageRep()
    print(image)


    Async.main(after: 5.0) {
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
