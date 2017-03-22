//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

var myArray = [
    1,
    3,
    4.7,
    "someString"
] as [Any]

type(of: myArray[1])

myArray[2]
let something = myArray[1] as? Double
type(of: something)

if let myDouble = myArray[2] as? Double {
    "got in here"
}
else {
    "did not get a double, got a \(type(of: myArray[1]))"
}

//public enum Optional<Wrapped> {
//    case none
//    case some(Wrapped)
//    
//    public init(_ some: Wrapped) { self = .some(some) }
//    public init(nilLiteral: ()) { self = .none }
//    
//    public var unwrapped: Wrapped {
//        get {
//            switch self {
//            case .some(let wrapped): return wrapped
//            case .none: preconditionFailure("unsafelyUnwrapped of nil optional")
//            }
//        }
//    }
//}

struct OurStringStruct {
    var theString: String?

    func description() -> String {
//        guard let retString = theString else { return "" }
//        guard retString != "van" else { return "not van" }
        if let retString = theString {
            if retString != "van" {
                return retString
            }
            else {
                return "not van"
            }
        }
        else {
            return ""
        }
        
        return theString!
    }
}

var stringStruct: OurStringStruct? = OurStringStruct(theString: "van")

stringStruct?.theString?.description

let implicitString: String! = "aString"
type(of: implicitString)
implicitString.capitalized



if let stringStruct = stringStruct {
    type(of: stringStruct)
    if let aString = stringStruct.theString {
        aString.description
    }
    stringStruct.description()
}


var optionalDouble = Optional<Double>(1.0)
optionalDouble = .none

var optionalString: String? = "anotherString"
var optString: Optional<String>

optString?.description


