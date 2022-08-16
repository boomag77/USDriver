//
//  QuestionsStorage.swift
//  USDriver
//
//  Created by Sergey on 8/16/22.
//

import Foundation

protocol QuestionsStorageProtocol {
    func load(card: Int) -> [QuestionProtocol]
}

class QuestionsStorage: QuestionsStorageProtocol {
    func load(card: Int) -> [QuestionProtocol] {
        let testQuestions: [QuestionProtocol] = [
            Question(forCard: 1, text: "1 First case", isRight: .yes),
            Question(forCard: 1, text: "1 Second case", isRight: .no),
            Question(forCard: 1, text: "1 Third case", isRight: .no),
            Question(forCard: 2, text: "2 First case", isRight: .yes),
            Question(forCard: 2, text: "2 Second case", isRight: .no),
            Question(forCard: 2, text: "2 Third case", isRight: .no)
        ]
        return testQuestions.filter { $0.forCard == card }.shuffled()
    }
}
