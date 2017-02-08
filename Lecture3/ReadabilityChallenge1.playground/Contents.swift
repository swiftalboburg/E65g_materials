
func isLeap(_ year:Int) ->  Bool {
    return (year % 4 == 0 && year % 100 != 0) || year % 400 == 0
}

let months     = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
let leapMonths = [31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]

func julianDate(year: Int, month: Int, day: Int) -> Int {
    return (1900 ..< year ).reduce(0) { isLeap($1)   ? $0 + 366            : $0 + 365        }
        + (0 ..< month - 1).reduce(0) { isLeap(year) ? $0 + leapMonths[$1] : $0 + months[$1] }
        + day
}

isLeap(1900)

julianDate(year: 1960, month:  9, day: 28)
julianDate(year: 1900, month:  1, day:  1)
julianDate(year: 1900, month: 12, day: 31)
julianDate(year: 1901, month:  1, day:  1)
julianDate(year: 1901, month:  1, day:  1) - julianDate(year: 1900, month: 1, day: 1)
julianDate(year: 2001, month:  1, day:  1) - julianDate(year: 2000, month: 1, day: 1)

isLeap(1960)
isLeap(1900)
isLeap(2000)

