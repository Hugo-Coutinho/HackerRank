func crop(message: String, K : Int) -> String {
    if message.count <= K {
        return message
    } else {
        var finalMessage = ""
        let messageSplitted = message.split(separator: " ", omittingEmptySubsequences: true)
        for word in messageSplitted {
            let newWord = String(word)
            guard finalMessage.count <= K,
            isNewWordAllowed(message: finalMessage, newWord: newWord, k: K) else { break }
            finalMessage = updatingFinalMessage(finalMessage: finalMessage, newWord: newWord)
        }
        return finalMessage
    }
}

func updatingFinalMessage(finalMessage: String, newWord: String) -> String {
    var finalMessage = finalMessage
    if finalMessage.isEmpty {
        finalMessage.append(contentsOf: newWord)
        return finalMessage
    } else {
        finalMessage.append(contentsOf: " \(newWord)")
        return finalMessage
    }
}

func isNewWordAllowed(message: String, newWord: String, k: Int) -> Bool {
    let message = updatingFinalMessage(finalMessage: message, newWord: newWord)
    return message.count <= k
}


crop(message: "codililty we test coders", K: 14)
crop(message: "Why not", K: 100)
crop(message: "The quick brown fox jumps over the lazy dog", K: 39)
crop(message: "To crop or not to crop", K: 21)
