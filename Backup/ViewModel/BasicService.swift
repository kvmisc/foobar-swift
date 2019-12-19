//
//  BaseService.swift
//  FunnyMoto
//
//  Created by 汤世昭 on 2019/6/20.
//  Copyright © 2019 苏打出行. All rights reserved.
//

import Foundation
import PromiseKit

protocol BasicService {
    
}

extension BasicService {
    func sendRequest<R: APIRequest>(_ request: R) -> Promise<Void> {
        return APIs.send(request, decode: Data.self).asVoid()
    }
    
    func sendRequest<R: APIRequest, P: APIResponse>(
        _ request: R,
        decode type: P.Type
    ) -> Promise<P> {
        return APIs.send(request, decode: type)
    }
    
    func sendReauthableRequest<R: APIRequest>(_ request: R) -> Promise<Void> {
        guard SessionManager.shared.token != nil else {
            return Promise(error: UnauthorizedError())
        }
        let reauthRequest = RefreshTokenRequest()
        return APIs.send(request, reauthRequest, decode: Data.self).asVoid()
    }
    
    func sendReauthableRequest<R: APIRequest, P: APIResponse>(
        _ request: R,
        decode type: P.Type
    ) -> Promise<P> {
        guard SessionManager.shared.token != nil else {
            return Promise(error: UnauthorizedError())
        }
        let reauthRequest = RefreshTokenRequest()
        return APIs.send(request, reauthRequest, decode: type)
    }
}
