static func hudActivity(_ view: UIView? = nil) {
    PKHUD.sharedHUD.hide(false)
    PKHUD.sharedHUD.contentView = PKHUDSystemActivityIndicatorView()
    //PKHUD.sharedHUD.dimsBackground = false
    //PKHUD.sharedHUD.userInteractionOnUnderlyingViewsEnabled = false
    PKHUD.sharedHUD.show(onView: view ?? MainWindow())
  }
  static func hudMessage(_ view: UIView? = nil, info: String, completion: (()->Void)? = nil) {
    PKHUD.sharedHUD.hide(false)
    PKHUD.sharedHUD.contentView = PKHUDTextView(text: info)
    //PKHUD.sharedHUD.dimsBackground = false
    //PKHUD.sharedHUD.userInteractionOnUnderlyingViewsEnabled = false
    PKHUD.sharedHUD.show(onView: view ?? MainWindow())
    PKHUD.sharedHUD.hide(afterDelay: 3.0) { success in completion?() }
  }
  static func hudHide(_ animated: Bool = false) {
    PKHUD.sharedHUD.hide(animated)
  }