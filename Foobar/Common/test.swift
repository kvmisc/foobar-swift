//
//import UIKit
//import SwiftTheme
//
//@objc public extension UIView
//{
//  var abc_alpha: ThemeCGFloatPicker? {
//    get { return getThemePicker(self, "setAlpha:") as? ThemeCGFloatPicker }
//    set { setThemePicker(self, "setAlpha:", newValue) }
//  }
//}
//
//
//
//
//
//
//@objc public extension UIApplication
//{
//  #if os(iOS)
//  func abc_setStatusBarStyle(_ picker: ThemeStatusBarStylePicker, animated: Bool) {
//    picker.animated = animated
//    setThemePicker(self, "setStatusBarStyle:animated:", picker)
//  }
//  #endif
//}
//@objc public extension UIBarItem
//{
//  func abc_setTitleTextAttributes(_ picker: ThemeStringAttributesPicker?, forState state: UIControl.State) {
//    let statePicker = makeStatePicker(self, "setTitleTextAttributes:forState:", picker, state)
//    setThemePicker(self, "setTitleTextAttributes:forState:", statePicker)
//  }
//}
//@objc public extension UIBarButtonItem
//{
//  var abc_tintColor: ThemeColorPicker? {
//    get { return getThemePicker(self, "setTintColor:") as? ThemeColorPicker }
//    set { setThemePicker(self, "setTintColor:", newValue) }
//  }
//}
//@objc public extension UILabel
//{
//  var abc_font: ThemeFontPicker? {
//    get { return getThemePicker(self, "setFont:") as? ThemeFontPicker }
//    set { setThemePicker(self, "setFont:", newValue) }
//  }
//  var abc_textColor: ThemeColorPicker? {
//    get { return getThemePicker(self, "setTextColor:") as? ThemeColorPicker }
//    set { setThemePicker(self, "setTextColor:", newValue) }
//  }
//  var abc_highlightedTextColor: ThemeColorPicker? {
//    get { return getThemePicker(self, "setHighlightedTextColor:") as? ThemeColorPicker }
//    set { setThemePicker(self, "setHighlightedTextColor:", newValue) }
//  }
//  var abc_shadowColor: ThemeColorPicker? {
//    get { return getThemePicker(self, "setShadowColor:") as? ThemeColorPicker }
//    set { setThemePicker(self, "setShadowColor:", newValue) }
//  }
//  var abc_textAttributes: ThemeStringAttributesPicker? {
//    get { return getThemePicker(self, "updateTextAttributes:") as? ThemeStringAttributesPicker }
//    set { setThemePicker(self, "updateTextAttributes:", newValue) }
//  }
//}
//@objc public extension UINavigationBar
//{
//  #if os(iOS)
//  var abc_barStyle: ThemeBarStylePicker? {
//    get { return getThemePicker(self, "setBarStyle:") as? ThemeBarStylePicker }
//    set { setThemePicker(self, "setBarStyle:", newValue) }
//  }
//  #endif
//  var abc_barTintColor: ThemeColorPicker? {
//    get { return getThemePicker(self, "setBarTintColor:") as? ThemeColorPicker }
//    set { setThemePicker(self, "setBarTintColor:", newValue) }
//  }
//  var abc_titleTextAttributes: ThemeStringAttributesPicker? {
//    get { return getThemePicker(self, "setTitleTextAttributes:") as? ThemeStringAttributesPicker }
//    set { setThemePicker(self, "setTitleTextAttributes:", newValue) }
//  }
//  var abc_largeTitleTextAttributes: ThemeStringAttributesPicker? {
//    get { return getThemePicker(self, "setLargeTitleTextAttributes:") as? ThemeStringAttributesPicker }
//    set { setThemePicker(self, "setLargeTitleTextAttributes:", newValue) }
//  }
//}
//@objc public extension UITabBar
//{
//  #if os(iOS)
//  var abc_barStyle: ThemeBarStylePicker? {
//    get { return getThemePicker(self, "setBarStyle:") as? ThemeBarStylePicker }
//    set { setThemePicker(self, "setBarStyle:", newValue) }
//  }
//  var abc_unselectedItemTintColor: ThemeColorPicker? {
//    get { return getThemePicker(self, "setUnselectedItemTintColor:") as? ThemeColorPicker }
//    set { setThemePicker(self, "setUnselectedItemTintColor:", newValue) }
//  }
//  #endif
//  var abc_barTintColor: ThemeColorPicker? {
//    get { return getThemePicker(self, "setBarTintColor:") as? ThemeColorPicker }
//    set { setThemePicker(self, "setBarTintColor:", newValue) }
//  }
//}
//@objc public extension UITableView
//{
//  var abc_separatorColor: ThemeColorPicker? {
//    get { return getThemePicker(self, "setSeparatorColor:") as? ThemeColorPicker }
//    set { setThemePicker(self, "setSeparatorColor:", newValue) }
//  }
//  var abc_sectionIndexColor: ThemeColorPicker? {
//    get { return getThemePicker(self, "setSectionIndexColor:") as? ThemeColorPicker }
//    set { setThemePicker(self, "setSectionIndexColor:", newValue) }
//  }
//  var abc_sectionIndexBackgroundColor: ThemeColorPicker? {
//    get { return getThemePicker(self, "setSectionIndexBackgroundColor:") as? ThemeColorPicker }
//    set { setThemePicker(self, "setSectionIndexBackgroundColor:", newValue) }
//  }
//}
//@objc public extension UITextField
//{
//  var abc_font: ThemeFontPicker? {
//    get { return getThemePicker(self, "setFont:") as? ThemeFontPicker }
//    set { setThemePicker(self, "setFont:", newValue) }
//  }
//  var abc_keyboardAppearance: ThemeKeyboardAppearancePicker? {
//    get { return getThemePicker(self, "setKeyboardAppearance:") as? ThemeKeyboardAppearancePicker }
//    set { setThemePicker(self, "setKeyboardAppearance:", newValue) }
//  }
//  var abc_textColor: ThemeColorPicker? {
//    get { return getThemePicker(self, "setTextColor:") as? ThemeColorPicker }
//    set { setThemePicker(self, "setTextColor:", newValue) }
//  }
//  var abc_placeholderAttributes: ThemeStringAttributesPicker? {
//    get { return getThemePicker(self, "updatePlaceholderAttributes:") as? ThemeStringAttributesPicker }
//    set { setThemePicker(self, "updatePlaceholderAttributes:", newValue) }
//  }
//}
//@objc public extension UITextView
//{
//  var abc_font: ThemeFontPicker? {
//    get { return getThemePicker(self, "setFont:") as? ThemeFontPicker }
//    set { setThemePicker(self, "setFont:", newValue) }
//  }
//  var abc_keyboardAppearance: ThemeKeyboardAppearancePicker? {
//    get { return getThemePicker(self, "setKeyboardAppearance:") as? ThemeKeyboardAppearancePicker }
//    set { setThemePicker(self, "setKeyboardAppearance:", newValue) }
//  }
//  var abc_textColor: ThemeColorPicker? {
//    get { return getThemePicker(self, "setTextColor:") as? ThemeColorPicker }
//    set { setThemePicker(self, "setTextColor:", newValue) }
//  }
//}
//@objc public extension UISearchBar
//{
//  #if os(iOS)
//  var abc_barStyle: ThemeBarStylePicker? {
//    get { return getThemePicker(self, "setBarStyle:") as? ThemeBarStylePicker }
//    set { setThemePicker(self, "setBarStyle:", newValue) }
//  }
//  #endif
//  var abc_keyboardAppearance: ThemeKeyboardAppearancePicker? {
//    get { return getThemePicker(self, "setKeyboardAppearance:") as? ThemeKeyboardAppearancePicker }
//    set { setThemePicker(self, "setKeyboardAppearance:", newValue) }
//  }
//  var abc_barTintColor: ThemeColorPicker? {
//    get { return getThemePicker(self, "setBarTintColor:") as? ThemeColorPicker }
//    set { setThemePicker(self, "setBarTintColor:", newValue) }
//  }
//}
//@objc public extension UIProgressView
//{
//  var abc_progressTintColor: ThemeColorPicker? {
//    get { return getThemePicker(self, "setProgressTintColor:") as? ThemeColorPicker }
//    set { setThemePicker(self, "setProgressTintColor:", newValue) }
//  }
//  var abc_trackTintColor: ThemeColorPicker? {
//    get { return getThemePicker(self, "setTrackTintColor:") as? ThemeColorPicker }
//    set { setThemePicker(self, "setTrackTintColor:", newValue) }
//  }
//}
//@objc public extension UIPageControl
//{
//  var abc_pageIndicatorTintColor: ThemeColorPicker? {
//    get { return getThemePicker(self, "setPageIndicatorTintColor:") as? ThemeColorPicker }
//    set { setThemePicker(self, "setPageIndicatorTintColor:", newValue) }
//  }
//  var abc_currentPageIndicatorTintColor: ThemeColorPicker? {
//    get { return getThemePicker(self, "setCurrentPageIndicatorTintColor:") as? ThemeColorPicker }
//    set { setThemePicker(self, "setCurrentPageIndicatorTintColor:", newValue) }
//  }
//}
//@objc public extension UIImageView
//{
//  var abc_image: ThemeImagePicker? {
//    get { return getThemePicker(self, "setImage:") as? ThemeImagePicker }
//    set { setThemePicker(self, "setImage:", newValue) }
//  }
//}
//@objc public extension UIActivityIndicatorView
//{
//  var abc_activityIndicatorViewStyle: ThemeActivityIndicatorViewStylePicker? {
//    get { return getThemePicker(self, "setActivityIndicatorViewStyle:") as? ThemeActivityIndicatorViewStylePicker }
//    set { setThemePicker(self, "setActivityIndicatorViewStyle:", newValue) }
//  }
//}
//@objc public extension UIScrollView
//{
//  var abc_indicatorStyle: ThemeScrollViewIndicatorStylePicker? {
//    get { return getThemePicker(self, "setIndicatorStyle:") as? ThemeScrollViewIndicatorStylePicker }
//    set { setThemePicker(self, "setIndicatorStyle:", newValue) }
//  }
//}
//@objc public extension UIButton
//{
//  func abc_setImage(_ picker: ThemeImagePicker?, forState state: UIControl.State) {
//    let statePicker = makeStatePicker(self, "setImage:forState:", picker, state)
//    setThemePicker(self, "setImage:forState:", statePicker)
//  }
//  func abc_setBackgroundImage(_ picker: ThemeImagePicker?, forState state: UIControl.State) {
//    let statePicker = makeStatePicker(self, "setBackgroundImage:forState:", picker, state)
//    setThemePicker(self, "setBackgroundImage:forState:", statePicker)
//  }
//  func abc_setTitleColor(_ picker: ThemeColorPicker?, forState state: UIControl.State) {
//    let statePicker = makeStatePicker(self, "setTitleColor:forState:", picker, state)
//    setThemePicker(self, "setTitleColor:forState:", statePicker)
//  }
//}
//@objc public extension CALayer
//{
//  var abc_backgroundColor: ThemeCGColorPicker? {
//    get { return getThemePicker(self, "setBackgroundColor:") as? ThemeCGColorPicker}
//    set { setThemePicker(self, "setBackgroundColor:", newValue) }
//  }
//  var abc_borderWidth: ThemeCGFloatPicker? {
//    get { return getThemePicker(self, "setBorderWidth:") as? ThemeCGFloatPicker }
//    set { setThemePicker(self, "setBorderWidth:", newValue) }
//  }
//  var abc_borderColor: ThemeCGColorPicker? {
//    get { return getThemePicker(self, "setBorderColor:") as? ThemeCGColorPicker }
//    set { setThemePicker(self, "setBorderColor:", newValue) }
//  }
//  var abc_shadowColor: ThemeCGColorPicker? {
//    get { return getThemePicker(self, "setShadowColor:") as? ThemeCGColorPicker }
//    set { setThemePicker(self, "setShadowColor:", newValue) }
//  }
//  var abc_strokeColor: ThemeCGColorPicker? {
//    get { return getThemePicker(self, "setStrokeColor:") as? ThemeCGColorPicker }
//    set { setThemePicker(self, "setStrokeColor:", newValue) }
//  }
//  var abc_fillColor: ThemeCGColorPicker?{
//    get { return getThemePicker(self, "setFillColor:") as? ThemeCGColorPicker }
//    set { setThemePicker(self, "setFillColor:", newValue) }
//  }
//}
//
//#if os(iOS)
//@objc public extension UIToolbar
//{
//  var abc_barStyle: ThemeBarStylePicker? {
//    get { return getThemePicker(self, "setBarStyle:") as? ThemeBarStylePicker }
//    set { setThemePicker(self, "setBarStyle:", newValue) }
//  }
//  var abc_barTintColor: ThemeColorPicker? {
//    get { return getThemePicker(self, "setBarTintColor:") as? ThemeColorPicker }
//    set { setThemePicker(self, "setBarTintColor:", newValue) }
//  }
//}
//@objc public extension UISegmentedControl
//{
//  var abc_selectedSegmentTintColor: ThemeColorPicker? {
//    get { return getThemePicker(self, "setSelectedSegmentTintColor:") as? ThemeColorPicker }
//    set { setThemePicker(self, "setSelectedSegmentTintColor:", newValue) }
//  }
//  func abc_setTitleTextAttributes(_ picker: ThemeStringAttributesPicker?, forState state: UIControl.State) {
//    let statePicker = makeStatePicker(self, "setTitleTextAttributes:forState:", picker, state)
//    setThemePicker(self, "setTitleTextAttributes:forState:", statePicker)
//  }
//}
//@objc public extension UISwitch
//{
//  var abc_onTintColor: ThemeColorPicker? {
//    get { return getThemePicker(self, "setOnTintColor:") as? ThemeColorPicker }
//    set { setThemePicker(self, "setOnTintColor:", newValue) }
//  }
//  var abc_thumbTintColor: ThemeColorPicker? {
//    get { return getThemePicker(self, "setThumbTintColor:") as? ThemeColorPicker }
//    set { setThemePicker(self, "setThumbTintColor:", newValue) }
//  }
//}
//@objc public extension UISlider
//{
//  var abc_thumbTintColor: ThemeColorPicker? {
//    get { return getThemePicker(self, "setThumbTintColor:") as? ThemeColorPicker }
//    set { setThemePicker(self, "setThumbTintColor:", newValue) }
//  }
//  var abc_minimumTrackTintColor: ThemeColorPicker? {
//    get { return getThemePicker(self, "setMinimumTrackTintColor:") as? ThemeColorPicker }
//    set { setThemePicker(self, "setMinimumTrackTintColor:", newValue) }
//  }
//  var abc_maximumTrackTintColor: ThemeColorPicker? {
//    get { return getThemePicker(self, "setMaximumTrackTintColor:") as? ThemeColorPicker }
//    set { setThemePicker(self, "setMaximumTrackTintColor:", newValue) }
//  }
//}
//@objc public extension UIPopoverPresentationController
//{
//  var abc_backgroundColor: ThemeColorPicker? {
//    get { return getThemePicker(self, "setBackgroundColor:") as? ThemeColorPicker }
//    set { setThemePicker(self, "setBackgroundColor:", newValue) }
//  }
//}
//@objc public extension UIRefreshControl
//{
//  var abc_titleAttributes: ThemeStringAttributesPicker? {
//    get { return getThemePicker(self, "updateTitleAttributes:") as? ThemeStringAttributesPicker }
//    set { setThemePicker(self, "updateTitleAttributes:", newValue) }
//  }
//}
//@objc public extension UIVisualEffectView
//{
//  var abc_effect: ThemeVisualEffectPicker? {
//    get { return getThemePicker(self, "setEffect:") as? ThemeVisualEffectPicker }
//    set { setThemePicker(self, "setEffect:", newValue) }
//  }
//}
//#endif
