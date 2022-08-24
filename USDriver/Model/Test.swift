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
    var numberOfCards: Int { get }
    mutating func getCard() -> Card?
    mutating func checkAnswer(answer: Answer) -> Bool
}

struct Test: TestProtocol {
    
    var countOfRightAnswers: Int = 0
    var mode: Mode
    private var cards: [Card]
    var numberOfCards: Int
    
    init(withMode mode: Mode) {
        self.mode = mode
        self.cards = CardsStorage(numberOfAnswersInCard: 3).loadCards()
        self.numberOfCards = self.cards.count
    }
    
    mutating func getCard() -> Card? {
        
        switch self.mode {
            case .study:
                guard let card = self.cards.randomElement() else {
                    return nil
                }
                return card
            case .quiz:
                guard let card = self.cards.popLast() else {
                    return nil
                }
                return card
        }
        return nil
    }
    
    mutating func checkAnswer(answer: Answer) -> Bool {
        if answer.isRight == .yes {
            switch self.mode {
                case .study:
                    return true
                case .quiz:
                    self.countOfRightAnswers += 1
                    return true
            }
        }
        return false
    }
    
    func calculateResult() -> String {
        
        let percentOfRightAnswers: Int = countOfRightAnswers/numberOfCards*100
        let str: String = "\(countOfRightAnswers) correct answers out of \(numberOfCards) questions (\(percentOfRightAnswers)%)"
        return str
    }
    
}
