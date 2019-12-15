//
//  TestJSONVC.swift
//  Foobar
//
//  Created by Kevin Wu on 12/15/19.
//  Copyright (c) firefly.com. All rights reserved.
//

import UIKit

struct Person: Codable {
  var name: String

  // 10.0 -> 10
  // 10.1 -> 解析出错
  var age: Int

  // 10 -> 10.0
  var weight: Double

  var charming: Bool

  var dict: [String:Int]

  var ary: [Int]

  // null


  // ====================

  // 如果 JSON 值可能为 null, 必须声明为可选类型
  var nullField: String?

  // 如果 JSON 可能不提供这字段, 必须声明为可选类型
  var missedField: String?

  // 枚举解析
  enum Gender: Int, Codable {
    case male
    case female
  }
  var gender: Gender

  // 日期解析
  var birthday: Date

  // 部分键改名字
  // 非可选字段必须映射, 否则编译出错
  // 可选字段如果不映射, 就算 JSON 里提供了值也解析不出来
  var field: String
  enum CodingKeys: String, CodingKey {
    case name
    case age
    case weight
    case charming
    case dict
    case ary
    case nullField
    case missedField
    case gender
    case birthday
    case field = "asdf"
  }

  // 类型转换再存到属性
  // ...
}

class TestJSONVC: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()

    let json = """
{
  "name": "Kevin",
  "age": 10,
  "weight": 10.0,
  "charming": true,
  "dict": {"a":1,"b":2},
  "ary": [1,2,3],
  "nullField": null,
  "gender": 0,
  "birthday": 1576397406723,
  "asdf": "aa",
  "not_used": 456
}
""".data(using: .utf8)!
    let decoder = JSONDecoder()
    decoder.dateDecodingStrategy = .millisecondsSince1970
    let p = try? decoder.decode(Person.self, from: json)
    print("decoding")
    if let p = p {
      print("name: \(p.name)")
      print("age: \(p.age)")
      print("weight: \(p.weight)")
      print("charming: \(p.charming)")
      print("dict: \(p.dict)")
      print("ary: \(p.ary)")
      print("nullField: \(p.nullField)")
      print("missedField: \(p.missedField)")
      print("gender: \(p.gender)")
      print("birthday: \(p.birthday)")
      print("field: \(p.field)")
    }
  }



}
