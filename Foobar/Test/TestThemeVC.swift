//
//  TestThemeVC.swift
//  Foobar
//
//  Created by Kevin Wu on 1/16/20.
//  Copyright (c) firefly.com. All rights reserved.
//

import UIKit

class Askf: Codable {
  var name = ""
  var age = 0
}

class TestThemeVC: UIViewController {

  var list: [Askf] = []

  @IBAction func buttonAction(_ sender: Any) {

//    if ThemeWorker.shared.isDay {
//      ThemeWorker.shared.changeTheme(.Night)
//    } else {
//      ThemeWorker.shared.changeTheme(.Day)
//    }

//    Overlay.hudActivity()
//    Overlay.hudActivity(info: "Loading...")
    Overlay.hudMessage(info: "Done") {
      print("completion")
    }

  }

  @IBOutlet weak var bgView: UIView!
  @IBOutlet weak var iconView: UIImageView!
  @IBOutlet weak var infoLabel: UILabel!
  @IBOutlet weak var testLabel: UILabel!

  var index = 0

  override func viewDidLoad() {
    super.viewDidLoad()

    index = ThemeWorker.shared.currentIndex

    bgView.bg_color = "view.bg"
    iconView.img = "date"

//    testLabel.text = "更多返回错误代码请看首页的错误代码描述更多返回错误代码请看首页的错误代码描述更多返回错误代码请看首页的错误代码描述"
//    testLabel.font = ccf(17)

//    let rt = RichText()
//    rt.append("更多") { (ta) in
//      ta.font(ccf(17))
//      ta.foregroundColor(.blue)
//      ta.lineSpacing(5.0)
//    }
//    testLabel.attributedText = rt.attributedText

    testLabel.attributedText =
      RichText()
        .append("aa", {
          $0.font(ccf(17)).foregroundColor(.blue)
        })
        .append("bb", {
          $0.font(ccf(12)).foregroundColor(.green)
        })
        .attributedText

//    testLabel.attributedText = RichText.build({ (rt) in
//      rt.append("AA") { (ta) in
//        ta.font(ccf(12))
//      }
//    })

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

