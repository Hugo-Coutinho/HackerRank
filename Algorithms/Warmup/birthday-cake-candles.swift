// Candle heights are [3, 2, 1, 3]. The tallest candles are 3 units, and there are 2 of them

func birthdayCakeCandles(candles: [Int]) -> Int {
    let max = candles.max()
    return candles.filter({ $0 == max }).count
}

print(birthdayCakeCandles(candles: [1, 1, 1, 1]))

