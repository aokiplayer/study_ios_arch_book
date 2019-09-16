import Foundation

let x = [10, 20, 30, 40, 50]

//func hoge(xs: [Int]) {
//    print(xs)
//}
func hoge<C: Collection>(xs: C) where C.Element == Int {
    print(xs)
}

hoge(xs: x.dropFirst())
