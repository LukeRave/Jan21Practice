func pigLatinSentence(sentence: String) -> String {
    let sentenceArray = sentence.components(separatedBy: " ")
    sentenceArray.map(returnPigLatin(word:))
    return sentenceArray.joined(separator: " ")
}

func returnPigLatin(word: String) -> String {
    let firstLetter = word[word.startIndex]
    switch firstLetter {
    case "a":
        return word + "yay"
    
    case "e":
        return word + "yay"
    
    case "i":
        return word + "yay"
    
    case "o":
        return word + "yay"
    
    case "u":
        return word + "yay"
    
    default:
        var wordMinusFist = ""
        for num in 1...word.count-1 {
            let nextIndex = word[word.index(word.startIndex, offsetBy: num)]
            wordMinusFist += "\(nextIndex)"
        }
        let pigConst = wordMinusFist + "\(firstLetter)ay"
        return pigConst
    }
}
