//
//  TestRealmVC.swift
//  Foobar
//
//  Created by Kevin Wu on 12/15/19.
//  Copyright (c) firefly.com. All rights reserved.
//

import UIKit
import RealmSwift
import Async


// 支持类型: Bool, Int, Int8, Int16, Int32, Int64, Double, Float, String, Date, and Data
// Bool, Int, Double, String(?), Date(?), Data(?)

// List 能保存同一对象多次

// Realm objects 只能在创建线程里访问

// 对象未加到 Realm 前能自由修改属性, 加进去以后只能在事务中修改

// 先创建查询结果, 再添加符合查询条件的对象, 新对象会在查询结果中

// 属性定义
//
// 数值类型: Bool, Int, Double
// @objc dynamic var aaa = false;         let aaa = RealmOptional<Bool>()
// @objc dynamic var bbb: Double = 0.0    let bbb = RealmOptional<Double>()
//
// 一般类型: String, Date, Data
// @objc dynamic var ccc = ""             @objc dynamic var ccc: String? = nil
//
// 对象类型: Object, 必须是可选
// @objc dynamic var ddd: Class?
//
// 列表类型: List, 必须是非可选
// let eee = List<Type>()
//
// 链接类型: LinkingObjects, 必须是非可选
// let fff = LinkingObjects(fromType: Class.self, property: "property"

// 锁屏时能操作文件
func UnlockFile() {
  let realm = try! Realm()
  let folderPath = realm.configuration.fileURL!.deletingLastPathComponent().path
  try! FileManager.default.setAttributes([FileAttributeKey.protectionKey: FileProtectionType.none],
                                         ofItemAtPath: folderPath)
}

// 配置 Realm
func Config(_ name: String) -> Realm {
  var config = Realm.Configuration()

  // 配置数据保存路径
  let path = Path.document("test")
  Path.create(path)
  config.fileURL = path.extAppendingPathComponent(name).extURL()

  // 配置管理的类, 必须, 所有类会在 Realm 创建成功后自动建表
  config.objectTypes = [Toup.self]

  // 配置启动时候清理太多无用空间
  config.shouldCompactOnLaunch = { totalBytes, usedBytes in
    let oneHundredMB = 100 * 1024 * 1024
    return (totalBytes > oneHundredMB) && (Double(usedBytes) / Double(totalBytes)) < 0.5
  }

  // 数据模型升级
  config.schemaVersion = 3
  config.migrationBlock = { migration, oldSchemaVersion in
    if oldSchemaVersion == 1 {
      print("upgrade from 1 to current")
      // 把第一版本的 firstName 和 lastName 两个字段合并为第二版本的 fullName 字段
      migration.enumerateObjects(ofType: Toup.className()) { oldObject, newObject in
        let firstName = oldObject!["firstName"] as! String
        let lastName = oldObject!["lastName"] as! String
        newObject!["fullName"] = "\(firstName) \(lastName)"

        // 把第二版本的 fullName 大写，写到 upper 字段
        newObject!["upper"] = "\(firstName) \(lastName)".uppercased()
      }
    }
    if oldSchemaVersion == 2 {
      print("upgrade from 2 to current")
      // 把第二版本的 fullName 大写，写到 upper 字段
      migration.enumerateObjects(ofType: Toup.className()) { oldObject, newObject in
        let fullName = oldObject!["fullName"] as! String
        newObject!["upper"] = fullName.uppercased()
      }
    }
  }

  let realm = try! Realm(configuration: config)

  return realm
}

func TestNotification() {
  // 关注通知
//  let token = realm.observe { notification, realm in
//    viewController.updateUI()
//  }
//
//  token.invalidate()

  // 某次写操作不想触发这个通知
//  try! realm.write(withoutNotifying: [token]) {
//    // ... write to realm
//  }
}

// 内存 Realm, 何时释放的？
func InMemoryRealm() {
  var config = Realm.Configuration()
  config.inMemoryIdentifier = "abcd"
  let realm = try! Realm(configuration: config)
}

// 测试读写
func TestReadWrite() {
  let d1 = Dog()
  d1.name = "Rex"
  d1.age = 1
  print("d1 1: \(d1.name) \(d1.age) \(d1.owners)")

  let p1 = Person()
  p1.name = "Kevin"
  print("p1: \(p1.name) \(p1.dogs)")


  let realm = try! Realm()

  try! realm.write {
    realm.add(p1)
  }

  let r1 = realm.objects(Dog.self).filter("age < 2")
  print("r1: \(r1)")
  try! realm.write {
    realm.add(d1)
  }
  print("r1: \(r1)")

  print("d1 2: \(d1.name) \(d1.age) \(d1.owners)")
  try! realm.write {
    p1.dogs.append(d1)
  }

  print("d1 3: \(d1.name) \(d1.age) \(d1.owners)")
  print("p1 2: \(p1.name) \(p1.dogs)")
}

// 多线程读写
func TestReadWriteThread() {
  let p1 = Person()
  p1.pid = 1
  p1.name = "Kevin"
  p1.picture = Data()
  print("p1: \(p1.name) \(p1.dogs)") // Kevin

  let realm = try! Realm()

  try! realm.write {
    realm.add(p1)
  }

  let res = realm.objects(Person.self)
  print("list: \(res)")
  DispatchQueue.global(qos: .background).sync {
    // 1)用同一个 realm 对象, 会更新主线程的 p1 对象
    //let rlm = realm
    // 2)如果新开一个 realm 对象来处理数据, p1 不会更新
    // 不复现了, 估计情况二是错的
    let rlm = try! Realm()
    let p = rlm.objects(Person.self).filter("pid < 2").first
    try! rlm.write {
      p?.name = "asdf"

      let x = Person()
      x.pid = 2
      x.name = "Tony"
      rlm.add(x)
    }
    print("p: \(p?.name) \(p?.dogs)") // asdf
  }
  print("list: \(res)")

  // 1)
  print("p1: \(p1.name) \(p1.dogs)") // asdf

  // 2)
  print("p1: \(p1.name) \(p1.dogs)") // Kevin
  let p2 = realm.objects(Person.self).filter("pid < 2").first
  print("p2: \(p2?.name) \(p2?.dogs)") // asdf
}

// 添加或更新
func TestAddOrUpdate() {
//  let cheeseBook = Book()
//  cheeseBook.title = "Cheese recipes"
//  cheeseBook.price = 9000
//  cheeseBook.id = 1

  // 主键 id, 添加或更新
//  try! realm.write {
//    realm.add(cheeseBook, update: .modified)
//  }

  // 仅更新部分字段
//  try! realm.write {
//    realm.create(Book.self, value: ["id": 1, "price": 9000.0], update: .modified)
//    // the book's `title` property will remain unchanged.
//  }
}

// 删除
func TestDelete() {
  let p1 = Person()
  p1.pid = 1
  p1.name = "Kevin"

  let p2 = Person()
  p2.pid = 2
  p2.name = "Tony"

  let realm = try! Realm()

  try! realm.write {
    realm.add(p1)
    realm.add(p2)
  }

  let res = realm.objects(Person.self)
  print("list: \(res)")

  // 只能删除 realm 里面的, 如果新建一个, 拿去删除, 会崩
  // let p = Person()
  // p.pid = 2
  // realm.delete(p)

  try! realm.write {
    realm.delete(res.last!)
  }

  print("list: \(res)")
  print(p2.name) // 崩溃
}

class Dog: Object {
  @objc dynamic var name = ""
  @objc dynamic var age = 0
  let owners = LinkingObjects(fromType: Person.self, property: "dogs")
}
class Person: Object {
  @objc dynamic var pid = 0
  @objc dynamic var name = ""
  @objc dynamic var picture: Data? = nil
  let dogs = List<Dog>()
  let list = List<String>()

  // 主键
//   override static func primaryKey() -> String? {
//     return "pid"
//   }
  // 忽略属性
//   override static func ignoredProperties() -> [String] {
//     return ["tmpID"]
//   }
}

// 版本 1
//class Toup: Object {
//  @objc dynamic var tid = 0
//  @objc dynamic var firstName = ""
//  @objc dynamic var lastName = ""
//}
// 版本 2
//class Toup: Object {
//  @objc dynamic var tid = 0
//  @objc dynamic var fullName = ""
//}
// 版本 3
class Toup: Object {
  @objc dynamic var tid = 0
  @objc dynamic var fullName = ""
  @objc dynamic var upper = ""
}

class TestRealmVC: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()

    let realm = Config("tu.realm")

    let t1 = Toup()
    t1.tid = 1
    t1.fullName = "fa"

    let t2 = Toup()
    t2.tid = 8
    t2.fullName = "fb"

    let t3 = Toup()
    t3.tid = 3
    t3.fullName = "fc"

    try! realm.write {
      realm.add(t1)
      realm.add(t2)
      realm.add(t3)
    }

    let res = realm.objects(Toup.self).filter("tid < 5")
    print(res)

    try! realm.write {
      let t = Toup()
      t.tid = 7
      t.fullName = "fd"
      realm.add(t)
    }
    print(res)

    try! realm.write {
      let t = Toup()
      t.tid = 2
      t.fullName = "fe"
      realm.add(t)
    }
    print(res)

  }
}
