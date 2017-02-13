





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
    .map { Array($0) }
print(unflattenedPositions)

print(unflattenedPositions.flatMap { $0 })

// Now use the zip and flat map functions on ALL the rows in a grid
func positions(rows: Int, cols: Int) -> [Position] {
    return (0 ..< rows)
        .map { row in zip( [Int](repeating: row, count: cols), 0 ..< cols ) }
        .flatMap { $0 }
}
var gridPositions = positions(rows: 5, cols: 5)
print(gridPositions)


