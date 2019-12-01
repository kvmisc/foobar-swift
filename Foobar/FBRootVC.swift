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

class FBRootVC: UIViewController, WLEmptyStateDataSource, WLEmptyStateDelegate {

  let frame = UIView().then {
    $0.backgroundColor = .red
  }

  @IBOutlet weak var tableView: UITableView!

//  let emptyView = WLEmptyState.Em

  let stackView: UIStackView = {
    let ret = UIStackView()
    return ret
  }()

  func enableScrollForEmptyState() -> Bool {
    return false
  }

  override func viewDidLoad() {
    super.viewDidLoad()

//    var emptyView = WLEmptyState.EmptyStateView(frame: .zero)

    view.addSubview(stackView)
    stackView.alignment = .fill
    stackView.distribution = .equalSpacing
    stackView.spacing = 20

    let item1 = FBItemView()
    item1.backgroundColor = .red
    stackView.addArrangedSubview(item1)

    let item2 = FBItemView()
    item2.backgroundColor = .green
    stackView.addArrangedSubview(item2)

    let item3 = FBItemView()
    item3.backgroundColor = .blue
    stackView.addArrangedSubview(item3)

    stackView.snp.makeConstraints { (make) in
      make.center.equalToSuperview()
    }


    WLEmptyState.configure()
    tableView.emptyStateDataSource = self
    tableView.emptyStateDelegate = self

    tableView.register(cellType: FBRootCell.self)
    tableView.rowHeight = 44

//    let status = HTTPStatus.Failed(code: 1, message: "adf")
//    switch status {
//    case let .Failed(code, message):
//      print("\(code) \(message)")
//    case let .Success(value):
//      print("\(value)")
//    }


//    HTTPManager.shared.request("http://www.mocky.io/v2/5de2a50e3000005a00e9c924") { (response, result, context) in
//
//      switch result {
//
//      case .success(let json):
//        print(json["name"].stringValue)
//
//      case .failure(let error):
//        print(error)
//
//      }
//
//    }

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
    return 0
  }
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell: FBRootCell = tableView.dequeueReusableCell(for: indexPath)
    cell.titleLabel.text = "asdf"
    return cell
  }
}
