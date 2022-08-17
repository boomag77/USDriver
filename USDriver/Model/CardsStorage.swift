//
//  Cards`.swift
//  USDriver
//
//  Created by Sergey on 8/16/22.
//

import Foundation

protocol CardsStorageProtocol {
    func loadCards() -> [Card]
}

class CardStorage: CardsStorageProtocol {
    
    // Predicted quantity of cards
    let numberOfCards: Int = 2
    
    func loadCards() -> [Card] {
        var cards: [Card] = []
        for cardNumber in 1...numberOfCards {
            let card = Card(number: cardNumber)
            cards.append(card)
        }
        return cards.shuffled()
    }
}
