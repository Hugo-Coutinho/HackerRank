// h1 = [3, 2, 1, 1, 1]
// h2 = [4, 3, 2]
// h3 = [1, 1, 4, 1]

// remove the numbers until the sum of all the three arrays gotta be the same


func equalStacks(h1: [Int], h2: [Int], h3: [Int]) -> Int {
    guard !(h1.isEmpty || h2.isEmpty || h3.isEmpty) else { return 0 }
    var arr1 = h1
    var arr2 = h2
    var arr3 = h3
    let h1Sum = h1.reduce(0, +)
    let h2Sum = h2.reduce(0, +)
    let h3Sum = h3.reduce(0, +)
    var result = 0
    guard !(h1Sum == h2Sum && h2Sum == h3Sum) else { return h1Sum }
    switch true {
    case h1Sum >= h2Sum && h1Sum >= h3Sum:
        arr1 = h1
        arr1.removeFirst()
        result = equalStacks(h1: arr1, h2: arr2, h3: arr3)
    case h2Sum >= h1Sum && h2Sum >= h3Sum:
        arr2 = h2
        arr2.removeFirst()
        result = equalStacks(h1: arr1, h2: arr2, h3: arr3)
    case h3Sum >= h1Sum && h3Sum >= h2Sum:
        arr3 = h3
        arr3.removeFirst()
        result = equalStacks(h1: arr1, h2: arr2, h3: arr3)
    default:
        break
    }
    return result
}

print(equalStacks(h1: [3, 2, 1, 1, 1], h2: [4, 3, 2], h3: [1, 1, 4, 1]))
