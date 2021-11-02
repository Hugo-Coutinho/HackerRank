func compareTriplets(a: [Int], b: [Int]) -> [Int] {
    var aliceScore = 0
    var bobScore = 0
    for (index, aValue) in a.enumerated() {
        let bValue = b[index]
        if aValue != bValue {
            if aValue > bValue {
                aliceScore += 1
            } else {
                bobScore += 1
            }
        }
    }
    return [aliceScore, bobScore]
}

