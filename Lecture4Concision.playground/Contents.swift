// For Homework

func shiftPosition(of array: [Int], by amount: Int, from position: Int) -> Int {
    guard abs(amount) < array.count else { return -1 }
    return (position + amount + array.count) % array.count
}

let array = [1, 2 , 3, 4, 5, 6, 7, 8, 9, 10]
shiftPosition(of: array, by: -1, from: 0)
shiftPosition(of: array, by: -1, from: array.count - 1)
shiftPosition(of: array, by:  1, from: 0)
shiftPosition(of: array, by:  1, from: array.count - 1 )


// Challenge 1

func isLeap(_ year:Int) -> Bool { return (year % 4 == 0 && year % 100 != 0) || year % 400 == 0 }

let nonLeapMonths = [0, 31, 59, 90, 120, 151, 181, 212, 243, 273, 304, 334, 365]
let leapMonths    = [0, 31, 60, 91, 121, 152, 182, 213, 244, 274, 305, 335, 366]

func julianDate(year: Int, month: Int, day: Int) -> Int {
    return ((1900 ..< year).reduce(0) {  return $0 + (isLeap($1) ? 366 : 365) })
        + (isLeap(year) ? leapMonths[month - 1] : nonLeapMonths[month - 1])
        + day
}

julianDate(year: 1960, month:  9, day: 28)
julianDate(year: 1900, month:  1, day:  1)
julianDate(year: 1900, month: 12, day: 31)
julianDate(year: 1901, month:  1, day:  1)
julianDate(year: 1901, month:  1, day:  1) - julianDate(year: 1900, month: 1, day: 1)
julianDate(year: 2001, month:  1, day:  1) - julianDate(year: 2000, month: 1, day: 1)

isLeap(1960)
isLeap(1900)
isLeap(2000)

//Challenge 2

typealias Position = (row: Int, col: Int)

func positions(rows: Int, cols: Int) -> [Position] {
    return (0 ..< rows)
        .map { row in zip( [Int](repeating: row, count: cols), 0 ..< cols ) }
        .flatMap { $0 }
}

var gridPositions = positions(rows: 5, cols: 5)
print ("\(gridPositions)")



// Lazy challenge 2

let closurePositions = { (rows: Int, cols: Int) in
    return (0 ..< rows)
        .map { row in zip( [Int](repeating: row, count: cols), 0 ..< cols ) }
        .flatMap { $0 }
}
print("\(type(of:closurePositions))")

let lazyPositions = { (rows: Int, cols: Int) in
    return (0 ..< rows)
        .lazy
        .map { row in zip( [Int](repeating: row, count: cols), 0 ..< cols ) }
        .flatMap { $0 }
}

let lazyGridPositions = lazyPositions(1000,1000)
print("\(type(of:lazyGridPositions))")

let iter = lazyGridPositions.makeIterator()
print("\(type(of:iter))")

for pos in lazyGridPositions {
    print("\(pos)")
    break
}
let all = Array(lazyGridPositions)




