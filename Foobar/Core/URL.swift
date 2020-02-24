//
//  URL.swift
//  Foobar
//
//  Created by Kevin Wu on 1/19/20.
//  Copyright (c) firefly.com. All rights reserved.
//

import UIKit

extension String {
  func extURL(_ file: Bool = false) -> URL? {
    if file {
      return URL(fileURLWithPath: self)
    }
    return URL(string: self)
  }
}

extension String {
  func extURLEncodedString() -> String {
    //return addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? self
    
    // https://en.wikipedia.org/wiki/Percent-encoding
    //
    // RFC 3986 section 2.2 Reserved Characters (January 2005)
    // !  *  '  (  )  ;  :  @  &  =  +  $  ,  /  ?  #  [  ]
    //
    // RFC 3986 section 2.3 Unreserved Characters (January 2005)
    // A  B  C  D  E  F  G  H  I  J  K  L  M  N  O  P  Q  R  S  T  U  V  W  X  Y  Z
    // a  b  c  d  e  f  g  h  i  j  k  l  m  n  o  p  q  r  s  t  u  v  w  x  y  z
    // 0  1  2  3  4  5  6  7  8  9  -  _  .  ~
    //
    // Other
    // [%] ["] [ ]
    return addingPercentEncoding(withAllowedCharacters: CharacterSet(charactersIn: "!*'();:@&=+$,/?#[]-_.~%\" ").inverted) ?? self
  }
  func extURLDecodedString() -> String {
    return removingPercentEncoding ?? self
  }
}

extension String {
  // 字符串可以是:
  //   "asdf?query"
  //   "?query"
  //   "query"
  // 返回的字符串是原始状态
  func extQueryString() -> String {
    return components(separatedBy: "?").last!
  }
  #if DEBUG
  static func TestQueryString() {
    print("H\("".extQueryString())H")
    print("H\("asdf?query".extQueryString())H")
    print("H\("?query".extQueryString())H")
    print("H\("query".extQueryString())H")
  }
  #endif

  func extAddQueryString(_ string: String) -> String {
    if extContains("?") {
      if self.hasSuffix("?") || self.hasSuffix("&") {
        return self + string
      } else {
        return self + "&" + string
      }
    }
    return self + "?" + string
  }
  #if DEBUG
  static func TestAddQueryString() {
    print("H\("".extAddQueryString("aa"))H")
    print("H\("asdf?".extAddQueryString("aa"))H")
    print("H\("?query".extAddQueryString("aa"))H")
    print("H\("?query&".extAddQueryString("aa"))H")
  }
  #endif
}

extension String {
  // 字符串只能是纯粹的查询字符串
  // 返回值: key 不解码, value 已解码
  func extQueryDictionary() -> [String:String] {
    var dictionary: [String:String] = [:]
    let pairs = components(separatedBy: "&")
    for item in pairs {
      let fields = item.components(separatedBy: "=")
      if fields.count == 2 {
        dictionary[fields[0]] = fields[1].extURLDecodedString()
      }
    }
    return dictionary
  }
  #if DEBUG
  static func TestQueryDictionary() {
    print("H\("".extQueryDictionary())H")
    print("H\("aa".extQueryDictionary())H")
    print("H\("aa=1&bb=1%261".extQueryDictionary())H")
  }
  #endif
}
extension Dictionary {
  // 返回值: key 不编码, value 已编码
  func extQueryString() -> String {
    var pairs: [String] = []
    for (key,value) in self as? [String:String] ?? [:] {
      pairs.append("\(key)=\(value.extURLEncodedString())")
    }
    return pairs.joined(separator: "&")
  }
  #if DEBUG
  func TestQueryString() {
    print("H\([:].extQueryString())H")
    print("H\(["a":"1"].extQueryString())H")
    print("H\(["a":"1#2","b":"1&1"].extQueryString())H")
  }
  #endif
}
