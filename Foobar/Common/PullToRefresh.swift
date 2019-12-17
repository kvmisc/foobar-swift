//
//  PullToRefresh.swift
//  Foobar
//
//  Created by Kevin Wu on 12/17/19.
//  Copyright (c) firefly.com. All rights reserved.
//

import UIKit
import ESPullToRefresh

// if index == 1 {
//   tableView.extStopRefreshHeader()
//   tableView.extAddRefreshFooter(hasMore) { [unowned self] in self.loadNext() }
// } else {
//   tableView.extStopRefreshFooter(hasMore)
// }

extension UIScrollView {
  func extAddRefreshHeader(_ handler: @escaping ()->Void) {
    es.addPullToRefresh(handler: handler)
  }
  func extRemoveRefreshHeader() {
    es.removeRefreshHeader()
  }
  func extStopRefreshHeader() {
    es.stopPullToRefresh(ignoreDate: true, ignoreFooter: false)
  }

  func extAddRefreshFooter(_ hasMore: Bool, _ alwaysShow: Bool = false, _ handler: @escaping ()->Void) {
    if hasMore {
      // 有更多数据
      if footer == nil {
        // 无 Footer, 添加
        es.addInfiniteScrolling(handler: handler)
      } else {
        // 有 Footer, 重置
        es.resetNoMoreData()
      }
    } else {
      // 无更多数据
      if footer == nil {
        if alwaysShow {
          // 无 Footer, 总是显示 Footer, 添加 Footer 并显示无更多数据
          es.addInfiniteScrolling(handler: handler)
          es.noticeNoMoreData()
        }
      } else {
        if alwaysShow {
          // 总是显示 Footer, 显示无更多数据
          es.noticeNoMoreData()
        } else {
          // 不要求总是显示 Footer, 移除 Footer
          es.removeRefreshFooter()
        }
      }
    }
  }
  func extRemoveRefreshFooter() {
    footer?.isHidden = true
    es.removeRefreshFooter()
  }
  func extStopRefreshFooter(_ hasMore: Bool, _ alwaysShow: Bool = false) {
    if hasMore {
      es.stopLoadingMore()
    } else {
      if alwaysShow {
        es.noticeNoMoreData()
      } else {
        footer?.isHidden = true
        es.removeRefreshFooter()
      }
    }
  }
}
