//
//  Cards`.swift
//  USDriver
//
//  Created by Sergey on 8/16/22.
//

import Foundation

protocol CardsStorageProtocol {
    func loadCards() -> [CardProtocol]
}

class CardStorage: CardsStorageProtocol {
    
    // Predicted quantity of cards
    let numberOfCards: Int = 2
    
    func loadCards() -> [CardProtocol] {
        var cards: [CardProtocol] = []
        for cardNumber in 1...numberOfCards {
            let card = Card(number: cardNumber)
            cards.append(card)
        }
        return cards.shuffled()
    }
}
