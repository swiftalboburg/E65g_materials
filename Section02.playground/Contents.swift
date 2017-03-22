
struct PointStruct {
    var x: Double = 0.0
    var y: Double = 0.0
    
    var description: String {
        return "(x: \(x), y: \(y))"
    }
    
    init?(_ x: Double, _ y: Double) {
        guard x >= 0 && y >= 0 else { return nil }
        self.x = x
        self.y = y
    }
}

struct SizeStruct {
    var height: Double = 0.0
    var width: Double = 0.0
}

struct RectangleStruct {
    var origin: PointStruct
    var size: SizeStruct
    
    init? (origin: PointStruct?, size: SizeStruct?) {
        type(of: origin)
        type(of: size)
        guard let unoptionalorigin = origin,
            let size = size,
            unoptionalorigin.x < 10.0 else {
                type(of: origin)
                return nil
        }
        type(of: unoptionalorigin)
        type(of: size)
        self.origin = unoptionalorigin
        self.size = size
    }
}

var point = PointStruct(1.0, 1.0)
point?.description
//point = PointStruct()

let rect = RectangleStruct(
    origin: PointStruct( 1.0, 1.0),
    size: SizeStruct(height: 1.0, width: 2.0)
)

class BaseClass {
    var someVar: Int
    
    init (_ something: Int) {
        self.someVar = something
    }
}

class Point: BaseClass {
    var x: Double
    var y: Double
    
    init (_ x: Double, _ y: Double) {
        self.x = x
        self.y = y
        super.init(0)
        // some other stuff here...
    }
    
    var description: String {
        return "\(someVar), (x: \(x), y: \(y))"
    }
}

let point2 = Point(0.0, 0.0)
point2.description

let point3 = point
point3?.description

point?.x = 4.0
point?.description

// Note that point 3 did not change when 
// I changed point
point3?.description

let point4 = point2
point4.description
point2.x = 6.0
point2.description

// Note that point4 DID change when I changed 
// point2
point4.description

let point5 = PointStruct(-1.0, 0)

let rows = 5
let cols = 5
let array = Array(repeating: [0], count: rows)
type(of: array)









