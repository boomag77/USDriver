//
//  AnswersStorage.swift
//  USDriver
//
//  Created by Sergey on 8/16/22.
//

import Foundation

protocol AnswersStorageProtocol {
    var testAnswers: [Answer] { get }
    func load(cardId: Int) -> [Answer]
    
}

class AnswersStorage: AnswersStorageProtocol {
    let numberOfAnswersInCard: Int
    
    // Cards numeration begins from 0!
    let testAnswers: [Answer] = [
        Answer(forCard: 0, text: "STOP", isRight: .yes),
        Answer(forCard: 0, text: "not STOP", isRight: .no),
        Answer(forCard: 1, text: "Entrance prohibited", isRight: .yes),
        Answer(forCard: 2, text: "Another answer", isRight: .yes)
    ]
    init(numberOfAnswers: Int) {
        self.numberOfAnswersInCard = numberOfAnswers
    }
    func load(cardId: Int) -> [Answer] {
        return testAnswers.filter { $0.forCard == cardId } + selectUpWrongAnswersForCard(cardId)
    }
    
    private func selectUpWrongAnswersForCard(_ cardId: Int) -> [Answer] {
        var wrongAnswersForCard: [Answer] = []
        while wrongAnswersForCard.count < (numberOfAnswersInCard - 1) {
            if var answer = testAnswers.randomElement() {
                if answer.forCard != cardId || answer.isRight == .no {
                    answer.isRight = .no
                    wrongAnswersForCard.append(answer)
                }
            }
        }
        return wrongAnswersForCard
    }
}
