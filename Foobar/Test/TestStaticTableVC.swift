//
//  TestStaticTableVC.swift
//  Foobar
//
//  Created by Kevin Wu on 12/11/19.
//  Copyright (c) firefly.com. All rights reserved.
//

import UIKit
import Static

class TestStaticTableVC: TableViewController {

  let customAccessory: UIView = {
    let view = UIView(frame: CGRect(x: 0, y: 0, width: 32, height: 32))
    view.backgroundColor = .red
    return view
  }()

  let customFooter: UIView = {
    let view = UIView(frame: CGRect(x: 0, y: 0, width: 32, height: 32))
    view.backgroundColor = .green
    return view
  }()

  convenience init() {
    self.init(style: .grouped)
  }

  override func viewDidLoad() {
    super.viewDidLoad()

    tableView.rowHeight = 50

    // Note: Required to be set pre iOS11, to support autosizing
    tableView.estimatedSectionHeaderHeight = 13.5
    tableView.estimatedSectionFooterHeight = 13.5


    dataSource = DataSource()
    dataSource.sections = [

      Section(header: "asdf", rows: [
        Row(text: "Hello"),
        Row(text: "aa", detailText: "detail", selection: {
          print("selected")
        }, image: nil, accessory: .disclosureIndicator, cellClass: TestStaticCell.self, context: ["name":"kevin"], editActions: [
          Row.EditAction(title: "Warn", backgroundColor: .orange, selection: { [unowned self] (indexPath) in
            self.showAlert(title: "Warned at indexPath: \(indexPath).")
          }),
          Row.EditAction(title: "xxx", style: .destructive, backgroundColor: .green, backgroundEffect: nil, selection: { (ip) in
            print("edit \(ip)")
          })
        ], uuid: "uuid", accessibilityIdentifier: nil)
      ], footer: .view(customFooter)),

      Section(header: "Styles", rows: [
        Row(text: "Value 1", detailText: "Detail", cellClass: Value1Cell.self, accessibilityIdentifier: "Value1Row"),
        Row(text: "Value 1", detailText: "with an image", image: UIImage(named: "start"), cellClass: Value1Cell.self),
        Row(text: "Value 2", detailText: "Detail", cellClass: Value2Cell.self),
        Row(text: "Subtitle", detailText: "Detail", cellClass: SubtitleCell.self),
        Row(text: "xx", detailText: "Detail", selection: { [unowned self] in
          self.showAlert(title: "Row Selection")
          }, cellClass: ButtonCell.self),
        Row(text: "Custom from nib", cellClass: TestStaticCell.self, accessibilityIdentifier: "TestStaticCell")
      ], footer: "This is a section footer."),

      Section(header: "Accessories", rows: [
        Row(text: "None"),
        Row(text: "Disclosure Indicator", accessory: .disclosureIndicator),
        Row(text: "Detail Disclosure Button", accessory: .detailDisclosureButton({ [unowned self] in
          self.showAlert(title: "Detail Disclosure Button")
        })),
        Row(text: "Checkmark", accessory: .checkmark),
        Row(text: "Detail Button", accessory: .detailButton({ [unowned self] in
          self.showAlert(title: "Detail Button")
        })),
        Row(text: "UISwitch", accessory: .switchToggle(value: false) { [unowned self] newValue in
          self.showAlert(title: "Switch Toggled: \(newValue ? "On" : "Off")")
          }),
        Row(text: "Segmented control", accessory: .segmentedControl(items: ["Left", "Middle", "Right"], selectedIndex: 1) { [unowned self] (i, str) in
          self.showAlert(title: "Segment \"\(str!)\" at index \(i) selected")
          }),
        Row(text: "Custom View", accessory: .view(customAccessory), accessibilityIdentifier: "CustomView")
      ], footer: "Try tapping the ⓘ buttons."),

      Section(header: "Selection", rows: [
        Row(text: "Tap this row", selection: { [unowned self] in
          self.showAlert(title: "Row Selection")
        }),
        Row(text: "Tap this row", selection: { [unowned self] in
          let viewController = ViewController()
          self.navigationController?.pushViewController(viewController, animated: true)
        })
      ]),

      Section(header: "Editing", rows: [
        Row(text: "Swipe this row", editActions: [
          Row.EditAction(title: "Warn", backgroundColor: .orange, selection: { [unowned self] (indexPath) in
            self.showAlert(title: "Warned at indexPath: \(indexPath).")
          }),
          Row.EditAction(title: "Delete", style: .destructive, selection: { [unowned self] (indexPath) in
            self.showAlert(title: "Deleted at indexPath: \(indexPath).")
          })
        ])
      ]),

      Section(header: "AutoSized SectionFooterView", rows: [], footer: Section.Extremity.autoLayoutView(LargeAutoSizedExtremityView()))
    ]
  }

  func showAlert(title: String? = nil, message: String? = "You tapped it. Good work.", button: String = "Thanks") {
    let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
    alert.addAction(UIAlertAction(title: button, style: .cancel, handler: nil))
    present(alert, animated: true, completion: nil)
  }
}

extension TableViewController: UITableViewDelegate {
  // MARK: - UIScrollViewDelegate example functions
  public func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
    // You can get UIScrollViewDelegate functions forwarded, even though the `DataSource` instance is the true delegate
    // ...
  }

  // MARK: - UITableViewDelegate example functions
  public func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
    // You can get UITableViewDelegate functions forwarded, even though the `DataSource` instance is the true delegate
    // ...
  }

  public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    // The Row object's `selection` property will handle most of your use cases, but
    // if you need to do something additional you can still implement this function.
  }
}

class LargeAutoSizedExtremityView: UIView {
  lazy var label: UILabel = {
    let label = UILabel()
    label.numberOfLines = 0
    label.translatesAutoresizingMaskIntoConstraints = false
    label.text = "Is this the real life?\nIs this just fantasy?\nCaught in a landslide,\nNo escape from reality."
    return label
  }()

  init() {
    super.init(frame: .zero)

    layoutMargins = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
    addSubview(label)
    label.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor).isActive = true
    label.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor).isActive = true
    label.topAnchor.constraint(equalTo: layoutMarginsGuide.topAnchor).isActive = true
    label.bottomAnchor.constraint(equalTo: layoutMarginsGuide.bottomAnchor).isActive = true
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

