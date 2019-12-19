//
//  VehicleService.swift
//  FunnyMoto
//
//  Created by 汤世昭 on 2019/6/20.
//  Copyright © 2019 苏打出行. All rights reserved.
//

import Foundation
import PromiseKit
import SwiftyJSON

protocol VehicleService: BasicService {
    
}

extension VehicleService {
    func getVehicles() -> Promise<[Vehicle]> {
        let request = GetVehiclesRequest()
        return sendReauthableRequest(request,
                                     decode: Page<Vehicle>.self)
            .map { $0.entries }
    }
    
    func getVehicle(by vehicleId: String) -> Promise<Vehicle> {
        let request = GetVehicleRequest(vehicleId: vehicleId)
        return sendReauthableRequest(request,
                                     decode:Vehicle.self)
    }
    
    func getUserCurrentVehicle() -> Promise<Vehicle?> {
        return getVehicles()
            .then { (vehicles) -> Promise<Vehicle?> in
                let currentVehicles = vehicles.filter { $0.current }
                if let currentVehicle = currentVehicles.first {
                    SessionManager.shared.update(currentVehicle: currentVehicle)
                } 
                return Promise.value(currentVehicles.first)
        }
    }
    
    func bindVehicle(vin: String) -> Promise<Void> {
        let request = BindVehicleRequest(vin: vin)
        return sendReauthableRequest(request)
    }
    
    func unbindVehilce(vehicleId: String, verificationCode: String) -> Promise<Void> {
        let request = UnbindVehicleRequest(vehicleId: vehicleId,
                                           verificationCode: verificationCode)
        return sendReauthableRequest(request)
    }
    
    // MARK: - PUT(/user/me/vehicle/{id})
    
    func modifyVehicleNickname(vehicleId: String, vehicleNickname: String) -> Promise<Void> {
        let request = ModifyUserVehicleRequest(vehicleId: vehicleId,
                                               nickname: vehicleNickname,
                                               licensePlateNumber: nil,
                                               modelId: nil,
                                               engineNumber: nil,
                                               color: nil,
                                               producedAt: nil)
        return sendReauthableRequest(request)
    }
    
    func modifyVehicleLicensePlateNumber(vehicleId: String, licensePlateNumber: String) -> Promise<Void> {
        let request = ModifyUserVehicleRequest(vehicleId: vehicleId,
                                               nickname: nil,
                                               licensePlateNumber: licensePlateNumber,
                                               modelId: nil,
                                               engineNumber: nil,
                                               color: nil,
                                               producedAt: nil)
        return sendReauthableRequest(request)
    }
    
    // MARK: - PUT(/vehicle/{id})
    
    func modifyVehicleModel(vehicleId: String, modelId: String) -> Promise<Void> {
        let request = ModifyUserVehicleRequest(vehicleId: vehicleId,
                                               nickname: nil,
                                               licensePlateNumber: nil,
                                               modelId: modelId,
                                               engineNumber: nil,
                                               color: nil,
                                               producedAt: nil)
        return sendReauthableRequest(request)
    }
    
    func modifyVehicleEngineNumber(vehicleId: String, vehicleEngineNumber: String) -> Promise<Void> {
        let request = ModifyUserVehicleRequest(vehicleId: vehicleId,
                                               nickname: nil,
                                               licensePlateNumber: nil,
                                               modelId: nil,
                                               engineNumber: vehicleEngineNumber,
                                               color: nil,
                                               producedAt: nil)
        return sendReauthableRequest(request)
    }
    
    func modifyVehicleColor(vehicleId: String, vehicleColor: String) -> Promise<Void> {
        let request = ModifyUserVehicleRequest(vehicleId: vehicleId,
                                               nickname: nil,
                                               licensePlateNumber: nil,
                                               modelId: nil,
                                               engineNumber: nil,
                                               color: vehicleColor,
                                               producedAt: nil)
        return sendReauthableRequest(request)
    }
    
    func modifyVehicleProducedAt(vehicleId: String, producedAt: Date) -> Promise<Void> {
        let request = ModifyUserVehicleRequest(vehicleId: vehicleId,
                                               nickname: nil,
                                               licensePlateNumber: nil,
                                               modelId: nil,
                                               engineNumber: nil,
                                               color: nil,
                                               producedAt: producedAt)
        return sendReauthableRequest(request)
    }
    
    func switchUserCurrentVehicle(vehicleId: String) -> Promise<Void> {
        let request = SwitchCurrentVehicleRequest(vehicleId: vehicleId)
        return sendReauthableRequest(request)
    }
    
    func getVehicleAlertSettings(vehicleId: String) -> Promise<[AlertSetting]> {
        let request = GetVehicleAlertSettingRequest(vehicleId: vehicleId)
        return sendReauthableRequest(request, decode: [AlertSetting].self)
    }

    func modifyVehicleShakeAlertSetting(vehicleId: String, alertSetting: AlertSetting) -> Promise<Void> {
        let request = ModifyVehicleAlertSettingRequest(vehicleId: vehicleId,
                                                       alertSetting: alertSetting)
        return sendReauthableRequest(request)
    }
    
    func modifyVehicleFenceAlertSetting(vehicleId: String, alertSetting: AlertSetting) -> Promise<Void> {
        let request = ModifyVehicleAlertSettingRequest(vehicleId: vehicleId, alertSetting: alertSetting)
        return sendReauthableRequest(request)
    }
    
    func addVehicleArea(vehicleId: String, area: Area) -> Promise<Area> {
        let request = CreateVehicleAreaRequest(vehicleId: vehicleId, area: area)
        return sendReauthableRequest(request, decode: Area.self)
    }
    
    func modifyVehicleArea(vehicleId: String, area: Area) -> Promise<Area> {
        let request = ModifyVehicleAreaRequest(vehicleId: vehicleId, area: area)
        return sendReauthableRequest(request, decode: Area.self)
    }
    
    func deleteVehicleArea(area: Area) -> Promise<Void> {
        let request = DeleteVehicleAreaRequest(area: area)
        return sendReauthableRequest(request)
    }
    
    func getMonthlyStatistics(vehicleId: String, date: Date = Date()) -> Promise<MonthlyStatistics> {
        let request = GetMonthlyStatisticsRequest(vehicleId: vehicleId, date: date)
        return sendReauthableRequest(request, decode: MonthlyStatistics.self)
    }
    
    func getLastTwoMonthsStatistics(vehicleId: String) -> Promise<[TwoMonthlyStatistics]> {
         let request = GetLastTwoMonthlyStatisticsRequest(vehicleId: vehicleId)
         return sendReauthableRequest(request, decode: [TwoMonthlyStatistics].self)
     }
    
    func getDailyStatistics(vehicleId: String, date: Date = Date()) -> Promise<DailyStatistics>  {
        let request = GetDailyStatisticsRequest(vehicleId: vehicleId, date: date)
        return sendReauthableRequest(request, decode: DailyStatistics.self)
    }
    
    func getVehicleSafetyIndex(vehicleId: String) -> Promise<SafetyIndex> {
        let request = GetVehicleSafetyIndexRequest(vehicleId: vehicleId)
        return sendReauthableRequest(request, decode: SafetyIndex.self)
    }
    
    
    func getVehicleSafetyIndexCompetition(vehicleId: String) -> Promise<Double> {
        let request = GetVehicleSafetyIndexCompetitionRequest(vehicleId: vehicleId)
        return sendReauthableRequest(request,
                                     decode: JSON.self)
            .map { $0["value"].doubleValue }
    }
    
    func calculateVehicleSafetyIndex(vehicleId: String) -> Promise<SafetyIndex> {
        let request = CalculateVehicleSafetyIndexRequest(vehicleId: vehicleId)
        return sendReauthableRequest(request, decode: SafetyIndex.self)
    }
    
    func getVehicleHistoryPath(vehicleId: String, startTime: Date, endTime: Date) -> Promise<HistoryPath> {
        let request = GetVehicleHistoryPathRequest(vehicleId: vehicleId,
                                                   startTime: startTime,
                                                   endTime: endTime)
        return sendReauthableRequest(request, decode: HistoryPath.self)
    }
    
    func getVehicleHistoryStatistics(vehicleId: String, startTime: Date, endTime: Date) -> Promise<Summation> {
        let request = GetVehicleHistoryStatisticsRequest(vehicleId: vehicleId,
                                                         startTime: startTime,
                                                         endTime: endTime)
        return sendReauthableRequest(request, decode: Summation.self)
    }
    
    func getVehicleBrands(page: Int, limit: Int) -> Promise<Page<Brand>> {
        let request = GetVehicleBrandsRequest(page: page, limit: limit)
        return sendRequest(request, decode: Page<Brand>.self)
    }
    
    func getVehicleBrandModels(brandId: String, page: Int, limit: Int) -> Promise<Page<Model>> {
        let request = GetVehicleBrandModelsRequest(brandId: brandId, page: page, limit: limit)
        return sendRequest(request, decode: Page<Model>.self)
    }
    
    func modifyStolenOrSecure(vehicleId: String, parameter: String, isOn: Bool) -> Promise<Void> {
        let request = ModifyStolenOrSecureRequest(vehicleId: vehicleId, type: parameter, isOn: isOn)
        return sendReauthableRequest(request)
    }
}
