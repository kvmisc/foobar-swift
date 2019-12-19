//
//  MotoAPIRequest.swift
//  FunnyMoto
//
//  Created by 汤世昭 on 2019/6/14.
//  Copyright © 2019 苏打出行. All rights reserved.
//

import Alamofire

protocol MotoAPIRequest: APIRequest {
    
}

extension MotoAPIRequest {
    var host: String {
        return API_HOST
    }
    var headers: HTTPHeaders? {
        return [:]
    }
}
