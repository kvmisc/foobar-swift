//
//  ThemeXib.swift
//  Foobar
//
//  Created by Kevin Wu on 1/16/20.
//  Copyright (c) firefly.com. All rights reserved.
//

import UIKit
import SwiftTheme

// # 开头为固定值, 不能根据主题切换

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
  @IBInspectable var txt_font: String? {
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
  @IBInspectable var txt_font: String? {
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
  @IBInspectable var txt_font: String? {
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
  @IBInspectable var ttl_font: String? {
    get { return "" }
    set {
      guard let newValue = newValue, !newValue.isEmpty else { return }
      if newValue.hasPrefix("#") {
        titleLabel?.font = ccf(CGFloat(Int(String(newValue.dropFirst()))!))
      } else {
        // ...
      }
    }
  }
  // 多个状态颜色通过逗号分隔, normal,highlighted,disabled,selected
  // @ 开头, 通过普通色自动产生高亮色
  // @#FF0000, 固定色, 高亮色自动产生
  // @btn.n, 主题色, 高亮色自动产生
  // #FF0000, 固定色, 仅设普通色
  // btn.n,btn.h, 主题色, 设普通色和高亮色
  @IBInspectable var ttl_color: String? {
    get { return "" }
    set {
      guard let newValue = newValue, !newValue.isEmpty else { return }
      if newValue.hasPrefix("@") {
        let value = String(newValue.dropFirst())
        if value.hasPrefix("#") {
          setTitleColor(ccc(value), for: .normal)
          setTitleColor(ccc(value).extOverlayWhite(), for: .highlighted)
        } else {
          theme_setTitleColor(ThemeWorker.shared.getColorPicker(color: value), forState: .normal)
          theme_setTitleColor(ThemeWorker.shared.getColorPicker(hicolor: value), forState: .highlighted)
        }
      } else {
        let list = newValue.components(separatedBy: ",")
        let states: [UIControl.State] = [.normal, .highlighted, .disabled, .selected]
        for (index,state) in states.enumerated() {
          if list.count > index {
            let value = list[index]
            if value.isEmpty { continue }
            if value.hasPrefix("#") {
              setTitleColor(ccc(value), for: state)
            } else {
              theme_setTitleColor(ThemeWorker.shared.getColorPicker(color: value), forState: state)
            }
          }
        }
      }
    }
  }

  @IBInspectable var fr_image: String? {
    get { return "" }
    set {
      guard let newValue = newValue, !newValue.isEmpty else { return }
      let list = newValue.components(separatedBy: ",")
      let states: [UIControl.State] = [.normal, .highlighted, .disabled, .selected]
      for (index,state) in states.enumerated() {
        if list.count > index {
          let value = list[index]
          if value.isEmpty { continue }
          if value.hasPrefix("#") {
            setImage(cci(String(value.dropFirst())), for: state)
          } else {
            theme_setImage(ThemeWorker.shared.getImagePicker(image: value), forState: state)
          }
        }
      }
    }
  }
  @IBInspectable var bg_image: String? {
    get { return "" }
    set {
      guard let newValue = newValue, !newValue.isEmpty else { return }
      let list = newValue.components(separatedBy: ",")
      let states: [UIControl.State] = [.normal, .highlighted, .disabled, .selected]
      for (index,state) in states.enumerated() {
        if list.count > index {
          let value = list[index]
          if value.isEmpty { continue }
          if value.hasPrefix("#") {
            setBackgroundImage(cci(String(value.dropFirst())), for: state)
          } else {
            theme_setBackgroundImage(ThemeWorker.shared.getImagePicker(image: value), forState: state)
          }
        }
      }
    }
  }
  @IBInspectable var clr_image: String? {
    get { return "" }
    set {
      guard let newValue = newValue, !newValue.isEmpty else { return }
      if newValue.hasPrefix("@") {
        let value = String(newValue.dropFirst())
        if value.hasPrefix("#") {
          setBackgroundImage(UIImage.extColored(ccc(value), ccs(6.0)), for: .normal)
          setBackgroundImage(UIImage.extColored(ccc(value).extOverlayWhite(), ccs(6.0)), for: .highlighted)
        } else {
          theme_setBackgroundImage(ThemeWorker.shared.getImagePicker(color: value), forState: .normal)
          theme_setBackgroundImage(ThemeWorker.shared.getImagePicker(hicolor: value), forState: .highlighted)
        }
      } else {
        let list = newValue.components(separatedBy: ",")
        let states: [UIControl.State] = [.normal, .highlighted, .disabled, .selected]
        for (index,state) in states.enumerated() {
          if list.count > index {
            let value = list[index]
            if value.isEmpty { continue }
            if value.hasPrefix("#") {
              setBackgroundImage(UIImage.extColored(ccc(value), ccs(6.0)), for: .normal)
            } else {
              theme_setBackgroundImage(ThemeWorker.shared.getImagePicker(color: value), forState: state)
            }
          }
        }
      }
    }
  }
}
