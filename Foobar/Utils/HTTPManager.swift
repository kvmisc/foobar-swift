//
//  HTTPManager.swift
//  Foobar
//
//  Created by Kevin Wu on 11/30/19.
//  Copyright (c) firefly.com. All rights reserved.
//

import UIKit
import Alamofire

//_ = HTTPManager.shared.request("https://httpstat.us/200?sleep=5000")
//{ (response, result, error, context) in
//  if let error = error {
//    print(error)
//  } else {
//    print(result)
//  }
//}

class HTTPManager: NSObject {

  static let shared = HTTPManager()

  var managers = NSMutableArray()

  let reachability: NetworkReachabilityManager? = {
    let ret = NetworkReachabilityManager(host: "baidu.com")
    ret?.listener = { (status) in print("network: \(status)") }
    ret?.startListening()
    return ret
  }()

  enum FailureReason: String {
    case Unknown        = "unknown"
    case Cancelled      = "cancelled"
    case NetworkError   = "network_error"
    case HTTPError      = "http_error"
    case ResponseEmpty  = "response_empty"
    case FormatError    = "format_error"    // not json
    case DataError      = "data_error"      // not dictionary
    case CodeError      = "code_error"      // has no code
  }

  typealias CompletionHandler = (DataResponse<Data>, [String:Any], NSError?, Any?) -> Void

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
                            guard let myself = self else { return }

                            switch response.result {

                            case .success(let data):
                              myself.parseResponse(response: response,
                                                   data: data,
                                                   context: context,
                                                   completion: completion)

                            case .failure:
                              if let error = response.result.error as NSError?, error.code == NSURLErrorCancelled {
                                // 因取消而产生的错误
                                completion(response, [:], myself.makeError(reason: FailureReason.Cancelled.rawValue), context)
                              } else {
                                if let reachability = myself.reachability,
                                  reachability.networkReachabilityStatus != .unknown,
                                  !(reachability.isReachable)
                                {
                                  // 有 reachability, 有状态, 状态是无法访问网络
                                  completion(response, [:], myself.makeError(reason: FailureReason.NetworkError.rawValue), context)
                                } else {
                                  completion(response, [:], myself.makeError(reason: FailureReason.HTTPError.rawValue), context)
                                }
                              }

                            }

                            myself.managers.remove(manager)
    }
  }

  func parseResponse(response: DataResponse<Data>,
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
              completion(response, object, nil, context)
            //case 201:
            //  show login page
            //case xxx:
            //  do something else
            default:
              completion(response, [:], makeError(description: object["message"] as? String), context)
            }

          } else {
            completion(response, [:], makeError(reason: FailureReason.CodeError.rawValue), context)
          }
        } else {
          completion(response, [:], makeError(reason: FailureReason.DataError.rawValue), context)
        }
      } catch {
        completion(response, [:], makeError(reason: FailureReason.FormatError.rawValue), context)
      }
    } else {
      completion(response, [:], makeError(reason: FailureReason.ResponseEmpty.rawValue), context)
    }
  }

  func makeError(description: String? = nil, reason: String? = nil) -> NSError {
    let userInfo = [
      NSLocalizedDescriptionKey:description ?? "请求错误",
      NSLocalizedFailureReasonErrorKey:reason ?? FailureReason.Unknown.rawValue
    ]
    return NSError(domain: "com.firefly.http",
                   code: 0,
                   userInfo: userInfo)
  }
}
