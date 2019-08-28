//: [Previous](@previous)

import Foundation
import XCPlayground

class CardGame {
    private let original: [Int]
    private var deck: [Int]
    init(_ nums: [Int]) {
        self.original = nums
        self.deck = nums
    }
    
    /** Resets the array to its original configuration and return it. */
    func reset() -> [Int] {
        return self.original
    }
    
    /** Returns a random shuffling of the array. */
    func shuffle() -> [Int] {
        for (index, _) in self.deck.enumerated() {
            let random = Int.random(in: 0..<deck.count)
            let temp = self.deck[random]
            self.deck[random] = self.deck[index]
            self.deck[index] = temp
        }
        return self.deck
    }
}

let game = CardGame([1,2,3,4,5,6,7,8,9,10,11,12,13])

let firstRound = game.shuffle().map { $0 }

let secondRound = game.shuffle().map { $0 }

let thrdRound = game.shuffle().map { $0 }

