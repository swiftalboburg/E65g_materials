






// Challenge 1

func isLeap(_ year:Int) -> Bool { return (year % 4 == 0 && year % 100 != 0) || year % 400 == 0 }

let months = [0, 31, 59, 90, 120, 151, 181, 212, 243, 273, 304, 334]

func julianDate(year: Int, month: Int, day: Int) -> Int {
//    guard year >= 1900 else { return -1 }
//    guard (1 ... 12).contains(month) else { return -1 }
//    guard (1 ... 31).contains(day) else { return -1 }
    return ((1900 ..< year).reduce(0) { $0 + (isLeap($1) ? 366 : 365) })
        + months[month - 1] + (isLeap(year) && month > 2 ? 1 : 0)
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




