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
    let numberOfCards: Int = QuestionsForCardsStorage().getAmountOfQuestions()
    internal var cards: [Card] = []
    
    init() {
        self.cards = fillCards(numberOfCards: self.numberOfCards)
    }
    // Card numeration begins from 0
    private func fillCards(numberOfCards: Int) -> [Card] {
        for cardId in 0..<numberOfCards {
            let card = Card(id: cardId)
            cards.append(card)
        }
        return cards.shuffled()
    }
    
    func loadCards() -> [Card] {
        return cards
    }
}
