//arr = [1, 1, 0, -1, -1]
// 0.400000
// 0.400000
// 0.200000

import Foundation

func plusMinus(arr: [Int]) -> Void {
    let positiveArr = arr.filter({ $0 > 0 })
    let negativeArr = arr.filter({ $0 < 0 })
    let zeroArr = arr.filter({ $0 == 0 })
    getStringValue(curentValue: positiveArr.count, arrCount: arr.count)
    getStringValue(curentValue: negativeArr.count, arrCount: arr.count)
    getStringValue(curentValue: zeroArr.count, arrCount: arr.count)
}

func getStringValue(curentValue: Int, arrCount: Int) {
    print(String(format: "%.6f", Double(curentValue) / Double(arrCount)))
}

plusMinus(arr: [1, 1, 0, -1, -1])


