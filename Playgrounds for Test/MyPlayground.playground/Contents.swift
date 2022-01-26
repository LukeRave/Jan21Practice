import UIKit

func printPigLatin(word: String) {
    let latin = "ay"
    let latin2 = "yay"
    var word = word
    let letter = word[word.startIndex]
    let letter2 = word.removeFirst()

    switch letter {
    case "a", "e", "i", "o", "u":
        let pigWord = "\(letter)\(word)\(latin2)"
        print(pigWord)

    default:
        let pigWord = "\(word)\(letter2)"
        print("\(pigWord)\(latin)")
    }
}

printPigLatin(word: "new")
