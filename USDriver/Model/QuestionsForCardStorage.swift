//
//  QuestionsStorage.swift
//  USDriver
//
//  Created by Sergey on 8/17/22.
//

import Foundation
import UIKit

protocol QuestionsForCardsStorageProtocol {
    var amountOfQuestions: Int { get }
    func load(cardId: Int) -> QuestionForCard
}

class QuestionsForCardsStorage: QuestionsForCardsStorageProtocol {
    internal var amountOfQuestions: Int
    
    // Card numeration begins from 0
    private var questionsForCards: [QuestionForCard] = []
    
    private var textsForQuestion: [String?] = []
    
    init() {
        var id = 0
        while let image = ImagesStorage().load(forCard: id) {
            self.questionsForCards.append(QuestionForCard(cardId: id, text: nil, image: image))
            id += 1
        }
        while let text = textsForQuestion.first {
            self.textsForQuestion.removeFirst()
            self.questionsForCards.append(QuestionForCard(cardId: id, text: text, image: nil))
            id += 1
        }
        self.amountOfQuestions = questionsForCards.count
    }
    
    func load(cardId: Int) -> QuestionForCard {
        return questionsForCards[cardId]
    }
    
    func getAmountOfQuestions() -> Int {
        return amountOfQuestions
    }
}
