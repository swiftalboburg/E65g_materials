import Foundation
/*: 
 The purpose of this playground is to illustrate the use of second order
 functions on Collections.  Examples include: map, flatMap, reduce,
 sort and filter.
 
 The key point to take away is that these functions do type transformations
 and make heavy use of of type inference.  At each step in the playground
 you should be able to explain what types are being passed in and what types
 are being returned.
 
 Several protocols are defined ahead of time to allow several different types
 to be handled simultaneously.
 
 Here is a simplified version of how Swift implements map. You can write your own:
```
 func map<T>(_ transform: (Element) -> T) -> [T] {
    let count = self.count
    if count == 0 {
        return []
    }
    var result = Array<T>()

    for i in 0 ..< count {
        result.append(transform(self[i]))
    }
    return result
 }
 ```

 Here is a simplified version of how Swift implements reduce on an Array.
 Element is the type of object held in the Array,      Result is the type you specify.
 
 ```
func reduce<Result, Element>(
	initialResult: Result,
    nextPartialResult: (_ partialResult: Result, Element) -> Result
) -> Result {
    var accumulator = initialResult
    for element in self {
        accumulator = nextPartialResult(accumulator, element)
    }
    return accumulator
 }
```

 As you can tell from the code examples above, map and reduce specify generic kinds of for loop.
 map takes a sequence of some type operates on each element to return a specified type (perhaps the same,
 perhaps different) and constructs a sequence from the return values.  An example would be to take a sequence
 of Ints and return a Sequence of String representing each element in the original Sequence.
 
 reduce operates on a sequence to produce a single final return value.  An example would be to take a
 Sequence of Int and return the sum of the sequence.
 
 filter and sort operate as you would expect in a similar manner.  forEach performs some operation with NO 
 return value on the each element of the Sequence.
 
 One important way to think about these functions is that they standardize and remove the boilerplate 
 code that you include in every map-like or reduce-like or filter-like for loop, thereby encouraging 
 concision and readability in your own code.
 */

/*:
 Describable is a protocol that simply says the accompanying type can produce
 a description of itself as a String
 */
protocol Describable {
    var description: String { get }
}

/*:
 the following classes already have a var called description, so we can simply
 tell Swift that they meet the protocol.
 */
extension String: Describable { }
extension Int: Describable { }
extension Dictionary: Describable { }
extension Array: Describable { }

/*:
 We do the following to make conversion between String and Integer possible.
 */
protocol IntegerValuable {
    var integerValue: Int { get }
}

extension String: IntegerValuable {
    var integerValue: Int { return (self as NSString).integerValue  }
}

extension NSString: IntegerValuable { }

extension Int: IntegerValuable {
    var integerValue: Int { return self }
}
protocol IntDescribable: Describable, IntegerValuable { }
extension String: IntDescribable {}
extension Int: IntDescribable {}

class IntegerClass: Hashable, IntDescribable {
    static func ==(_ lhs: IntegerClass, _ rhs: IntegerClass) -> Bool {
        return lhs.integerValue == rhs.integerValue
    }
    var integerValue = 0
    var hashValue: Int { return integerValue }
    var description: String {
        return "Instance of \(type(of: self))"
    }
    required init(_ withValue: Int) { integerValue = withValue }
}

/*:
 Provide a base structure which we can now manipulate via second order functions.
 */
var d: [String: Describable] = [
    "1" : "1",
    "2" : 2,
    "3" : [ 1, 2, 3],
    "4" : [ "1": 1, "2": 2, "3": 3, "4": 4].map { (k,v) in return k },
    "5" : [IntegerClass(5)],
    "6" : ["6"]
]
type(of: d)

var m1 = d
type(of: m1)
m1

/*:
 Filter out all key/value pairs where the value is an array
 of IntDescribable type.  Note the return type is [(String,Describable)]
 */
var m2 = d
    .filter { (k,v) in return v is [IntDescribable] }
type(of: m2)
m2

/*:
 Now change take the filtered entries and return only the value part of the pair
 as an [IntDescribable].  Note the type transformation
 */
var m3 = d
    .filter { (k,v) in return v is [IntDescribable] }
    .map { (k,v) in return v as! [IntDescribable] }
type(of: m3)
m3

/*:
 Now apply flatMap to the array of arrays, producing 
 an [IntDescribable]
 */
var m4 = d
    .filter { (k,v) in return v is [IntDescribable] }
    .map { (k,v) in return v as! [IntDescribable] }
    .flatMap { $0 }
type(of: m4)
m4

/*:
 Sort the resulting array in descending order
 */
var m5 = d
    .filter { (k,v) in return v is [IntDescribable] }
    .map { (k,v) in return v as! [IntDescribable] }
    .flatMap { $0 }
    .sorted { $0.integerValue > $1.integerValue }
type(of: m5)
m5

/*:
 Change the type of the values in the resulting sorted array
 */
var m6 = d
    .filter { (k,v) in return v is [IntDescribable] }
    .map { (k,v) in return v as! [IntDescribable] }
    .flatMap { $0 }
    .sorted { $0.integerValue > $1.integerValue }
    .map { IntegerClass($0.integerValue) }
type(of: m6)
m6

/*: 
 Sum the integer values.
 */
var m7 = d
    .lazy
    .filter { (k,v) in return v is [IntDescribable] }
    .map { (k,v) in return v as! [IntDescribable] }
    .flatMap { $0 }
    .sorted { $0.integerValue > $1.integerValue }
    .map { IntegerClass($0.integerValue) }
    .reduce(0) { return $0 + $1.integerValue }
type(of: m7)
m7

/*:
 Initialize a set from a Sequence of IntegerClass
 */
var m8 = Set<IntegerClass>(
    d.filter { (k,v) in return v is [IntDescribable] }
        .map { (k,v) in return v as! [IntDescribable] }
        .flatMap { $0 }
        .sorted { $0.integerValue > $1.integerValue }
        .map { IntegerClass($0.integerValue) }
)
type(of: m8)
m8

/*:
 Initialize a set from a Sequence of IntegerClass and
 then extract the results
*/
var m9 = Set<IntegerClass>(
    d.filter { (k,v) in return v is [IntDescribable] }
        .map { (k,v) in return v as! [IntDescribable] }
        .flatMap { $0 }
        .sorted { $0.integerValue > $1.integerValue }
        .map { IntegerClass($0.integerValue) }
    )
    .map { return $0.integerValue }
type(of: m9)
m9

/*:
 Initialize a set from a Sequence of IntegerClass and
 then extract the results and sort them.
 */
var m10 = Set<IntegerClass>(m6)
    .map { return $0.integerValue }
    .sorted { $0 < $1 }
type(of: m10)
m10

var m11 = Set<IntegerClass>(
    d.filter { (k,v) in return v is [IntDescribable] }
        .map { (k,v) in return v as! [IntDescribable] }
        .flatMap { $0 }
        .sorted { $0.integerValue > $1.integerValue }
        .map { IntegerClass($0.integerValue) }
    )
    .map { return $0.integerValue }
    .sorted { $0 < $1 }
    .reduce(1) { return $0 * $1 }
type(of: m11)
m11
