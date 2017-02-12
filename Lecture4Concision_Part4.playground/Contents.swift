





//Challenge 2

typealias Position = (row: Int, col: Int)

// Lets explore the use of the standard function zip
// Here's an example using the zip function 
// to produce the positions of one row of a grid
// Note that zipped is a Zip2Sequence
let zipped = zip( [Int](repeating: 0, count: 5), 0 ..< 5 )

// Create an array of tuples from the Zip2Sequence
print ("An array of tuples: \(Array(zipped) as [Position])")

// Now lets use the same technique looping over all the rows in a grid
// Notice how this produces an array of arrays of tuples
let unflattenedPositions = (0 ..< 5)
    .map { row in zip( [Int](repeating: row, count: 5), 0 ..< 5 ) }
    .map { Array($0) as [Position] }
print ("An array of arrays of tuples: \(unflattenedPositions)")

// Now lets do an example of flatMap
// Notice how we have turned an array of arrays of ints into an array of ints
let toFlatten = [
    [1, 2, 3, 4],
    [5],
    [6, 7, 8, 9]
]
let flattened = toFlatten.flatMap { $0 }
flattened

// Now lets try this on our positions
let flattenedPositions = unflattenedPositions.flatMap { $0 }
print ("A flattened array of tuples: \(flattenedPositions)")


// Now use the zip and flat map functions on ALL the rows in a grid
// and make one function for doing it using the .flatMap function
// on Zip2Sequence directly rather than producing an intermediate Array
func positions(rows: Int, cols: Int) -> [Position] {
    return (0 ..< rows)
        .map { row in zip( [Int](repeating: row, count: cols), 0 ..< cols ) }
        .flatMap { $0 }
}
var gridPositions = positions(rows: 5, cols: 5)
print ("A flattened grid of type \(type(of: gridPositions)): \(gridPositions)")

// Why would we do this? 
// So that we can write:

gridPositions.forEach { (_: (row: Int, col: Int)) in
    // do something on each cell of a grid
}

// or:
let someMappedValues = gridPositions.map { (position: (row: Int, col: Int)) in
    return "\(position.row):\(position.col)"
}
print("An array of strings: \(someMappedValues)")

// or:
let count = gridPositions.reduce(0) { sum, tuple in
    return sum + 1
}
print("How many were there: \(count)")











