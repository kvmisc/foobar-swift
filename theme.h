//
//  UIKit+Theme.swift
//  SwiftTheme
//
//  Created by Gesen on 16/1/22.
//  Copyright © 2016年 Gesen. All rights reserved.
//

import UIKit

@objc public extension UIView
{
    xib/code: plain/theme
    var theme_backgroundColor: ThemeColorPicker? {
        get { return getThemePicker(self, "setBackgroundColor:") as? ThemeColorPicker }
        set { setThemePicker(self, "setBackgroundColor:", newValue) }
    }
    xib/code: plain/theme
    var theme_tintColor: ThemeColorPicker? {
        get { return getThemePicker(self, "setTintColor:") as? ThemeColorPicker }
        set { setThemePicker(self, "setTintColor:", newValue) }
    }
}
@objc public extension UIImageView
{
    xib/code: plain/theme
    var theme_image: ThemeImagePicker? {
        get { return getThemePicker(self, "setImage:") as? ThemeImagePicker }
        set { setThemePicker(self, "setImage:", newValue) }
    }
}



@objc public extension UILabel
{
    xib/code: plain
    var theme_font: ThemeFontPicker? {
        get { return getThemePicker(self, "setFont:") as? ThemeFontPicker }
        set { setThemePicker(self, "setFont:", newValue) }
    }
    xib/code: plain/theme
    var theme_textColor: ThemeColorPicker? {
        get { return getThemePicker(self, "setTextColor:") as? ThemeColorPicker }
        set { setThemePicker(self, "setTextColor:", newValue) }
    }
}
@objc public extension UITextField
{
    xib/code: plain
    var theme_font: ThemeFontPicker? {
        get { return getThemePicker(self, "setFont:") as? ThemeFontPicker }
        set { setThemePicker(self, "setFont:", newValue) }
    }
    xib/code: plain/theme
    var theme_textColor: ThemeColorPicker? {
        get { return getThemePicker(self, "setTextColor:") as? ThemeColorPicker }
        set { setThemePicker(self, "setTextColor:", newValue) }
    }

    placeholder

    ???
    var theme_keyboardAppearance: ThemeKeyboardAppearancePicker? {
        get { return getThemePicker(self, "setKeyboardAppearance:") as? ThemeKeyboardAppearancePicker }
        set { setThemePicker(self, "setKeyboardAppearance:", newValue) }
    }
}
@objc public extension UITextView
{
    xib/code: plain/theme
    var theme_font: ThemeFontPicker? {
        get { return getThemePicker(self, "setFont:") as? ThemeFontPicker }
        set { setThemePicker(self, "setFont:", newValue) }
    }
    xib/code: plain/theme
    var theme_textColor: ThemeColorPicker? {
        get { return getThemePicker(self, "setTextColor:") as? ThemeColorPicker }
        set { setThemePicker(self, "setTextColor:", newValue) }
    }

    placeholder

    ???
    var theme_keyboardAppearance: ThemeKeyboardAppearancePicker? {
        get { return getThemePicker(self, "setKeyboardAppearance:") as? ThemeKeyboardAppearancePicker }
        set { setThemePicker(self, "setKeyboardAppearance:", newValue) }
    }
}


@objc public extension UIButton
{
    xib/code: plain/theme
    func theme_setImage(_ picker: ThemeImagePicker?, forState state: UIControl.State) {
        let statePicker = makeStatePicker(self, "setImage:forState:", picker, state)
        setThemePicker(self, "setImage:forState:", statePicker)
    }
    xib/code: plain/theme
    func theme_setBackgroundImage(_ picker: ThemeImagePicker?, forState state: UIControl.State) {
        let statePicker = makeStatePicker(self, "setBackgroundImage:forState:", picker, state)
        setThemePicker(self, "setBackgroundImage:forState:", statePicker)
    }

    color image

    font

    func theme_setTitleColor(_ picker: ThemeColorPicker?, forState state: UIControl.State) {
        let statePicker = makeStatePicker(self, "setTitleColor:forState:", picker, state)
        setThemePicker(self, "setTitleColor:forState:", statePicker)
    }
}
@objc public extension CALayer
{
    var theme_backgroundColor: ThemeCGColorPicker? {
        get { return getThemePicker(self, "setBackgroundColor:") as? ThemeCGColorPicker}
        set { setThemePicker(self, "setBackgroundColor:", newValue) }
    }
    var theme_borderWidth: ThemeCGFloatPicker? {
        get { return getThemePicker(self, "setBorderWidth:") as? ThemeCGFloatPicker }
        set { setThemePicker(self, "setBorderWidth:", newValue) }
    }
    var theme_borderColor: ThemeCGColorPicker? {
        get { return getThemePicker(self, "setBorderColor:") as? ThemeCGColorPicker }
        set { setThemePicker(self, "setBorderColor:", newValue) }
    }
    var theme_shadowColor: ThemeCGColorPicker? {
        get { return getThemePicker(self, "setShadowColor:") as? ThemeCGColorPicker }
        set { setThemePicker(self, "setShadowColor:", newValue) }
    }
    var theme_strokeColor: ThemeCGColorPicker? {
        get { return getThemePicker(self, "setStrokeColor:") as? ThemeCGColorPicker }
        set { setThemePicker(self, "setStrokeColor:", newValue) }
    }
    var theme_fillColor: ThemeCGColorPicker?{
        get { return getThemePicker(self, "setFillColor:") as? ThemeCGColorPicker }
        set { setThemePicker(self, "setFillColor:", newValue) }
    }
}
