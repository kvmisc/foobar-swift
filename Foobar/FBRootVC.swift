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

  override func viewDidLoad() {
    super.viewDidLoad()

    let bt = UIButton(type: .system)
    bt.addTarget(self, action: #selector(buttonClicked(sender:)), for: .touchUpInside)
    bt.backgroundColor = .red
    self.view.addSubview(bt)
    bt.snp.makeConstraints { (make) in
      make.center.equalToSuperview()
      make.size.equalTo(CGSize(width: 200, height: 200))
    }


//    var emptyView = WLEmptyState.EmptyStateView(frame: .zero)

//    view.addSubview(stackView)
//    stackView.alignment = .fill
//    stackView.distribution = .equalSpacing
//    stackView.spacing = 20
//
//    let item1 = FBItemView()
//    item1.backgroundColor = .red
//    stackView.addArrangedSubview(item1)
//
//    let item2 = FBItemView()
//    item2.backgroundColor = .green
//    stackView.addArrangedSubview(item2)
//
//    let item3 = FBItemView()
//    item3.backgroundColor = .blue
//    stackView.addArrangedSubview(item3)
//
//    stackView.snp.makeConstraints { (make) in
//      make.center.equalToSuperview()
//    }

//    let iconView = SMIconLabel()
//    iconView.icon = UIImage(named: "settings")
//    iconView.text = "asdf"
//    iconView.iconPosition = (.left, .center)
//    iconView.iconPadding = 5.0



//    WLEmptyState.configure()
//    tableView.emptyStateDataSource = self
//    tableView.emptyStateDelegate = self


//    KRProgressHUD.show()
//
//    DispatchQueue.main.asyncAfter(deadline: .now()+5) {
//      KRProgressHUD.dismiss()
//    }


    //tableView.isHidden = true
    tableView.register(cellType: FBRootCell.self)
    tableView.rowHeight = 44

//    let status = HTTPStatus.Failed(code: 1, message: "adf")
//    switch status {
//    case let .Failed(code, message):
//      print("\(code) \(message)")
//    case let .Success(value):
//      print("\(value)")
//    }


    HTTPManager.shared.request("http://www.mocky.io/v2/5de4c9d73000000e009f7b23") { (response, result, context) in

      switch result {

      case .success(let json):
        print(json)

//        let array = json["data"]
//        if array.type == .array {
//          let list = NSArray.yy_modelArray(with: FBPersonModel.self, json: array.rawValue) as! [FBPersonModel]
//          for it in list {
//            print("\(it.name) \(it.age) \(it.isHigh)")
//          }
//          print(list)
//        }

      case .failure(let error):
        print(error)
      }

    }

//    HTTPManager.shared.request("https://httpstat.us/200?sleep=3000", context: "101") { (response, result, context)  in
//
//      print(response)
//
//      print(context)
//
//      switch result {
//
//      case .success(let data):
//        print(data.extToUTF8String())
//
//      case .failure(let error):
//        print(error)
//
//      }
//
//    }

//    let config = URLSessionConfiguration.default
//    sm = SessionManager(configuration: config)
//    sm?.request("https://httpstat.us/200?sleep=5000",
//               method: .get,
//               parameters: nil,
//               encoding: URLEncoding.queryString,
//               headers: nil).validate().responseString { (response) in
//                print(Thread.isMainThread)
//                print(response.result.value)
//    }

  }

//  override func viewDidAppear(_ animated: Bool) {
//    super.viewDidAppear(animated)
//  }
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
