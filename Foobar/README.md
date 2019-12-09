
## Then

then 有返回值，可用于创建 `类的属性`，可用于创建 `常量` 和 `变量`
with 有返回值，用 `inout` 方式传入参数，可用于创建类的 `值类型常量属性` 和 `值类型变量属性`，可用于创建 `值类型常量` 和 `值类型变量`
do 无返回值，可用于 `调用方法`、`修改属性`，主要为了节省输入，因其未用 `inout` 方式传入参数，在值类型上使用时，能调用方法，不能修改属性

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

