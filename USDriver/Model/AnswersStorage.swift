//
//  AnswersStorage.swift
//  USDriver
//
//  Created by Sergey on 8/16/22.
//

import Foundation

protocol AnswersStorageProtocol {
    var answers: [Answer] { get }
    func load(cardId: Int) -> [Answer]
    
}

class AnswersStorage: AnswersStorageProtocol {
    internal let numberOfAnswersInCard: Int
    
    // Cards numeration begins from 0!
    internal let answers: [Answer] = [
        Answer(forCard: 0, text: "STOP", isRight: .yes),
        Answer(forCard: 0, text: "not STOP", isRight: .no),
        Answer(forCard: 1, text: "Entrance prohibited", isRight: .yes),
        Answer(forCard: 2, text: "For text question 111", isRight: .yes),
        Answer(forCard: 3, text: "For text question 222", isRight: .yes)
    ]
    init(numberOfAnswers: Int) {
        self.numberOfAnswersInCard = numberOfAnswers
    }
    func load(cardId: Int) -> [Answer] {
        return (answers.filter { $0.forCard == cardId } + selectWrongAnswersForCard(cardId)).shuffled()
    }
    
    private func selectWrongAnswersForCard(_ cardId: Int) -> [Answer] {
        var wrongAnswersForCard: [Answer] = []
        while wrongAnswersForCard.count < (numberOfAnswersInCard - 1) {
            if var answer = answers.randomElement() {
                if (answer.forCard != cardId || answer.isRight == .no) && !wrongAnswersForCard.contains(answer) {
                    answer.isRight = .no
                    wrongAnswersForCard.append(answer)
                }
            }
        }
        return wrongAnswersForCard
    }
}
