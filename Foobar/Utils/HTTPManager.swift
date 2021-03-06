//
//  HTTPManager.swift
//  Foobar
//
//  Created by Kevin Wu on 11/30/19.
//  Copyright (c) firefly.com. All rights reserved.
//

import UIKit
import Alamofire

// HTTPManager.shared.operations[201] = {
//   print("show login page")
// }
//
// HTTPManager.shared.request("http://www.mocky.io/v2/5e23c674340000d501012b5f")
// { (response, result, error, context) in
//   if let error = error {
//     if let code = error.0.code {
//       // 201 has been dealed globally, just check any other error
//       if code == 202 {
//         print("deal with 202")
//       } else if code == 203 {
//         print("deal with 203")
//       }
//     } else {
//       print("show error: \(error.1)")
//     }
//     // or
//     print("show error: \(error.1)")
//   } else {
//     print(result)
//   }
// }

class HTTPManager: NSObject {

  static let shared = HTTPManager()

  var managers = NSMutableArray()

  let reachability: NetworkReachabilityManager? = {
    let ret = NetworkReachabilityManager(host: "baidu.com")
    ret?.listener = { (status) in print("network: \(status)") }
    ret?.startListening()
    return ret
  }()

  enum FailureReason {
    // cancelled by user or program
    case Cancelled
    // may be have no WiFi
    case NetworkError
    // server error, 404 or something
    case HTTPError
    // response empty
    case ResponseEmpty
    // not json
    case FormatError
    // not dictionary
    case DataError
    // has no code
    case CodeError
    // param error or something
    case CustomError(_ code: Int)

    var code: Int? {
      switch self {
      case .CustomError(let code):
        return code
      default:
        return nil
      }
    }
  }

  var operations: [Int:()->Void] = [:]

  typealias CompletionHandler = (DataResponse<Data>, [String:Any], (FailureReason,String)?, Any?) -> Void

  @discardableResult
  func request(_ url: String,
               method: HTTPMethod = .get,
               parameters: Parameters = [:],
               encoding: ParameterEncoding = URLEncoding.methodDependent,
               headers: HTTPHeaders = [:],
               timeout: Double = 10.0,
               context: Any? = nil,
               completion: @escaping CompletionHandler)
    -> DataRequest
  {
    let configuration = URLSessionConfiguration.default

    configuration.timeoutIntervalForRequest = timeout

    let manager = SessionManager(configuration: configuration,
                                 delegate: SessionDelegate(),
                                 serverTrustPolicyManager: nil)

    managers.add(manager)


    return manager.request(url,
                           method: method,
                           parameters: parameters,
                           encoding: encoding,
                           headers: headers).validate().responseData() { [weak self](response) in
                            guard let self = self else { return }
                            print("HTTPManager response on main thread: \(Thread.isMainThread)")

                            switch response.result {

                            case .success(let data):
                              self.parseResponse(response, data, context, completion)

                            case .failure:
                              if let error = response.result.error as NSError?, error.code == NSURLErrorCancelled {
                                // 因取消而产生的错误
                                completion(response, [:], (.Cancelled,"请求错误"), context)
                              } else {
                                if let reachability = self.reachability,
                                  reachability.networkReachabilityStatus != .unknown,
                                  !reachability.isReachable
                                {
                                  // 有 reachability, 有状态, 状态是无法访问网络
                                  completion(response, [:], (.NetworkError,"请求错误"), context)
                                } else {
                                  completion(response, [:], (.HTTPError,"请求错误"), context)
                                }
                              }

                            }

                            self.managers.remove(manager)
    }
  }

  func parseResponse(_ response: DataResponse<Data>,
                     _ data: Data,
                     _ context: Any?,
                     _ completion: CompletionHandler)
  {
    if !data.isEmpty {
      do {
        let json: Any = try JSONSerialization.jsonObject(with: data, options: [])

        if let object = json as? [String:Any] {
          if let code = object["code"] as? Int {
            let message = object["message"] as? String ?? ""

            switch code {
            case 200:
              completion(response, object, nil, context)
            case 201: //show login page
              completion(response, [:], (.CustomError(code),message), context)
              operations[201]?()
            //case xxx:
            //  do something else
            default:
              completion(response, [:], (.CustomError(code),message), context)
            }

          } else {
            completion(response, [:], (.CodeError,"请求错误"), context)
          }
        } else {
          completion(response, [:], (.DataError,"请求错误"), context)
        }
      } catch {
        completion(response, [:], (.FormatError,"请求错误"), context)
      }
    } else {
      completion(response, [:], (.ResponseEmpty,"请求错误"), context)
    }
  }
}
