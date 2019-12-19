//
//  ViewModel.swift
//  FunnyMoto
//
//  Created by 汤世昭 on 2019/5/17.
//  Copyright © 2019 苏打出行. All rights reserved.
//

import UIKit
import PromiseKit

protocol ViewModel {
    associatedtype Controller: UIViewController
    
    var controller: Controller? { get }
    
    func updateControllerUI()
}

extension ViewModel {
    
}
