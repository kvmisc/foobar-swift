//
//  UserRequest.swift
//  FunnyMoto
//
//  Created by 汤世昭 on 2019/6/16.
//  Copyright © 2019 苏打出行. All rights reserved.
//

import Alamofire

// MARK: - 重置密码
struct UserResetPwdRequest: MotoAPIRequest, APIRequestBearerAuthorizable {
    let uri: String = "/user/password/reset"
    let method: HTTPMethod = .put
    var parameters: [String : Any]? = [:]
    
    init(mobile: String, verificationCode: String, newPassword: String) {
        self.parameters?["phone"] = mobile
        self.parameters?["sms_code"] = verificationCode
        self.parameters?["new_password"] = newPassword
    }
}

// MARK: - 个人信息
struct GetUserInfoRequest: MotoAPIRequest, APIRequestBearerAuthorizable {
    let uri: String = "/user/me"
    let method: HTTPMethod = .get
    var parameters: [String : Any]? = [:]
    
    init() { }
}

// MARK: - 修改个人信息
struct ModifyUserInfoRequest: MotoAPIRequest, APIRequestBearerAuthorizable {
    let uri: String = "/user/me"
    let method: HTTPMethod = .put
    var parameters: [String : Any]? = [:]
    
    init(filename: String?, gender: User.Gender?, nickname: String?) {
        if let filename = filename {
            self.parameters?["avatar"] = filename
        }
        if let gender = gender?.rawValue {
            self.parameters?["gender"] = gender
        }
        if let nickname = nickname {
            self.parameters?["nickname"] = nickname
        }
    }
}

// MARK: - 修改个人安全信息
struct ModifyUserSecurityInfoRequest: MotoAPIRequest, APIRequestBearerAuthorizable {
    let uri: String = "/user/me/security"
    let method: HTTPMethod = .put
    var parameters: [String : Any]? = [:]
    
    init(realName: String?,
         contactPhone: String?,
         emergencyContactName: String?,
         emergencyContactPhone: String?) {
        if let realName = realName {
            self.parameters?["real_name"] = realName
        }
        if let contactPhone = contactPhone {
            self.parameters?["contact_phone"] = contactPhone
        }
        if let emergencyContactName = emergencyContactName {
            self.parameters?["emergency_contact"] = emergencyContactName
        }
        if let emergencyContactPhone = emergencyContactPhone {
            self.parameters?["emergency_phone"] = emergencyContactPhone
        }
    }
}

// MARK: - 修改密码
struct ModifyUserPwdRequest: MotoAPIRequest, APIRequestBearerAuthorizable {
    let uri: String = "/user/me/password"
    let method: HTTPMethod = .put
    var parameters: [String : Any]? = [:]
    
    init(oldPassword: String?, newPassword: String) {
        if let oldPassword = oldPassword {
            self.parameters?["old_password"] = oldPassword
        }
        self.parameters?["new_password"] = newPassword
    }
}

// MARK: - 检查解绑手机号验证
struct CheckUnbindMobileVerficiationCodeRequest: MotoAPIRequest, APIRequestBearerAuthorizable {
    let uri: String = "/user/me/phone/rebind/code-check"
    let method: HTTPMethod = .get
    var parameters: [String : Any]? = [:]
    
    init(verificationCode: String) {
        self.parameters?["sms-code"] = verificationCode
    }
}

// MARK: - 绑定新手机号
struct RebindUserMobileRequest: MotoAPIRequest, APIRequestBearerAuthorizable {
    let uri: String = "/user/me/phone/rebind"
    let method: HTTPMethod = .put
    var parameters: [String : Any]? = [:]
    
    init(newMobile: String,
         oldVerificationCode: String,
         newVerificationCode: String) {
        self.parameters?["new_phone"] = newMobile
        self.parameters?["old_phone_sms_code"] = oldVerificationCode
        self.parameters?["new_phone_sms_code"] = newVerificationCode
    }
}


// MARK: - 检查用户是否需要设置登录密码
struct CheckUserNeedPasswordRequest: MotoAPIRequest, APIRequestBearerAuthorizable {
    let uri: String = "/user/me/check"
    let method: HTTPMethod = .get
    var parameters: [String : Any]? = [:]
    
    init() {
        
    }
}

// MARK: - 检测用记是否注册
struct CheckNewUserRequest: MotoAPIRequest, APIRequestBearerAuthorizable {
    let uri: String = "/me/phone/phone-check"
    let method: HTTPMethod = .put
    var parameters: [String : Any]? = [:]
    
    init(mobile: String) {
        self.parameters?["cellPhone"] = mobile
    }
}

// MARK: - 提交意见反馈
struct CommitFeedbackRequest: MotoAPIRequest, APIRequestBearerAuthorizable {
    let uri: String = "/user/me/app-feedback"
    let method: HTTPMethod = .post
    var parameters: [String : Any]? = [:]
    
    init(content: String, images: [String]?, type: Feedback.`Type`) {
        self.parameters?["content"] = content
        self.parameters?["type"] = type.rawValue
        if let images = images {
            self.parameters?["images"] = images
        }
    }
}

// MARK: - 设置系统通知开关
struct SetSystemNotificationSwitchRequest: MotoAPIRequest, APIRequestBearerAuthorizable {
    let uri: String = "/user/me/system-notification"
    let method: HTTPMethod = .put
    var parameters: [String : Any]? = [:]
    
    init(`switch`: Switch) {
        self.parameters?["switcher"] = `switch`.rawValue
    }
}

// MARK: - 设置车辆提醒通知开关
struct SetVehicleNotificationSwitchRequest: MotoAPIRequest, APIRequestBearerAuthorizable {
    let uri: String = "/user/me/vehicle-notification"
    let method: HTTPMethod = .put
    var parameters: [String : Any]? = [:]
    
    init(`switch`: Switch) {
        self.parameters?["switcher"] = `switch`.rawValue
    }
}


// MARK: - 绑定新手机号
struct BindWeChatRequest: MotoAPIRequest, APIRequestBearerAuthorizable {
    let uri: String = "/wx/getWechatOpenId"
    let method: HTTPMethod = .get
    var parameters: [String : Any]? = [:]
    
    init(code: String) {
        self.parameters?["code"] = code
    }
}
