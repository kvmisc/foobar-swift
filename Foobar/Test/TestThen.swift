//
//  TestThen.swift
//  Foobar
//
//  Created by Kevin Wu on 12/9/19.
//  Copyright (c) firefly.com. All rights reserved.
//

import UIKit
import Then

class TestThen: Then {

  static let shared = TestThen()

  var ppt = ""

  func doit() {
    print("in doit")
  }

}

func doTestThen() {

  // 能在对象上 `调用方法`、`修改属性`
  // 能在值类型上 `调用方法`，不能修改值类型属性(未用 inout 传参数)
  // 因其无返回值，不能将其赋值给 `常量` 或 `变量`，所以不能做创建工作
  TestThen.shared.do {
    $0.doit()
    $0.ppt = "a"
  }
  let va = TestThen()
  va.do {
    $0.doit()
    $0.ppt = "a"
  }


  // 可用于创建 `属性`，可用于创建 `常量` 或 `变量`
  // 有返回值
  let vb = TestThen().then {
    $0.doit()
    $0.ppt = "a"
  }
  print(vb)

  // 用 `inout` 方式传入参数，可用于创建类的 `值类型常量属性` 和 `值类型变量属性`，可用于创建 `值类型常量` 和 `值类型变量`
  // 有返回值
  let vc = CGRect().with {
    $0.origin.x = 1.0
  }
  print(vc)
}
