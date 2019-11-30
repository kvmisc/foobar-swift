//
//  HTTPManager.swift
//  Foobar
//
//  Created by Kevin Wu on 11/30/19.
//  Copyright (c) firefly.com. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class HTTPManager: NSObject {

  static let shared = HTTPManager()

  var managers = NSMutableArray()

  typealias CompletionHandler = (DataResponse<Data>?, Result<JSON>, Any?) -> Void

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
    if data.isEmpty {
      completion(response, .failure(RequestFailureReason.ResponseEmpty), context)
    } else {
      do {
        let object: Any = try JSONSerialization.jsonObject(with: data, options: [])
        let json = JSON(object)

        let code = json["code"].intValue
        switch code {
        case 200:
          completion(response, .success(json), context)
        case 201:
          completion(response, .failure(RequestFailureReason.AuthrizationFailed), context)
        default:
          break
        }

      } catch {
        completion(response, .failure(RequestFailureReason.JSONInvalid), context)
      }
    }
  }
}
