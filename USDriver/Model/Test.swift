//
//  Test.swift
//  USDriver
//
//  Created by Sergey on 8/16/22.
//

import Foundation

enum Mode {
    case quiz
    case study
}

protocol TestProtocol {
    var mode: Mode { get set }
    var countOfRightAnswers: Int { get set }
    mutating func getCard() -> Card?
    mutating func checkAnswer(answer: Answer) -> Bool
}

struct Test: TestProtocol {
    
    var mode: Mode
    var countOfRightAnswers: Int
    private var cards: [Card]
    
    init(mode: Mode) {
        self.mode = mode
        self.countOfRightAnswers = 0
        self.cards = CardsStorage().cards
    }
    
    mutating func getCard() -> Card? {
        guard let card = self.cards.randomElement() else {
            return nil
        }
        if self.mode == .quiz {
            self.cards.remove(at: card.id)
        }
        return card
    }
    
    mutating func checkAnswer(answer: Answer) -> Bool {
        if answer.isRight == .yes {
            switch self.mode {
                case .study:
                    return true
                case .quiz:
                    self.countOfRightAnswers += 1
            }
        }
        return false
    }
}
