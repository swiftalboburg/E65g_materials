// For wrap around rules in Homework Assignment 2
// Apply the modulus operator to any integer
// Lets pick 5 as our modulus
3 % 5
8 % 5
13 % 5

//Note how all of those expressions equal -2
// Now deal with negative numbers
-2 % 5
-7 % 5
-12 % 5

// Now note what happens if we add the modulus back
(-2 % 5) + 5
(-7 % 5) + 5
(-12 % 5) + 5

// Again note that all 3 are equal
// z = x % y maps any number x (positive or negative) into the range:
// -y + 1 < z < y - 1
// and further more (and most importantly for the homework)
// This mapping cycles over and over:

// cycles betwen 0 and 4
var tupleArray: [(Int, Int)] = []
for i in (0 ..< 25) {
    tupleArray.append((i, i % 5))
}
tupleArray

// cycles between -4 and 0
tupleArray = []
for i in (-24 ... 0) {
    tupleArray.append((i, i % 5))
}
tupleArray

// cyles between 0 and 4
tupleArray = []
for i in (-24 ... 0) {
    tupleArray.append((i, (i % 5) + 5))
}
tupleArray

// So the negative numbers cycle between -y+1 and 0
// and the positive numbers cycle between 0 and y - 1
// If we shift any negative numbers over to the right by y
// This is EXACTLY equivalent to the "wrap-around" rules for 
// Conway's GoL

// So.. for any x > 0
// x % y = (x + y) % y

let array = [1, 2 , 3, 4, 5]

func shiftPosition(of array: [Int], by amount: Int, from position: Int) -> Int {
    //     produces between -count+1 and count-1       produces between 0 and count-1
    return (((position + amount) % array.count)    +    array.count) % array.count
}

shiftPosition(of: array, by: -1, from: 0)
shiftPosition(of: array, by: -2, from: 0)
shiftPosition(of: array, by: -3, from: 0)
shiftPosition(of: array, by: -4, from: 0)
shiftPosition(of: array, by: -5, from: 0)
shiftPosition(of: array, by: -6, from: 0)
// and so on

shiftPosition(of: array, by:  1, from: array.count - 1)
shiftPosition(of: array, by:  2, from: array.count - 1)
shiftPosition(of: array, by:  3, from: array.count - 1)
shiftPosition(of: array, by:  4, from: array.count - 1)
shiftPosition(of: array, by:  5, from: array.count - 1)
shiftPosition(of: array, by:  6, from: array.count - 1)
// And so on..

// You should understand this for the wrap around rules
// What you are asked to do in the homework is EXACTLY equivalent to this
// only you are doing it for rows and columns instead of just rows







