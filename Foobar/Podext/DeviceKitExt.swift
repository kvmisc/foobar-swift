//
//  DeviceKitExt.swift
//  Foobar
//
//  Created by Kevin Wu on 11/27/19.
//  Copyright (c) firefly.com. All rights reserved.
//

import DeviceKit

extension Device {

  var hasNotch: Bool {
    return isOneOf(Device.allXSeriesDevices) || isOneOf(Device.allSimulatorXSeriesDevices)
  }

}
