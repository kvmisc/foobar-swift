

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


translatesAutoresizingMaskIntoConstraints 的作用？


无默认值，每个参数必须传，可以省略标签
无默认值，每个参数必须传，如果有相同类型的重载，不能省略标签

有默认值，部分参数不想传，不能省略标签
有默认值，想依次传值，可以省略标签

