//
//  FBRootVC.swift
//  Foobar
//
//  Created by Kevin Wu on 11/29/19.
//  Copyright (c) firefly.com. All rights reserved.
//

import UIKit
import SnapKit
import WLEmptyState

class FBRootVC: UIViewController, WLEmptyStateDataSource, WLEmptyStateDelegate {

  @IBOutlet weak var tableView: UITableView!
  @IBOutlet weak var imageView: UIImageView!
  @IBOutlet weak var button: UIButton!
  
  override func viewDidLoad() {
    super.viewDidLoad()

    let imgTall = cci("tall")!
    let imgWide = cci("wide")!
    let imgXyz = cci("start")!
    let imgSet = cci("settings")!

    imageView.extSetBorder()
    imageView.contentMode = .left
//    let img = UIImage.extColored(.blue, ccs(50))
//    let img = imgTall.extScaleToFill(ccs(100))
//    let img = imgTall.extScaleToAspectFit(ccs(100), true)
//    let img = imgWide.extScaleToAspectFill(ccs(100), false)
//    let img = imgSet.extMerge(imgXyz, ccp(30))
    let img = imgWide.extMerge(imgSet, ccp(30))
    print("\(img.size) \(img.scale)")
    imageView.image = img

  }
}


