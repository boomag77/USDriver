//
//  QuestionsStorage.swift
//  USDriver
//
//  Created by Sergey on 8/17/22.
//

import Foundation

protocol QuestionsForCardsStorageProtocol {
    func load(id: Int) -> QuestionForCard
}

class QuestionsForCardsStorage: QuestionsForCardsStorageProtocol {
    let questionsForCards: [QuestionForCard] = [
        QuestionForCard(id: 0, text: "Question No 1", image: nil),
        QuestionForCard(id: 1, text: "Question No 2", image: nil)
    ]
    func load(id: Int) -> QuestionForCard {
        return questionsForCards[id]
    }
}
