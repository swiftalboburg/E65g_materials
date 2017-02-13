/*: 
 For wrap around rules in Homework Assignment 2
 Apply the modulo operator to any integer
 For an example lets pick 5 as our modulus.
 (this would be equivalent to using a 5x5 grid
 in Conway's GoL)
 */
3 % 5
8 % 5
13 % 5
/*:
 Note how all of those expressions equal 3
*/

/*:
 Now deal with negative numbers
*/
-2 % 5
-7 % 5
-12 % 5

/*:
 Now note what happens if we add the modulus back
*/
(-2 % 5) + 5
(-7 % 5) + 5
(-12 % 5) + 5

/*: Again note that all 3 are equal to 3.  In other words, 
 if there are 5 cells in our row or column, then under the wrap around
 rules, starting at 0 and moving 2 steps to the left puts us back at 3.
 movining 7 steps left also puts us back at 3, moving 12 steps
 left also puts us back at 3.
 
 So, the thing to note is that:
```
x % y
```
 maps any number x (positive or negative) into the range:
```
 -y + 1 < x % y < y - 1
```
 and furthermore (and most importantly for the homework)
 This mapping cycles over and over.  
 
 Observe the cycling when we take steps to the right:
*/
var tupleArray: [(Int, Int)] = []
for i in (0 ..< 25) {
    tupleArray.append((i, i % 5))
}
tupleArray

/*:
 Now observe the cycling between -4 and 0 when we are stepping from the left
 */
tupleArray = []
for i in (-24 ... 0 ) {
    tupleArray.append((i, i % 5))
}
tupleArray

/*: 
 Now put it all together and observe how we can stay in our
 range of zero to 4
 */
tupleArray = []
for i in (-10 ... 10) {
    tupleArray.append((i, ((i % 5) + 5) % 5))
}
tupleArray

/*: So the negative numbers cycle between -y+1 and 0
 and the positive numbers cycle between 0 and y - 1
 If we shift any negative numbers over to the right by y
 This is EXACTLY equivalent to the "wrap-around" rules for
 Conway's GoL
 
 You should play with the array below and and the calls to shift position
 to see that shiftPosition implements the wrap-around rules no matter what size
 the array is.  This is *EXACTLY* what you are being asked to do for your
 homework, only in 2 dimensions instead of just one.
*/
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
/*:
 and so on
*/
shiftPosition(of: array, by:  1, from: array.count - 1)
shiftPosition(of: array, by:  2, from: array.count - 1)
shiftPosition(of: array, by:  3, from: array.count - 1)
shiftPosition(of: array, by:  4, from: array.count - 1)
shiftPosition(of: array, by:  5, from: array.count - 1)
shiftPosition(of: array, by:  6, from: array.count - 1)
/*:
 And so on..

 You should understand this for the wrap around rules
 What you are asked to do in the homework is EXACTLY equivalent to this
 only you are doing it for rows and columns instead of just rows
 */







