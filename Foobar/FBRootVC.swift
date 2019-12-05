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

  let stackView: UIStackView = {
    let ret = UIStackView()
    return ret
  }()


  let keyWindow: UIWindow = {
    let ret = UIWindow(frame: UIScreen.main.bounds)
    ret.windowLevel = .normal + 100
    ret.backgroundColor = UIColor.clear
//    let vc = UIViewController()
//    vc.view.backgroundColor = .lightGray
    ret.rootViewController = FBPopupVC()
    return ret
  }()
  func show() {
    //previousWindow = UIApplication.shared.keyWindow
    keyWindow.makeKeyAndVisible()
  }

  func enableScrollForEmptyState() -> Bool {
    return false
  }

  @objc func buttonClicked(sender: UIButton) {
    print("in show")
//    show()
//    MBProgressHUD.showAdded(to: self.view, animated: true)

//    HUD.showActivity(inView: self.view)
    HUD.showActivity(inView: self.view, info: "加载中...")


//    HUD.showInfo(inView: self.view, info: "加载失败")
//    HUD.showInfo(inView: self.view, info: "加载完成") {
//      print("in complete 1")
//    }

    DispatchQueue.main.asyncAfter(wallDeadline: .now()+1.0) {
      HUD.showInfo(inView: self.view, info: "加载成功")
      //HUD.hide(inView: self.view)
//      HUD.showInfo(inView: self.view, info: "加载xx") {
//        print("in complete 2")
//      }
    }
  }
  @IBOutlet weak var grayView: UIView!
  
  override func viewDidLoad() {
    super.viewDidLoad()

    KeyboardAvoiding.avoidingView = grayView
    KeyboardAvoiding.padding = 5
    KeyboardAvoiding.paddingForCurrentAvoidingView = 20

//    let bt = UIButton(type: .system)
//    bt.addTarget(self, action: #selector(buttonClicked(sender:)), for: .touchUpInside)
//    bt.backgroundColor = .red
//    self.view.addSubview(bt)
//    bt.snp.makeConstraints { (make) in
//      make.center.equalToSuperview()
//      make.size.equalTo(CGSize(width: 200, height: 200))
//    }


    //tableView.isHidden = true
//    tableView.register(cellType: FBRootCell.self)
//    tableView.rowHeight = 44

//    let status = HTTPStatus.Failed(code: 1, message: "adf")
//    switch status {
//    case let .Failed(code, message):
//      print("\(code) \(message)")
//    case let .Success(value):
//      print("\(value)")
//    }

    let param = ["bb":"22","cc":"33"]
    _ = HTTPManager.shared.request("http://baidu.com/?sleep=5000&aa=bb", parameters: param)
    { (response, result, error, context) in
      if let error = error {
        print(error)
      } else {
        print(result)
      }
    }

    HUD.showInfo(inView: self.view, info: "asdf") {
      print("xxx")
    }

    print(Device.current.hasNotch)

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
