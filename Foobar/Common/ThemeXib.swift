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
        theme_backgroundColor = ThemeColorPicker.pickerWithColors(ThemeWorker.shared.getValues(newValue))
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
        theme_tintColor = ThemeColorPicker(keyPath: newValue)
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
        theme_image = [newValue+"_day", newValue+"_night"]
      }
    }
  }
}

extension UILabel {
  @IBInspectable var txt_color: String? {
    get { return "" }
    set {
      guard let newValue = newValue else { return }
      if newValue.hasPrefix("#") {
        textColor = ccc(newValue)
      } else {
        theme_textColor = ThemeColorPicker.pickerWithKeyPath(newValue)
      }
    }
  }
}
extension UITextField {
  @IBInspectable var txt_color: String? {
    get { return "" }
    set {
      guard let newValue = newValue else { return }
      if newValue.hasPrefix("#") {
        textColor = ccc(newValue)
      } else {
        theme_textColor = ThemeColorPicker.pickerWithKeyPath(newValue)
      }
    }

  }
}
extension UITextView {
  @IBInspectable var txt_color: String? {
    get { return "" }
    set {
      guard let newValue = newValue else { return }
      if newValue.hasPrefix("#") {
        textColor = ccc(newValue)
      } else {
        theme_textColor = ThemeColorPicker.pickerWithKeyPath(newValue)
      }
    }

  }
}
