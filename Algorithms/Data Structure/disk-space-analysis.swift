
//Example n = 3, the number of computers space = [8, 2, 4] x = 2, the length of analysis segments In this array of computers, the subarrays of size 2 are [18, 2] and [2, 4]. Thus, the initial analysis returns 2 and 2 because those are the minima for the segments. Finally, the maximum of these values is 2. Therefore, the answer is 2

// Parameters
// n = 3
// spaces = [8, 2, 4]
// x = 2

// What should do
// split to arrays with 2 spaces only: [8,2] and [2,4]
// reduce with the minimum values for each array: [2,2]
// return the max: 2

// other example

// Parameters
// n = 5
// spaces = [1, 2, 3, 1, 2]
// x = 1

// What should do
// split to arrays with 2 spaces only: [1], [2], [3], [1], [2]
// reduce with the minimum values for each array: [1, 2, 3, 1, 2]
// return the max: 3


func diskSpaceAnalis(n: Int, x: Int, spaces: [Int]) -> Int {
    let splittedArr: [[Int]] = splitArrBy(size: x, spaces: spaces)
    let arrWithMinimumValues: [Int] = getMinimumValuesFrom(splittedArr: splittedArr)
    return arrWithMinimumValues.max() ?? 0
}

func splitArrBy(size: Int, spaces: [Int]) -> [[Int]] {
    var splittedArr: [[Int]] = []
    var currentMicroArr: [Int] = []
    for (arrIndex, _) in [Int](1...spaces.count).enumerated() {
        if currentMicroArr.count < size {
            currentMicroArr.append(spaces[arrIndex])
        } else {
            splittedArr.append(currentMicroArr)
            currentMicroArr.removeFirst()
            currentMicroArr.append(spaces[arrIndex])
            if arrIndex == (spaces.count - 1) { splittedArr.append(currentMicroArr) }
        }
    }

    return splittedArr
}

func getMinimumValuesFrom(splittedArr: [[Int]]) -> [Int] {
    var result: [Int] = []
    for currentMicroArr in splittedArr {
        result.append(currentMicroArr.min() ?? 0)
    }

    return result
}

diskSpaceAnalis(n: 5, x: 1, spaces: [2, 5, 4, 6, 8])



