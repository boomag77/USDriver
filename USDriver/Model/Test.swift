//
//  Test.swift
//  USDriver
//
//  Created by Sergey on 8/16/22.
//

import Foundation

enum Mode: String, CustomStringConvertible {
    case quiz
    case study
    var description: String {
        return "\(self.rawValue.capitalized) mode"
    }
}

protocol TestProtocol {
    var mode: Mode { get set }
    var countOfRightAnswers: Double { get set }
    var numberOfCards: Double { get }
    mutating func getCard() -> Card?
    mutating func checkAnswer(answer: Answer) -> Bool
}

struct Test: TestProtocol {
    
    
    var countOfRightAnswers: Double = 0
    var mode: Mode
    private var cards: [Card]
    var numberOfCards: Double
    
    init(withMode mode: Mode) {
        self.mode = mode
        self.cards = CardsStorage(numberOfAnswersInCard: 3).loadCards()
        self.numberOfCards = Double(self.cards.count)
    }
    
    mutating func getCard() -> Card? {
        if self.mode == .study {
            if let card = self.cards.randomElement() {
                return card
            }
        } else {
            if let card = self.cards.popLast() {
                return card
            }
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
        let percentOfRightAnswers: Int = Int(round(countOfRightAnswers/numberOfCards*100))
        let str: String = "\(Int(countOfRightAnswers)) correct answers out of \(Int(numberOfCards)) questions (\(percentOfRightAnswers)%)"
        return str
    }
    
}
