//
//  SettingPasswordViewModel.swift
//  FunnyMoto
//
//  Created by 汤世昭 on 2019/5/20.
//  Copyright © 2019 苏打出行. All rights reserved.
//

import UIKit
import PromiseKit

// MARK: - Basic
final class SetPasswordViewModel: ViewModel {
    typealias Controller = SetPasswordViewController
    weak var controller: SetPasswordViewController?
    
    var password: String? = nil {
        didSet {
            self.controller?.passwordTextField?.text = self.password
            self.controller?.passwordClearBtn?.isHidden = self.password?.isEmpty ?? true
            self.controller?.actionBtn?.isEnabled = self.actionEnable
        }
    }
    
    var passwordVisible: Bool = false {
        didSet {
            self.controller?.passwordTextField?.isSecureTextEntry = !self.passwordVisible
            self.controller?.passwordVisibleBtn?.isSelected = self.passwordVisible
        }
    }
    
    var actionEnable: Bool {
        guard let password = self.password else {
            return false
        }
        guard PASSWORD_LENGTH.contains(password.count) else {
            return false
        }
        return true
    }
    
    func updateControllerUI() {
        self.controller?.passwordClearBtn?.isHidden = self.password?.isEmpty ?? true
        self.controller?.passwordTextField?.isSecureTextEntry = !self.passwordVisible
        self.controller?.passwordVisibleBtn?.isSelected = self.passwordVisible
        self.controller?.actionBtn?.isEnabled = self.actionEnable
    }
    
    func passwordShouldChange(with targetText: String) -> Bool {
        return targetText.count <= PASSWORD_LENGTH.upperBound
    }
}


extension SetPasswordViewModel: UserService, VehicleService {
    func setUserNewPassword() -> Promise<Void> {
        guard let password = self.password else {
            return Promise(error: ValidationError("请输入您的新密码"))
        }
        guard password.isPassword == true else {
            return Promise(error: ValidationError("密码为\(PASSWORD_LENGTH.lowerBound)到\(PASSWORD_LENGTH.upperBound)位字母和数字的组合"))
        }
        return self.setUserNewPassword(newPassword: password)
    }
}
