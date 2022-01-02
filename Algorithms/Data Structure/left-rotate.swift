// arr = [1, 2, 3, 4, 5]
// 2 rotate
// [3, 4, 5, 1, 2]

func rotateLeft(d: Int, arr: [Int]) -> [Int] {
    var result: [Int] = []
    var rotateValues: [Int] = []
    
    for (arrIndex, _) in [Int](1...arr.count).enumerated() {
        if arrIndex < d {
            rotateValues.append(arr[arrIndex])
        } else {
            result.append(arr[arrIndex])
        }
    }
    result.append(contentsOf: rotateValues)
    return result
}

print("answer: \(rotateLeft(d: 0, arr: [1, 2, 3, 4, 5]))")
