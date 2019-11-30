//
//  HTTPManager.swift
//  Foobar
//
//  Created by Kevin Wu on 11/30/19.
//  Copyright (c) firefly.com. All rights reserved.
//

import UIKit
import Alamofire

enum HTTPStatus: Error {
  case HTTPError(code: Int)
  case AuthrizationFailed
}

class HTTPManager: NSObject {

  static let shared = HTTPManager()

  var managers = NSMutableArray()


  func requestData(_ url: String,
                   method: HTTPMethod = .get,
                   parameters: Parameters = [:],
                   encoding: ParameterEncoding = URLEncoding.methodDependent,
                   headers: HTTPHeaders = [:],
                   context: Any? = nil,
                   completion: @escaping ((_ response: DataResponse<Data>?, _ result: Result<Data>, _ context: Any?) -> Void))
  {
    let manager = makeSessionManager()
    configSessionManager(manager)
    managers.add(manager)

    manager.request(url,
                    method: method,
                    parameters: parameters,
                    encoding: encoding,
                    headers: headers).validate().responseData { [weak self](response) in
                      guard let myself = self else { return }

                      switch response.result {

                      case .success(let data):

                        completion(response, .success(data), context)

                      case .failure:

                        var statusCode = 0
                        if let code = response.response?.statusCode {
                          statusCode = code
                        }

                        completion(response, .failure(HTTPStatus.HTTPError(code: statusCode)), context)

                      }

                      myself.managers.remove(manager)
    }
  }

  func requestJSON(_ url: String,
                   method: HTTPMethod = .get,
                   parameters: Parameters = [:],
                   encoding: ParameterEncoding = URLEncoding.methodDependent,
                   headers: HTTPHeaders = [:],
                   context: Any? = nil,
                   completion: @escaping ((_ response: DataResponse<[Any]>?, _ result: Result<[String:Any]>, _ context: Any?) -> Void))
  {
    let manager = makeSessionManager()
    configSessionManager(manager)
    managers.add(manager)

    manager.request(url,
                    method: method,
                    parameters: parameters,
                    encoding: encoding,
                    headers: headers).validate().responseJSON { [weak self](response) in
                      guard let myself = self else { return }


//                      switch response.result {
//
//                      case .success(let data):
//
//                        completion(response, .success(data), context)
//
//                      case .failure:
//
//                        var statusCode = 0
//                        if let code = response.response?.statusCode {
//                          statusCode = code
//                        }
//
//                        completion(response, .failure(HTTPStatus.HTTPError(code: statusCode)), context)
//
//                      }

                      myself.managers.remove(manager)
    }
  }




  func makeSessionManager() -> SessionManager {
    let configuration = URLSessionConfiguration.default

    let manager = SessionManager(configuration: configuration,
                                 delegate: SessionDelegate(),
                                 serverTrustPolicyManager: nil)

    return manager
  }
  func configSessionManager(_ manager: SessionManager) {
  }
}
