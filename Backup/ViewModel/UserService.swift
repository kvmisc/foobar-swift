//
//  UserService.swift
//  FunnyMoto
//
//  Created by 汤世昭 on 2019/6/20.
//  Copyright © 2019 苏打出行. All rights reserved.
//

import Foundation
import PromiseKit
import SwiftyJSON

protocol UserService: BasicService {
    
}

extension UserService {
    
    // MARK: - PUT(/user/password/reset)
    /// 重置用户密码
    func resetUserPassword(mobile: String, verificationCode: String, newPassword: String) -> Promise<Void> {
        let newPasswordHash = Crypto.passwordHash(raw: newPassword)
        let request = UserResetPwdRequest(mobile: mobile,
                                          verificationCode: verificationCode,
                                          newPassword: newPasswordHash)
        return sendRequest(request)
    }
    
    // MARK: - PUT(/user/me/password)
    /// 设置用户新密码
    func setUserNewPassword(newPassword: String) -> Promise<Void> {
        let newPasswordHash = Crypto.passwordHash(raw: newPassword)
        let request = ModifyUserPwdRequest(oldPassword: nil, newPassword: newPasswordHash)
        return sendReauthableRequest(request)
    }
    
    /// 修改用户密码
    func modifyUserPassword(oldPassword: String, newPassword: String) -> Promise<Void> {
        let oldPasswordHash = Crypto.passwordHash(raw: oldPassword)
        let newPasswordHash = Crypto.passwordHash(raw: newPassword)
        let request = ModifyUserPwdRequest(oldPassword: oldPasswordHash,
                                           newPassword: newPasswordHash)
        return sendReauthableRequest(request)
    }
    
    // MARK: - GET(/user/me/check)
    /// 检查用户是否需要设置密码
    func checkUserNeedPassword() -> Promise<Bool> {
        let request = CheckUserNeedPasswordRequest()
        return sendRequest(request, decode: JSON.self)
            .map { $0["value"].boolValue }
    }
    
    // MARK: - GET(/me/phone/phone-check)
    /// 检查用户是否注册
    func checkNewUser(mobile: String) -> Promise<Bool> {
        let request = CheckNewUserRequest(mobile: mobile)
        return sendReauthableRequest(request, decode: JSON.self)
            .map { $0["value"].boolValue}
    }
    
    // MARK: - GET(/user/me)
    /// 获取用户信息
    func getUserInfo() -> Promise<User> {
        let request = GetUserInfoRequest()
        return sendReauthableRequest(request, decode: User.self)
            .get { SessionManager.shared.update(user: $0) }
    }
    
    // MARK: - PUT(/user/me)
    /// 修改用户头像
    func modifyUserAvatar(filename: String) -> Promise<Void> {
        let request = ModifyUserInfoRequest(filename: filename,
                                            gender: nil,
                                            nickname: nil)
        return sendReauthableRequest(request, decode: Data.self).asVoid()
    }
    
    /// 修改用户昵称
    func modifyUserNickname(nickname: String) -> Promise<Void> {
        let request = ModifyUserInfoRequest(filename: nil,
                                            gender: nil,
                                            nickname: nickname)
        return sendReauthableRequest(request)
    }
    
    /// 修改用户性别
    func modifyUserGender(gender: User.Gender) -> Promise<Void> {
        let request = ModifyUserInfoRequest(filename: nil,
                                            gender: gender,
                                            nickname: nil)
        return sendReauthableRequest(request)
    }
    
    // MARK: - PUT(/user/me/security)
    /// 修改用户真实姓名
    func modifyUserRealName(realName: String) -> Promise<Void> {
        let request = ModifyUserSecurityInfoRequest(realName: realName,
                                                    contactPhone: nil,
                                                    emergencyContactName: nil,
                                                    emergencyContactPhone: nil)
        return sendReauthableRequest(request)
    }
    
    /// 修改用户联系电话
    func modifyUserContactPhone(contactPhone: String) -> Promise<Void> {
        let request = ModifyUserSecurityInfoRequest(realName: nil,
                                                    contactPhone: contactPhone,
                                                    emergencyContactName: nil,
                                                    emergencyContactPhone: nil)
        return sendReauthableRequest(request)
    }
    
    /// 修改用户紧急联系人姓名
    func modifyUserEmergencyContactName(emergencyContactName: String) -> Promise<Void> {
        let request = ModifyUserSecurityInfoRequest(realName: nil,
                                                    contactPhone: nil,
                                                    emergencyContactName: emergencyContactName,
                                                    emergencyContactPhone: nil)
        return sendReauthableRequest(request)
    }
    
    /// 修改用户紧急联系人电话
    func modifyUserEmergencyContactPhone(emergencyContactPhone: String) -> Promise<Void> {
        let request = ModifyUserSecurityInfoRequest(realName: nil,
                                                    contactPhone: nil,
                                                    emergencyContactName: nil,
                                                    emergencyContactPhone: emergencyContactPhone)
        return sendReauthableRequest(request)
    }
    
    // MARK: - GET(/user/me/phone/rebind/code-check)
    /// 检查解绑手机号验证码是否正确
    func checkUnbindMobileVerficiationCode(verificationCode: String) -> Promise<Bool> {
        let request = CheckUnbindMobileVerficiationCodeRequest(verificationCode: verificationCode)
        return sendReauthableRequest(request,
                                     decode: JSON.self)
            .map { $0["value"].boolValue }
    }
    
    // MARK: - PUT(/user/me/phone/rebind)
    
    /// 改绑手机号
    func rebindUserMobile(newMobile: String, newVerificationCode: String, oldVerificationCode: String) -> Promise<Void> {
        let request = RebindUserMobileRequest(newMobile: newMobile, oldVerificationCode: oldVerificationCode, newVerificationCode: newVerificationCode)
        return sendReauthableRequest(request)
    }
    
    func commitFeedback(content: String, images: [String]?, type: Feedback.`Type`) -> Promise<Void> {
        let request = CommitFeedbackRequest(content: content, images: images, type: type)
        return sendReauthableRequest(request)
    }
    
    func setSystemNotificationsSwitch(_ `switch`: Switch) -> Promise<Void> {
        let request = SetSystemNotificationSwitchRequest(switch: `switch`)
        return sendReauthableRequest(request)
    }
    
    func setVehicleNotificationsSwitch(_ `switch`: Switch) -> Promise<Void> {
        let request = SetVehicleNotificationSwitchRequest(switch: `switch`)
        return sendReauthableRequest(request)
    }
    
    func bindWeChat(code: String) -> Promise<Bool> {
        let request = BindWeChatRequest(code: code)
        return sendReauthableRequest(request,
                                     decode: JSON.self)
            .map { $0["value"].boolValue }
    }
}
