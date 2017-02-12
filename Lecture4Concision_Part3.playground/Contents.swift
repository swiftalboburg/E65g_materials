





//Challenge 2

typealias Position = (row: Int, col: Int)

// Example of using the zip function on one row
let zipped = zip( [Int](repeating: 0, count: 5), 0 ..< 5 )
for z in zipped {
    print("\(z)")
}

let toFlatten = [
    [1, 2, 3, 4],
    [5],
    [6, 7, 8, 9]
]

let flattened = toFlatten.flatMap { return $0 }
flattened

let unflattenedPositions = (0 ..< 5)
    .map { row in zip( [Int](repeating: row, count: 5), 0 ..< 5 ) }
print (unflattenedPositions)

// Now use the zip and flat map functions on ALL the rows in a grid
func positions(rows: Int, cols: Int) -> [Position] {
    return (0 ..< rows)
        .map { row in zip( [Int](repeating: row, count: cols), 0 ..< cols ) }
        .flatMap { $0 }
}
var gridPositions = positions(rows: 5, cols: 5)










































// Lazy challenge 2
let positionsClosure = { (rows: Int, cols: Int) in
    return (0 ..< rows)
        .map { row in zip( [Int](repeating: row, count: cols), 0 ..< cols ) }
        .flatMap { $0 }
}
print("\(type(of:positionsClosure))")

let lazyPositionsClosure = { (rows: Int, cols: Int) in
    return (0 ..< rows)
        .lazy
        .map { row in zip( [Int](repeating: row, count: cols), 0 ..< cols ) }
        .flatMap { $0 }
}
print("\(type(of:lazyPositionsClosure))")

let lazyGridPositions = lazyPositionsClosure(10,10)
print (lazyGridPositions)

let iter = lazyGridPositions.makeIterator()
print("\(type(of:iter))")

for pos in lazyGridPositions {
    break
}
//let all = Array(lazyGridPositions)
//print ("\(all.count)")




