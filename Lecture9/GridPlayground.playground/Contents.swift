//: Playground - noun: a place where people can play

//
//  GridProtocol.swift
//  Lecture7
//

public struct GridPosition: Equatable {
    var row: Int
    var col: Int
    
    public static func == (lhs: GridPosition, rhs: GridPosition) -> Bool {
        return (lhs.row == rhs.row && lhs.col == rhs.col)
    }
}

public struct GridSize {
    var rows: Int
    var cols: Int
}

fileprivate let positionsClosure = { (size: GridSize) in
    return (0 ..< size.rows)
        .map { zip( [Int](repeating: $0, count: size.cols) , 0 ..< size.cols ) }
        .flatMap { $0 }
        .map { GridPosition(row: $0.0,col: $0.1) }
}

fileprivate let lazyPositionsClosure = { (size: GridSize) in
    return (0 ..< size.rows)
        .lazy
        .map { zip( [Int](repeating: $0, count: size.cols) , 0 ..< size.cols ) }
        .flatMap { $0 }
        .map { GridPosition(row: $0.0,col: $0.1) }
}

let positions = positionsClosure(GridSize(rows: 2, cols: 2))
let lazyPositions = lazyPositionsClosure(GridSize(rows: 2,cols: 2))

print(type(of: positions))
positions.forEach { print($0) }
print(type(of: lazyPositions))
lazyPositions.forEach { print($0) }

