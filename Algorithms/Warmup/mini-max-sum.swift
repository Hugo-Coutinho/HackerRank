//1 2 3 4 5
//Sum everything except 5, the sum is 10
//Sum everything except 1, the sum is 14
//Sample Output: 10 14

func miniMaxSum(arr: [Int]) -> Void {
    let minSum = arr.filter({ $0 != arr.min() })
    let maxSum = arr.filter({ $0 != arr.max() })
    guard (minSum.reduce(0, +) != 0 || maxSum.reduce(0, +) != 0) else { print("\(arr.dropFirst().reduce(0, +)) \(arr.dropFirst().reduce(0, +))"); return }
    print("\( maxSum.reduce(0, +)) \(minSum.reduce(0, +))")
}

miniMaxSum(arr: [5, 5, 5, 5, 5])
