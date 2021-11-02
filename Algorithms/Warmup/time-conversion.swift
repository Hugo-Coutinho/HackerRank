//input: 07:05:45PM
//output: 19:05:45

import Foundation

func timeConversion(s: String) -> String {
    let dateAsString = s
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "h:mm:ssa"

    let date = dateFormatter.date(from: dateAsString)
    dateFormatter.dateFormat = "HH:mm:ss"

    guard let date = date else { return "" }
    let Date24 = dateFormatter.string(from: date)
    return Date24
}

print(timeConversion(s: "07:05:45PM"))
