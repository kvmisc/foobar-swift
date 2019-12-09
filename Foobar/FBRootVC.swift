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


//    bt.setImage(cci("fav"), for: .normal)
//    bt.setTitle("Adding", for: .normal)
//    bt.setTitleColor(.red, for: .normal)


//    bt.titleLabel?.numberOfLines = 0
//    bt.titleLabel?.textAlignment = .center
//    bt.extSetTitle("关注\n523493")
//    bt.extSetTitleColor(.red)

    let attr1 = TextAttributes()
      .font(ccf(16))
      .foregroundColor(.red)
      .alignment(.center)
      .paragraphSpacing(10) // 两行间距
    let attributedText = NSMutableAttributedString(string: "关注", attributes: attr1)

    attributedText.append(NSAttributedString(string: "\n"))

    let attr2 = TextAttributes()
      .font(ccf(12))
      .foregroundColor(.darkGray)
      .alignment(.center)
    attributedText.append(NSAttributedString(string: "5", attributes: attr2))

    bt.titleLabel?.numberOfLines = 0
    bt.titleLabel?.textAlignment = .center
    bt.extSetAttributedTitle(attributedText)


    bt.imageView?.extSetBorder()
    bt.titleLabel?.extSetBorder()

    bt.extAddTarget(self, #selector(doxx(_:)))
    //bt.addTarget(self, action: #selector(doxx(_:)), for: .touchUpInside)



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
