//
//  TestThemeVC.swift
//  Foobar
//
//  Created by Kevin Wu on 1/16/20.
//  Copyright (c) firefly.com. All rights reserved.
//

import UIKit
import SwiftTheme

class Askf: Codable {
  var name = ""
  var age = 0
}

class TestThemeVC: UIViewController {

  var list: [Askf] = []

  @IBAction func buttonAction(_ sender: Any) {

    //index = (index + 1) % 2
    //ThemeWorker.shared.changeTheme( (ThemeWorker.shared.currentIndex + 1) % 2)
    if ThemeWorker.shared.isDay {
      ThemeWorker.shared.changeTheme(.Night)
    } else {
      ThemeWorker.shared.changeTheme(.Day)
    }

//    if index == 0 {
//      ThemeManager.setTheme(plistName: "theme_day", path: .mainBundle)
//    } else {
//      ThemeManager.setTheme(plistName: "theme_night", path: .mainBundle)
//    }

  }

  @IBOutlet weak var bgView: UIView!
  @IBOutlet weak var iconView: UIImageView!
  @IBOutlet weak var infoLabel: UILabel!

  var index = 0

  override func viewDidLoad() {
    super.viewDidLoad()

    index = ThemeWorker.shared.currentIndex

    bgView.bg_color = "view.bg"
    iconView.img = "date"
    

//    let a = Askf()
//    a.name = "aa"
//    a.age = 101
//    list.append(a)
//    let b = Askf()
//    b.name = "asdf"
//    b.age = 1556
//    list.append(b)
//    Archive.toJSONFile(list, Path.document("afal.json"))
//
//    let obj: [Askf]? = Archive.fromJSONFile(Path.document("afal.json"))
//    print(obj)

//    let list = ["AA","BB"]
//    Archive.toPlistFile(list, Path.document("asdf.plist"))

    //let path = Path.document("asdf.plist")
//    let path = Path.findPath("theme_day.plist")!
//    let obj: [String:[String:String]]? = Archive.fromPlistFile(path)
//    print(obj)


//    iconView.bg_color = "view.bg"
    

//    iconView.theme_image = ["date_day", "date_night"]
//
//    //infoLabel.theme_textColor = ["#FF0000", "#0000FF"]
//
//    infoLabel.theme_textColor = "label.light"
////    infoLabel.theme_textColor = ThemeColorPicker(keyPath: "label.light")

  }
}

//class AA {
//  var ppt: BB?
//}
//
//class BB: ExpressibleByStringLiteral {
//  var theValue = ""
//  init(_ str: String) {
//    theValue = str
//  }
//  convenience required init(stringLiteral value: String) {
//  }
//}

