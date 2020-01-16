//
//  ThemeXib.swift
//  Foobar
//
//  Created by Kevin Wu on 1/16/20.
//  Copyright (c) firefly.com. All rights reserved.
//

import UIKit
import SwiftTheme

extension UIView {
  @IBInspectable var bg_color: String? {
    get { return "" }
    set {
      guard let newValue = newValue else { return }
      if newValue.hasPrefix("#") {
        backgroundColor = ccc(newValue)
      } else {
        theme_backgroundColor = ThemeColorPicker.pickerWithColors(ThemeWorker.shared.getBodyValues(newValue))
      }
    }
  }
  @IBInspectable var tnt_color: String? {
    get { return "" }
    set {
      guard let newValue = newValue else { return }
      if newValue.hasPrefix("#") {
        tintColor = ccc(newValue)
      } else {
        theme_tintColor = ThemeColorPicker.pickerWithColors(ThemeWorker.shared.getBodyValues(newValue))
      }
    }
  }

  @IBInspectable var bd_radius: CGFloat {
    get {
      layer.cornerRadius
    }
    set {
      layer.cornerRadius = newValue
      layer.masksToBounds = newValue > 0.0
    }
  }

  @IBInspectable var bd_width: CGFloat {
    get {
      return layer.borderWidth
    }
    set {
      layer.borderWidth = newValue
    }
  }
  @IBInspectable var bd_color: String? {
    get {
      return ""
    }
    set {
      guard let newValue = newValue else { return }
      if newValue.hasPrefix("#") {
        layer.borderColor = ccc(newValue).cgColor
      } else {
        layer.theme_borderColor = ThemeCGColorPicker.pickerWithColors(ThemeWorker.shared.getBodyValues(newValue))
      }
    }
  }
}
extension UIImageView {
  @IBInspectable var img: String? {
    get { return "" }
    set {
      guard let newValue = newValue else { return }
      if newValue.hasPrefix("#") {
        image = cci(String(newValue.dropFirst()))
      } else {
        theme_image = ThemeImagePicker.pickerWithNames(ThemeWorker.shared.getImageNames(newValue))
      }
    }
  }
}

extension UILabel {
  @IBInspectable var fnt: String? {
    get { return "" }
    set {
      guard let newValue = newValue else { return }
      if newValue.hasPrefix("#") {
        font = ccf(CGFloat(Int(String(newValue.dropFirst()))!))
      } else {
        // ...
      }
    }
  }
  @IBInspectable var txt_color: String? {
    get { return "" }
    set {
      guard let newValue = newValue else { return }
      if newValue.hasPrefix("#") {
        textColor = ccc(newValue)
      } else {
        theme_textColor = ThemeColorPicker.pickerWithColors(ThemeWorker.shared.getBodyValues(newValue))
      }
    }
  }
}
extension UITextField {
  @IBInspectable var fnt: String? {
    get { return "" }
    set {
      guard let newValue = newValue else { return }
      if newValue.hasPrefix("#") {
        font = ccf(CGFloat(Int(String(newValue.dropFirst()))!))
      } else {
        // ...
      }
    }
  }
  @IBInspectable var txt_color: String? {
    get { return "" }
    set {
      guard let newValue = newValue else { return }
      if newValue.hasPrefix("#") {
        textColor = ccc(newValue)
      } else {
        theme_textColor = ThemeColorPicker.pickerWithColors(ThemeWorker.shared.getBodyValues(newValue))
      }
    }
  }
}
extension UITextView {
  @IBInspectable var fnt: String? {
    get { return "" }
    set {
      guard let newValue = newValue else { return }
      if newValue.hasPrefix("#") {
        font = ccf(CGFloat(Int(String(newValue.dropFirst()))!))
      } else {
        // ...
      }
    }
  }
  @IBInspectable var txt_color: String? {
    get { return "" }
    set {
      guard let newValue = newValue else { return }
      if newValue.hasPrefix("#") {
        textColor = ccc(newValue)
      } else {
        theme_textColor = ThemeColorPicker.pickerWithColors(ThemeWorker.shared.getBodyValues(newValue))
      }
    }
  }
}
