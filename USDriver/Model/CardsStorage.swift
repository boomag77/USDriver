//
//  Cards`.swift
//  USDriver
//
//  Created by Sergey on 8/16/22.
//

import Foundation

protocol CardsStorageProtocol {
    var numberOfCards: Int { get }
    var cards: [Card] { get set }
}


class CardsStorage: CardsStorageProtocol {
   
    // Predicted quantity of cards
    let numberOfCards: Int = 2
    var cards: [Card] = []
    
    init() {
        self.cards = loadCards(numberOfCards: self.numberOfCards)
    }
    
    private func loadCards(numberOfCards: Int) -> [Card] {
        var cards: [Card] = []
        for cardId in 0..<numberOfCards {
            let card = Card(id: cardId)
            cards.append(card)
        }
        return cards.shuffled()
    }
}
