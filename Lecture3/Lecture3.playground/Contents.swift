//: Playground - noun: a place where people can play

import UIKit

var x = 2 + 1
let y = 13

var str = "Hello, playground"
var str2 = "Hello, " + "playground"

var str3 = "\(y) + blah blah blah \(str2)"

print(str)

1 + 1


type(of: x)

x = 12

y/2
y % 10

let z = 3.141592653589323846
type(of: z)

z + Double(x)

var a: [Any] = ["a", "b", "c", "d"]
type(of: a)
let b: [Any] = [1, 2, 3, 4, 5]
type(of: b)
let c: [Any] = ["e", "f", "g"]

a.append(47)

var d = ["a": 1, "b": 2, "c": 3]
type(of: d)
d["d"] = 37

d
d.keys.sorted()
d.values.sorted()

for (k,v) in d {
    print ("\(k):\(v)")
}

let t = (1, 2)
let t2 = (row: 1, col: 2)

type(of: t)

let t3 = ("a", 1)
type(of: t3)

t3.1
t3.0

t2.0
t2.row

var t4 = ( 1, "a", [1,2,3,4], row: 13)

t4.0 = 2

t4
t4.2


0 ..< 10

"a" ... "f"

if ("a" ... "f").contains("g") {
    print("found it")
}

for i in 1 ..< 10 {
    print("\(i)")
}

func addTogether(_ val: Int, _ val2: Int) -> Int {
    return val + val2
}

addTogether(13, 15)

let s = [1, 2, 15, 3, 18, 4].sorted { $0 < $1 }
s
let s1 = [1, 2, 15, 3, 18, 4]
    .sorted { $0 > $1 }
    .map { $0 * 2 }

s1

let aa:[[Bool]] = [[true,false,true], [false,false,false], [true,false, true]]
type(of: aa)

func compose(_ a: Int, _ b:(Int) -> Int) -> Int {
    return b(a)
}

func doubler(_ num: Int) -> Int {
    return num * 2
}

compose(8, doubler)

func tripler(_ num: Int) -> Int {
    return num * 3
}

compose (8, tripler)

let val = compose(8) { $0 * $0 }
val






