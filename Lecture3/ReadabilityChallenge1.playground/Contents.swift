
func isLeap(_ year:Int) ->  Bool { return (year % 4 == 0 && year % 100 != 0) || year % 400 == 0 }

let nonLeapMonths = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
let leapMonths    = [31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]

func julianDate(year: Int, month: Int, day: Int) -> Int {
    let months = isLeap(year) ? leapMonths : nonLeapMonths
    let yearDays = (1900 ..< year).reduce(0) {  return $0 + (isLeap($1) ? 366 : 365) }
    let monthDays = (0 ..< month - 1).reduce(0) { return $0 + months[$1] }
    return yearDays + monthDays + day
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

