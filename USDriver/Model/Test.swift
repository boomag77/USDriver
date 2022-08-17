//
//  Test.swift
//  USDriver
//
//  Created by Sergey on 8/16/22.
//

import Foundation

enum Option {
    case quiz
    case study
}

protocol TestProtocol {
    var option: Option { get set }
    var countOfRightAnswers: Int { get set }
    mutating func getCard() -> Card?
    mutating func checkAnswer(answer: Answer) -> Bool
}

struct Test: TestProtocol {
    
    var option: Option
    var countOfRightAnswers: Int
    private var cards: [Card]
    
    init(option: Option) {
        self.option = option
        self.countOfRightAnswers = 0
        self.cards = CardsStorage().cards
    }
    
    mutating func getCard() -> Card? {
        guard let card = self.cards.randomElement() else {
            return nil
        }
        self.cards.remove(at: card.id)
        return card
    }
    
    mutating func checkAnswer(answer: Answer) -> Bool {
        if answer.isRight == .yes {
            switch self.option {
                case .study:
                    return true
                case .quiz:
                    countOfRightAnswers += 1
            }
        }
        return false
    }
}
