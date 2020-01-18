//
//  HTTPManager.swift
//  Foobar
//
//  Created by Kevin Wu on 11/30/19.
//  Copyright (c) firefly.com. All rights reserved.
//

import UIKit
import Alamofire

//HTTPManager.shared.request("https://httpstat.us/200?sleep=5000")
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

  enum Ejrror: Error {
    case Unknown
    case Cancelled
    case NetworkError
    case HTTPError
    case ResponseEmpty
    case FormatError    // not json
    case DataError      // not dictionary
    case CodeError      // has no code

    var message: String {
      switch self {
      case .Unknown:        return ""
      case .Cancelled:      return ""
      case .NetworkError:   return ""
      case .HTTPError:      return ""
      case .ResponseEmpty:  return ""
      case .FormatError:    return ""
      case .DataError:      return ""
      case .CodeError:      return ""
      }
    }

  }

  typealias CompletionHandler = (DataResponse<Data>, [String:Any], NSError?, Any?) -> Void

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

                            switch response.result {

                            case .success(let data):
                              self.parseResponse(response, data, context, completion)

                            case .failure:
                              if let error = response.result.error as NSError?, error.code == NSURLErrorCancelled {
                                // 因取消而产生的错误
                                completion(response, [:], self.makeError(reason: FailureReason.Cancelled.rawValue), context)
                              } else {
                                if let reachability = self.reachability,
                                  reachability.networkReachabilityStatus != .unknown,
                                  !reachability.isReachable
                                {
                                  // 有 reachability, 有状态, 状态是无法访问网络
                                  completion(response, [:], self.makeError(reason: FailureReason.NetworkError.rawValue), context)
                                } else {
                                  completion(response, [:], self.makeError(reason: FailureReason.HTTPError.rawValue), context)
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
