//
//  Metrics.swift
//  Foobar
//
//  Created by Kevin Wu on 12/5/19.
//  Copyright (c) firefly.com. All rights reserved.
//

import DeviceKit

///-------
/// Screen
///-------
////////////////////////////////////////////////////////////////////////////////
//
// Screen Resolution
//
// Device       bounds      nativeBounds  scale nativeScale
// 4/4s         {320, 480}  {640, 960}    2.0   2.0
// 5/5s/SE      {320, 568}  {640, 1136}   2.0   2.0
// 6 /6s /7 /8  {375, 667}  {750, 1334}   2.0   2.0
// 6P/6sP/7P/8P {414, 736}  {1242, 2208}  3.0   3.0
// X/XS/11P     {375, 812}  {1125, 2436}  3.0   3.0
// XR/11        {414, 896}  {828, 1792}   2.0   2.0
// XSM/11PM     {414, 896}  {1242, 2688}  3.0   3.0
//
////////////////////////////////////////////////////////////////////////////////

let SCREEN_HAS_NOTCH: Bool =
  Device.current.isOneOf(Device.allXSeriesDevices)
    || Device.current.isOneOf(Device.allSimulatorXSeriesDevices)

// 屏幕宽和高的数值，根据横竖屏变化
let SCREEN_WID: Int = Int(UIScreen.main.bounds.size.width)
let SCREEN_HET: Int = Int(UIScreen.main.bounds.size.height)
// 屏幕高和矮的数值，不管横竖屏
let SCREEN_TAL: Int = max(SCREEN_WID, SCREEN_HET)
let SCREEN_SRT: Int = min(SCREEN_WID, SCREEN_HET)


///-----------------------
/// Status Bar & Safe Area
///-----------------------

let STATUS_BAR_HET: Int = SCREEN_HAS_NOTCH ? 44 : 20

// In Portrait
//     44pt
// 00pt    00pt
//     34pt
let SAFE_AREA_TOP: Int = SCREEN_HAS_NOTCH ? 44 : 0
let SAFE_AREA_BOT: Int = SCREEN_HAS_NOTCH ? 34 : 0
let SAFE_AREA_LFT: Int = 0
let SAFE_AREA_RIT: Int = 0

// In Landscape
//     00pt
// 44pt    44pt
//     21pt
let SAFE_AREA_LANDSCAPE_TOP: Int = 0
let SAFE_AREA_LANDSCAPE_BOT: Int = SCREEN_HAS_NOTCH ? 21 : 0
let SAFE_AREA_LANDSCAPE_LFT: Int = SCREEN_HAS_NOTCH ? 44 : 0
let SAFE_AREA_LANDSCAPE_RIT: Int = SCREEN_HAS_NOTCH ? 44 : 0
