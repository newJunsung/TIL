import Foundation

var answer = [Int]()
var countedCards = [Int: Int]()
var n = readLine()!
let cards = readLine()!.split(separator: " ").map{ Int(String($0))! }
n = readLine()!
let counts = readLine()!.split(separator: " ").map{ Int(String($0))! }

for card in cards {
    if countedCards.keys.contains(card) {
       countedCards[card]! += 1
    }
    else {
        countedCards[card] = 1
    }
}

for c in counts {
    answer.append(countedCards[c] ?? 0)
}

print(answer.map{String($0)}.joined(separator: " "))
