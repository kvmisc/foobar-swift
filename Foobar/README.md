

## 其它

1. 为何 Alamofire 每次要导入而有些库不用？

2. 为何 cc 不用加 mutating？
struct Stt {
var aa = 0
var bb = 0
var cc: Int {
get { return aa }
set { aa = newValue }
}
mutating func dd(value: Int) {
aa = value
}
}





无默认值，每个参数必须传，可以省略标签
无默认值，每个参数必须传，如果有相同类型的重载，不能省略标签

有默认值，部分参数不想传，不能省略标签
有默认值，想依次传值，可以省略标签

Static 无行高
translatesAutoresizingMaskIntoConstraints 的作用？
sqlite vs realm ?
cache ?
App Routing

ObjectMapper
SwiftTheme
SKPhotoBrowser
SGPagingView


#Animation
#App Routing
#JSON
#Dependency Injection
#Events
#Images
# Alert: 各种弹窗
# Button: 各种按钮
# Form: 复杂表单
# Label: 各种文字控件
# Menu: 各种菜单、抽屉等
# Pagination: 分页控件和分页控制器
# Permissions: 管理设备权限
# Tab: 标签和标签管理器
# Transition: 页面转换
# UICollectionView
# UITableView
# Walkthrough: 引导页
# Validation: 验证输入
