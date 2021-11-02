// 1 2 3
// 4 5 6
// 9 8 9
// 1 + 5 + 9 = 15
// 3 + 5 + 9 = 17
// absolute difference [15 - 17] = 2

func diagonalDifference(arr: [[Int]]) -> Int {
    var leftToRightDiagonal = 0
    var rightToLeftDiagonal = 0
    var rightToLeftAux = arr[0].count - 1
    for (i, _) in [Int](1...arr.count).enumerated() {
        leftToRightDiagonal += arr[i][i]
        rightToLeftDiagonal += arr[i][rightToLeftAux]
        rightToLeftAux -= 1
    }
    return getAbsoluteDifference(firstValue: leftToRightDiagonal, secondValue: rightToLeftDiagonal)
}

func getAbsoluteDifference(firstValue: Int, secondValue: Int) -> Int {
    guard firstValue > secondValue else { return secondValue - firstValue }
    return firstValue - secondValue
}

print(diagonalDifference(arr: [
    [1, 2, 3],
    [4, 5, 6],
    [9, 8, 9],
]))

