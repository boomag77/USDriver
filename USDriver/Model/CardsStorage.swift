//
//  Cards`.swift
//  USDriver
//
//  Created by Sergey on 8/16/22.
//

import Foundation
import UIKit

protocol CardsStorageProtocol {
    var numberOfCards: Int { get }
    var numberOfAnswersInCard: Int { get }
    var cards: [Card] { get set }
}

class CardsStorage: CardsStorageProtocol {
    
    let numberOfAnswersInCard: Int
    var numberOfCards: Int
    
    var cards: [Card] = [
        Card(cardId: 0,
             question: Question(text: nil, image: UIImage(named: "0")),
             answer: [Answer(text: "Stop", isRight: .yes)]),
        Card(cardId: 1,
             question: Question(text: nil, image: UIImage(named: "1")),
             answer: [Answer(text: "Entrance prohibited", isRight: .yes)]),
        Card(cardId: 2,
             question: Question(text: "Qestion 3", image: nil),
             answer: [Answer(text: "Answer for card 3", isRight: .yes)]),
        Card(cardId: 3,
             question: Question(text: "Qestion 4", image: nil),
             answer: [Answer(text: "Answer for card 4", isRight: .yes)]),
        Card(cardId: 4,
             question: Question(text: "Qestion 5", image: nil),
             answer: [Answer(text: "Answer for card 5", isRight: .yes)]),
        Card(cardId: 5,
             question: Question(text: "Qestion 5", image: nil),
             answer: [Answer(text: "Answer for card 5", isRight: .yes)])
    ]
    
    var newCards: [Card] = []
    
    init(numberOfAnswersInCard: Int) {
        self.numberOfAnswersInCard = numberOfAnswersInCard
        self.numberOfCards = cards.count
    }
    
    private func addWrongAnswers() {
        guard cards.count > 1 else {
            return
        }
        
        func getWrongAnswersForCard(_ card: Card) -> [Answer] {
            var answersForCard: [Answer] = card.answer
            
            while answersForCard.count < numberOfAnswersInCard {
                if let randomCard = cards.randomElement() {
                    if randomCard.cardId != card.cardId {
                        var wrongAnswer = randomCard.answer[0]
                        if !answersForCard.contains(wrongAnswer) {
                            wrongAnswer.isRight = .no
                            answersForCard.append(wrongAnswer)
                        }
                    }
                }
            }
            return answersForCard.shuffled()
        }
        
        for card in cards {
            var newCard = card
            newCard.answer = getWrongAnswersForCard(card)
            newCards.append(newCard)
        }
    }
    
    func loadCards() -> [Card] {
        addWrongAnswers()
        return newCards
    }
}
