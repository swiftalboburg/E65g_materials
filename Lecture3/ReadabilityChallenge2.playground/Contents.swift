//: Playground - noun: a place where people can play

typealias Position = (row: Int, col: Int)

func positions(rows: Int, cols: Int) -> [Position] {
    return (0 ..< rows)
        .map { row in zip( [Int](repeating: row, count: cols), 0 ..< cols ) }
        .flatMap { $0 }
}

var gridPositions = positions(rows: 10, cols: 10)

print("\(gridPositions)")