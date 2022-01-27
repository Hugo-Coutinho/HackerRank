// s - sam's house starting point
// t - end location sam's house
// a - location of apple tree
// b - location of the orange tree
// apples
// oranges

// (s = 7, t = 10, a = 4, b = 12, apple = [2, 3, -4], orange = [3, -2, -4])
// adding apples distance from tree
// [4 + 2, 4 + 3, 4 + -4] = [6, 7, 0]
// adding oranges distance from tree
// [12 + 3, 12 + -2, 12 + -4] = [15, 10, 8]
// how many apples land inside the range of sam's house?
// range 7 - 10
// apples [6, 7, 0]
// print 1
// how many oranges land inside the range of sam's house?
// range 7 - 10
// oranges [15, 10, 8]
// print 2

func countApplesAndOranges(s: Int, t: Int, a: Int, b: Int, apples: [Int], oranges: [Int]) -> Void {
    let applesDistance: [Int] = setupFruitDistance(fruit: apples, distance: a)
    let orangesDistance: [Int] = setupFruitDistance(fruit: oranges, distance: b)
    let houseRange = s...t
    print(getFruitLandCount(houseRange: houseRange, fruits: applesDistance))
    print(getFruitLandCount(houseRange: houseRange, fruits: orangesDistance))
}

func setupFruitDistance(fruit: [Int], distance: Int) -> [Int] {
    return fruit.map({ $0 + distance })
}

func getFruitLandCount(houseRange: ClosedRange<Int>, fruits: [Int]) -> Int {
    var fruitLandCount = 0
    for fruit in fruits {
        if houseRange.contains(fruit) {
            fruitLandCount += 1
        }
    }
    return fruitLandCount
}

countApplesAndOranges(s: 7, t: 10, a: 4, b: 12, apples: [2, 3, -4], oranges: [3, -2, -4])
