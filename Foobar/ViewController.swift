//
//  ViewController.swift
//  Foobar
//
//  Created by Kevin Wu on 11/27/19.
//  Copyright (c) firefly.com. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()

//    var str = "cafe"
//    print("\(str.count)")

    var word = "c中国ae"
//    print("the number of characters in \(word) is \(word.count)")
//    // 打印输出“the number of characters in cafe is 4”
//
    word += "\u{301}"    // 拼接一个重音，U+0301
//
//    print("the number of characters in \(word) is \(word.count)")
//    // 打印输出“the number of characters in café is 4”

    let str = "abcd"
//    print("[\(word.extSubstring(leading: -1))]")
//    print("[\(word.extSubstring(leading: 0))]")
//    print("[\(word.extSubstring(leading: 1))]")
//    print("[\(word.extSubstring(leading: 2))]")
//    print("[\(word.extSubstring(leading: 3))]")
//    print("[\(word.extSubstring(leading: 4))]")
//    print("[\(word.extSubstring(leading: 5))]")
//    print("[\(word.extSubstring(leading: 6))]")

//    print("[\(word.extSubstring(trailing: -1))]")
//    print("[\(word.extSubstring(trailing: 0))]")
//    print("[\(word.extSubstring(trailing: 1))]")
//    print("[\(word.extSubstring(trailing: 2))]")
//    print("[\(word.extSubstring(trailing: 3))]")
//    print("[\(word.extSubstring(trailing: 4))]")
//    print("[\(word.extSubstring(trailing: 5))]")
//    print("[\(word.extSubstring(trailing: 6))]")

//    print("[\(word.extSubstring(trimLeading: -1))]")
//    print("[\(word.extSubstring(trimLeading: 0))]")
//    print("[\(word.extSubstring(trimLeading: 1))]")
//    print("[\(word.extSubstring(trimLeading: 2))]")
//    print("[\(word.extSubstring(trimLeading: 3))]")
//    print("[\(word.extSubstring(trimLeading: 4))]")
//    print("[\(word.extSubstring(trimLeading: 5))]")
//    print("[\(word.extSubstring(trimLeading: 6))]")

//    print("[\(word.extSubstring(trimTrailing: -1))]")
//    print("[\(word.extSubstring(trimTrailing: 0))]")
//    print("[\(word.extSubstring(trimTrailing: 1))]")
//    print("[\(word.extSubstring(trimTrailing: 2))]")
//    print("[\(word.extSubstring(trimTrailing: 3))]")
//    print("[\(word.extSubstring(trimTrailing: 4))]")
//    print("[\(word.extSubstring(trimTrailing: 5))]")
//    print("[\(word.extSubstring(trimTrailing: 6))]")

//    print("[\(word.extSubstring(trimLeading: -1, trimTrailing: -1))]")
//    print("[\(word.extSubstring(trimLeading: 0, trimTrailing: 0))]")
//    print("[\(word.extSubstring(trimLeading: 1, trimTrailing: 0))]")
//    print("[\(word.extSubstring(trimLeading: 0, trimTrailing: 1))]")
//    print("[\(word.extSubstring(trimLeading: 1, trimTrailing: 1))]")
//    print("[\(word.extSubstring(trimLeading: 50, trimTrailing: 1))]")
//    print("[\(word.extSubstring(trimLeading: 1, trimTrailing: 50))]")
//    print("[\(word.extSubstring(trimLeading: 50, trimTrailing: 50))]")

    print("[\(word.extSubstring(from: -1, length: 2))]")
    print("[\(word.extSubstring(from: 0, length: 2))]")
    print("[\(word.extSubstring(from: 1, length: 2))]")
    print("[\(word.extSubstring(from: 2, length: 3))]")
    print("[\(word.extSubstring(from: 2, length: 4))]")
    print("[\(word.extSubstring(from: 12, length: 5))]")


//    print("\(UIView.LayerName.RoundedLayer)")

//    var ary: [Int]? = nil
//    ary = [1, 3, 5]
//    print("\(ary?[2])")
//
//    let map = ["a":1, "b":3, "c":5]
//    print("\(map["c"])")
    
    let tv = FBTestView.extLoadFromNib()
    if let v = tv as? FBTestView {
      v.doit()
      view.addSubview(v)
      v.frame = CGRect(x: 50, y: 50, width: 300, height: 500)

      print("\(v)")

//      v.extSetShadowColor(opacity: 0.1, radius: 4)
//      v.extSetRoundedCorner(20)

//      var l = CALayer()
//      v.layer.addSublayer(l)
//      l.backgroundColor = UIColor.purple.cgColor
//      l.frame = CGRect(x: 50, y: 50, width: 25, height: 25)
//      l.name = "aa"
//
//      l = CALayer()
//      v.layer.addSublayer(l)
//      l.backgroundColor = UIColor.brown.cgColor
//      l.frame = CGRect(x: 100, y: 100, width: 25, height: 25)
//      l.name = "bb"
//
//      var r = v.layer.extSublayerNamed("bb")
//      print("\(r)")
//      v.layer.extRemoveSublayerNamed("bb")
//      var a = v.layer.extSublayerNamed("bb")
//      print("\(a)")


//      let gradient = CAGradientLayer()
//      gradient.colors = [UIColor.red.cgColor,
//                         UIColor.green.cgColor,
//                         UIColor.blue.cgColor]
//      gradient.locations = [0, 0.5, 1]
//      gradient.startPoint = CGPoint(x: 0.5, y: 0)
//      gradient.endPoint = CGPoint(x: 0.5, y: 1)
//      gradient.frame = v.bounds
//      gradient.type = .axial
//      v.layer.addSublayer(gradient)

      v.extSetShadowColor(opacity: 1.0, radius: 4)
      v.extSetRoundedCorner(20)

      let gradient = CAGradientLayer()
      gradient.colors = [UIColor(red: 0.64, green: 0.29, blue: 0.93, alpha: 1).cgColor, UIColor(red: 0.65, green: 0.29, blue: 0.93, alpha: 1).cgColor, UIColor(red: 0.83, green: 0.27, blue: 0.87, alpha: 1).cgColor]
      gradient.locations = [0, 0, 1]
      gradient.frame = v.bounds
      gradient.startPoint = CGPoint(x: 0, y: 0.5)
      gradient.endPoint = CGPoint(x: 1, y: 1)
//      roundedLayer.addSublayer(gradient)
      v.extAddGradientLayer(gradient)

      v.extSetBorderWidth()

//      let rawStr = "abcd"
//      let rawDat = rawStr.extToUTF8Data()
//      print("A\(Foobar.Base64.encodeString(rawStr))A")
//      print("A\(Foobar.Base64.encodeString(rawDat))A")
//      print("A\(Foobar.Base64.encodeData(rawStr).extToUTF8String())A")
//      print("A\(Foobar.Base64.encodeData(rawDat).extToUTF8String())A")
//
//      let encodedStr = "Z29kIGlzIGEgZ2lybA=="
//      let encodedDat = encodedStr.extToUTF8Data()
//      print("A\(Foobar.Base64.decodeString(encodedStr))A")
//      print("A\(Foobar.Base64.decodeString(encodedDat))A")
//      print("A\(Foobar.Base64.decodeData(encodedStr).extToUTF8String())A")
//      print("A\(Foobar.Base64.decodeData(encodedDat).extToUTF8String())A")



//      let abc = "YWJjZA=="
//      print("\(abc.extBase64Decode())")
//
//      let base = "Z29kIGlzIGEgZ2lybA=="
//
//      let dat = Data.extFromBase64String(base)
//      print("\(dat)")
//
////      let path = Foobar.pathDocument("abc.txt")
////      print(path)
////      var url = URL(fileURLWithPath: path)
////      do { try dat.write(to: url) } catch {}
//
//      let dat2 = str.data(using: .utf8)
//      if let dt = dat2 {
//        print("\(dt.extToBase64String())")
//      }
//
//      let dat3 = base.extToUTF8Data()
//      let dt3 = Data.extFromBase64Data(dat3)
//      let path = Foobar.pathDocument("ccc.txt")
//      print(path)
//      var url = URL(fileURLWithPath: path)
//      do { try dt3.write(to: url) } catch {}
    }

  }


}

