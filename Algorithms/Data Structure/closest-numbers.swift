func closestNumbers(numbers: [Int]) -> Void {
    let sortedNumbers = numbers.sorted()
    let minDiff = Int.max

    for (i, _) in [Int](1...sortedNumbers.count).enumerated() {
        let absDiff = 0
        let currentNumber = sortedNumbers[i]
        guard i < (sortedNumbers.count - 1) else { break }
        let nextNumber = sortedNumbers[i + 1]
        runningClosestNumbers(absDiff: absDiff, minDiff: minDiff, currentNumber: currentNumber, nextNumber: nextNumber)
    }
}

func runningClosestNumbers(absDiff: Int, minDiff: Int, currentNumber: Int, nextNumber: Int) {
    var absDiff = absDiff
    var minDiff = minDiff

    if (currentNumber < 0 && nextNumber < 0) ||
        (currentNumber > 0 && nextNumber > 0) {
        absDiff = nextNumber - currentNumber
    } else {
        absDiff = currentNumber + nextNumber
    }

    if absDiff < minDiff {
        minDiff = absDiff
        print("\(currentNumber) \(nextNumber)")

    } else if absDiff == minDiff {
        print("\(currentNumber) \(nextNumber)")
    }
}

//closestNumbers(numbers: [5, -9, -5, 9, 10, 12])
//closestNumbers(numbers: [4, 2, 1, 3])
closestNumbers(numbers: [6, 2, 4, 10])
