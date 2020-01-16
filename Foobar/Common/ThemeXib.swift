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
      guard let newValue = newValue, !newValue.isEmpty else { return }
      if newValue.hasPrefix("#") {
        backgroundColor = ccc(newValue)
      } else {
        theme_backgroundColor = ThemeWorker.shared.getColorPicker(color: newValue)
      }
    }
  }
  @IBInspectable var tnt_color: String? {
    get { return "" }
    set {
      guard let newValue = newValue, !newValue.isEmpty else { return }
      if newValue.hasPrefix("#") {
        tintColor = ccc(newValue)
      } else {
        theme_tintColor = ThemeWorker.shared.getColorPicker(color: newValue)
      }
    }
  }

  @IBInspectable var bd_radius: CGFloat {
    get { layer.cornerRadius }
    set {
      layer.cornerRadius = newValue
      layer.masksToBounds = newValue > 0.0
    }
  }
  @IBInspectable var bd_width: CGFloat {
    get { return layer.borderWidth }
    set {
      layer.borderWidth = newValue
    }
  }
  @IBInspectable var bd_color: String? {
    get { return "" }
    set {
      guard let newValue = newValue, !newValue.isEmpty else { return }
      if newValue.hasPrefix("#") {
        layer.borderColor = ccc(newValue).cgColor
      } else {
        layer.theme_borderColor = ThemeWorker.shared.getColorPicker(cgcolor: newValue)
      }
    }
  }
}
extension UIImageView {
  @IBInspectable var img: String? {
    get { return "" }
    set {
      guard let newValue = newValue, !newValue.isEmpty else { return }
      if newValue.hasPrefix("#") {
        image = cci(String(newValue.dropFirst()))
      } else {
        theme_image = ThemeWorker.shared.getImagePicker(image: newValue)
      }
    }
  }
}

extension UILabel {
  @IBInspectable var fnt: String? {
    get { return "" }
    set {
      guard let newValue = newValue, !newValue.isEmpty else { return }
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
      guard let newValue = newValue, !newValue.isEmpty else { return }
      if newValue.hasPrefix("#") {
        textColor = ccc(newValue)
      } else {
        theme_textColor = ThemeWorker.shared.getColorPicker(color: newValue)
      }
    }
  }
}
extension UITextField {
  @IBInspectable var fnt: String? {
    get { return "" }
    set {
      guard let newValue = newValue, !newValue.isEmpty else { return }
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
      guard let newValue = newValue, !newValue.isEmpty else { return }
      if newValue.hasPrefix("#") {
        textColor = ccc(newValue)
      } else {
        theme_textColor = ThemeWorker.shared.getColorPicker(color: newValue)
      }
    }
  }
}
extension UITextView {
  @IBInspectable var fnt: String? {
    get { return "" }
    set {
      guard let newValue = newValue, !newValue.isEmpty else { return }
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
      guard let newValue = newValue, !newValue.isEmpty else { return }
      if newValue.hasPrefix("#") {
        textColor = ccc(newValue)
      } else {
        theme_textColor = ThemeWorker.shared.getColorPicker(color: newValue)
      }
    }
  }
}

extension UIButton {
  @IBInspectable var nm_ttl_color: String? {
    get { return "" }
    set {
      guard let newValue = newValue, !newValue.isEmpty else { return }
      if newValue.hasPrefix("#") {
        setTitleColor(ccc(newValue), for: .normal)
      } else {
        theme_setTitleColor(ThemeWorker.shared.getColorPicker(color: newValue), forState: .normal)
      }
    }
  }
  @IBInspectable var hi_ttl_color: String? {
    get { return "" }
    set {
      guard let newValue = newValue, !newValue.isEmpty else { return }
      if newValue.hasPrefix("#") {
        setTitleColor(ccc(newValue), for: .highlighted)
      } else {
        theme_setTitleColor(ThemeWorker.shared.getColorPicker(color: newValue), forState: .highlighted)
      }
    }
  }
  @IBInspectable var ds_ttl_color: String? {
    get { return "" }
    set {
      guard let newValue = newValue, !newValue.isEmpty else { return }
      if newValue.hasPrefix("#") {
        setTitleColor(ccc(newValue), for: .disabled)
      } else {
        theme_setTitleColor(ThemeWorker.shared.getColorPicker(color: newValue), forState: .disabled)
      }
    }
  }
  @IBInspectable var ttl_color: String? {
    get { return "" }
    set {
      guard let newValue = newValue, !newValue.isEmpty else { return }
      if newValue.hasPrefix("#") {
        setTitleColor(ccc(newValue), for: .normal)
        setTitleColor(ccc(newValue).extOverlayWhite(), for: .highlighted)
      } else {
        theme_setTitleColor(ThemeWorker.shared.getColorPicker(color: newValue), forState: .normal)
        theme_setTitleColor(ThemeWorker.shared.getColorPicker(hicolor: newValue), forState: .highlighted)
      }
    }
  }

  @IBInspectable var nm_image: String? {
    get { return "" }
    set {
      guard let newValue = newValue, !newValue.isEmpty else { return }
      if newValue.hasPrefix("#") {
        setImage(cci(String(newValue.dropFirst())), for: .normal)
      } else {
        theme_setImage(ThemeWorker.shared.getImagePicker(image: newValue), forState: .normal)
      }
    }
  }
  @IBInspectable var hi_image: String? {
    get { return "" }
    set {
      guard let newValue = newValue, !newValue.isEmpty else { return }
      if newValue.hasPrefix("#") {
        setImage(cci(String(newValue.dropFirst())), for: .highlighted)
      } else {
        theme_setImage(ThemeWorker.shared.getImagePicker(image: newValue), forState: .highlighted)
      }
    }
  }
  @IBInspectable var ds_image: String? {
    get { return "" }
    set {
      guard let newValue = newValue, !newValue.isEmpty else { return }
      if newValue.hasPrefix("#") {
        setImage(cci(String(newValue.dropFirst())), for: .disabled)
      } else {
        theme_setImage(ThemeWorker.shared.getImagePicker(image: newValue), forState: .disabled)
      }
    }
  }

  @IBInspectable var nm_bg_image: String? {
    get { return "" }
    set {
      guard let newValue = newValue, !newValue.isEmpty else { return }
      if newValue.hasPrefix("#") {
        setBackgroundImage(cci(String(newValue.dropFirst())), for: .normal)
      } else {
        theme_setBackgroundImage(ThemeWorker.shared.getImagePicker(image: newValue), forState: .normal)
      }
    }
  }
  @IBInspectable var hi_bg_image: String? {
    get { return "" }
    set {
      guard let newValue = newValue, !newValue.isEmpty else { return }
      if newValue.hasPrefix("#") {
        setBackgroundImage(cci(String(newValue.dropFirst())), for: .highlighted)
      } else {
        theme_setBackgroundImage(ThemeWorker.shared.getImagePicker(image: newValue), forState: .highlighted)
      }
    }
  }
  @IBInspectable var ds_bg_image: String? {
    get { return "" }
    set {
      guard let newValue = newValue, !newValue.isEmpty else { return }
      if newValue.hasPrefix("#") {
        setBackgroundImage(cci(String(newValue.dropFirst())), for: .disabled)
      } else {
        theme_setBackgroundImage(ThemeWorker.shared.getImagePicker(image: newValue), forState: .disabled)
      }
    }
  }

  @IBInspectable var nm_clr_image: String? {
    get { return "" }
    set {
      guard let newValue = newValue, !newValue.isEmpty else { return }
      if newValue.hasPrefix("#") {
        setBackgroundImage(UIImage.extColored(ccc(newValue), ccs(6.0)), for: .normal)
      } else {
        theme_setBackgroundImage(ThemeWorker.shared.getImagePicker(color: newValue), forState: .normal)
      }
    }
  }
  @IBInspectable var hi_clr_image: String? {
    get { return "" }
    set {
      guard let newValue = newValue, !newValue.isEmpty else { return }
      if newValue.hasPrefix("#") {
        setBackgroundImage(UIImage.extColored(ccc(newValue), ccs(6.0)), for: .highlighted)
      } else {
        theme_setBackgroundImage(ThemeWorker.shared.getImagePicker(color: newValue), forState: .highlighted)
      }
    }
  }
  @IBInspectable var ds_clr_image: String? {
    get { return "" }
    set {
      guard let newValue = newValue, !newValue.isEmpty else { return }
      if newValue.hasPrefix("#") {
        setBackgroundImage(UIImage.extColored(ccc(newValue), ccs(6.0)), for: .disabled)
      } else {
        theme_setBackgroundImage(ThemeWorker.shared.getImagePicker(color: newValue), forState: .disabled)
      }
    }
  }
  @IBInspectable var clr_image: String? {
    get { return "" }
    set {
      guard let newValue = newValue, !newValue.isEmpty else { return }
      if newValue.hasPrefix("#") {
        setBackgroundImage(UIImage.extColored(ccc(newValue), ccs(6.0)), for: .normal)
        setBackgroundImage(UIImage.extColored(ccc(newValue).extOverlayWhite(), ccs(6.0)), for: .highlighted)
      } else {
        theme_setBackgroundImage(ThemeWorker.shared.getImagePicker(color: newValue), forState: .normal)
        theme_setBackgroundImage(ThemeWorker.shared.getImagePicker(hicolor: newValue), forState: .highlighted)
      }
    }
  }
}
