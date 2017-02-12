



// Lazy challenge 2
let positionsClosure = { (rows: Int, cols: Int) in
    return (0 ..< rows)
        .map { row in zip( [Int](repeating: row, count: cols), 0 ..< cols ) }
        .flatMap { $0 }
}
print("\(type(of:positionsClosure))")

// It is also possible not to create arrays at individual steps
// this example adds one word (lazy) to the example below
// And ends of using the type system to deal with 
// the time/space trade off
let lazyPositionsClosure = { (rows: Int, cols: Int) in
    return (0 ..< rows)
        .lazy
        .map { row in zip( [Int](repeating: row, count: cols), 0 ..< cols ) }
        .flatMap { $0 }
}
print("\(type(of:lazyPositionsClosure))")

// Note that I can create HUUUUGE grids and only use the contents on demand.
let lazyGridPositions = lazyPositionsClosure(10000,10000)
print (lazyGridPositions)

let iter = lazyGridPositions.makeIterator()
print("\(type(of:iter))")

for pos in lazyGridPositions {
    break
}
//let all = Array(lazyGridPositions)
//print ("\(all.count)")




