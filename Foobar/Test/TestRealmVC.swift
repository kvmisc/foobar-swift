//
//  TestRealmVC.swift
//  Foobar
//
//  Created by Kevin Wu on 12/15/19.
//  Copyright (c) firefly.com. All rights reserved.
//

import UIKit
import RealmSwift

// Bool, Int, Double, String(?), Date(?), Data(?)
//
// Bool, Int, Int8, Int16, Int32, Int64, Double, Float, String, Date, and Data.
// CGFloat properties are discouraged, as the type is not platform independent.
// String, Date and Data properties can be optional. Object properties must be optional. Storing optional numbers is done using RealmOptional.

// Realm model properties must have the @objc dynamic var attribute to become accessors
// There are three exceptions to this: LinkingObjects, List and RealmOptional. These properties should always be declared with let.


class Dog: Object {
  @objc dynamic var name = ""
  @objc dynamic var age = 0
}
class Person: Object {
  @objc dynamic var pid = ""
  @objc dynamic var name = ""
  @objc dynamic var picture: Data? = nil
  //@objc dynamic var dog: Dog = Dog()
  let dogs = List<Dog>()

  override static func primaryKey() -> String? {
    return "pid"
  }
}

class TestRealmVC: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()


//    // Use them like regular Swift objects
//    let myDog = Dog()
//    myDog.name = "Rex"
//    myDog.age = 1
//    print("name of dog: \(myDog.name)")
//
//    // Get the default Realm
    let realm = try! Realm()

    let folderPath = realm.configuration.fileURL!.deletingLastPathComponent().path
    print(folderPath)

    let p = Person()
    p.pid = "1"
    p.name = "Kevin"
    try! realm.write {
      realm.add(p)
    }
//
//    // Query Realm for all dogs less than 2 years old
//    let puppies = realm.objects(Dog.self).filter("age < 2")
//    print("1: \(puppies)")
//
//    // Persist your data easily
//    try! realm.write {
//      realm.add(myDog)
//    }
//
//    print("2: \(puppies)")

  }
}
