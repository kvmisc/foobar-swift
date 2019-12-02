//
//  HTTPManager.swift
//  Foobar
//
//  Created by Kevin Wu on 11/30/19.
//  Copyright (c) firefly.com. All rights reserved.
//

import UIKit
import Alamofire

//HTTPManager.shared.request("http://www.mocky.io/v2/5de4c9d73000000e009f7b23") { (response, result, context) in
//
//  switch result {
//
//  case .success(let json):
//
//    let array = json["data"]
//    if array.type == .array {
//      let list = NSArray.yy_modelArray(with: FBPersonModel.self, json: array.rawValue) as! [FBPersonModel]
//      for it in list {
//        print("\(it.name) \(it.age) \(it.isHigh)")
//      }
//      print(list)
//    }
//
//  case .failure(let error):
//    print(error)
//  }
//
//}

class HTTPManager: NSObject {

  static let shared = HTTPManager()

  var managers = NSMutableArray()

  typealias CompletionHandler = (DataResponse<Data>?, Result<[String:Any]>, Any?) -> Void

  enum RequestFailureReason: Error {
    case HTTPError(code: Int)
    case ResponseEmpty
    case JSONInvalid
    case AuthrizationFailed
  }

  func makeSessionManager() -> SessionManager {
    let configuration = URLSessionConfiguration.default

    let manager = SessionManager(configuration: configuration,
                                 delegate: SessionDelegate(),
                                 serverTrustPolicyManager: nil)

    return manager
  }

  func request(_ url: String,
               method: HTTPMethod = .get,
               parameters: Parameters = [:],
               encoding: ParameterEncoding = URLEncoding.methodDependent,
               headers: HTTPHeaders = [:],
               context: Any? = nil,
               completion: @escaping CompletionHandler)
  {
    let manager = makeSessionManager()
    managers.add(manager)

    manager.request(url,
                    method: method,
                    parameters: parameters,
                    encoding: encoding,
                    headers: headers).validate().responseData() { [weak self](response) in
                      guard let myself = self else { return }

                      switch response.result {

                      case .success(let data):
                        myself.handleResponse(response: response,
                                              data: data,
                                              context: context,
                                              completion: completion)

                      case .failure:
                        let code = response.response?.statusCode ?? 0
                        completion(response, .failure(RequestFailureReason.HTTPError(code: code)), context)

                      }

                      myself.managers.remove(manager)
    }
  }

  func handleResponse(response: DataResponse<Data>?,
                      data: Data,
                      context: Any?,
                      completion: CompletionHandler)
  {
    if !(data.isEmpty) {
      do {
        let json: Any = try JSONSerialization.jsonObject(with: data, options: [])

        if let object = json as? [String:Any] {
          if let code = object["code"] as? Int {

            switch code {
            case 200:
              completion(response, .success(object), context)
            case 201:
              completion(response, .failure(RequestFailureReason.AuthrizationFailed), context)
            default:
              break
              // should not be here
            }

          } else {
            completion(response, .failure(RequestFailureReason.JSONInvalid), context)
          }
        } else {
          completion(response, .failure(RequestFailureReason.JSONInvalid), context)
        }
      } catch {
        completion(response, .failure(RequestFailureReason.JSONInvalid), context)
      }
    } else {
      completion(response, .failure(RequestFailureReason.ResponseEmpty), context)
    }
  }
}
