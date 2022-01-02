func isAnagram(currentWord: String, result: [String]) -> Bool {
    for rWord in result {
        if currentWord.sorted() == rWord.sorted() { return true }
    }
    return false
}


func funWithAnagrams(text: [String]) -> [String] {
    var result: [String] = []

    for currentWord in text {
        if !result.contains(where: { $0 == currentWord }),
           !isAnagram(currentWord: currentWord, result: result) {
            result.append(currentWord)
        }
    }

    return result.sorted()
}

funWithAnagrams(text: ["code", "doce", "ecod", "framer", "frame"])
funWithAnagrams(text: ["code", "aaagmnrs", "anagrams", "doce"])
