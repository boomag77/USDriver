//
//  QuestionsStorage.swift
//  USDriver
//
//  Created by Sergey on 8/17/22.
//

import Foundation
import UIKit

protocol QuestionsForCardsStorageProtocol {
    var amountOfQuestions: Int { get set }
    func load(cardId: Int) -> QuestionForCard
}

class QuestionsForCardsStorage: QuestionsForCardsStorageProtocol {
    var amountOfQuestions: Int
    
    // Card numeration begins from 0
    var questionsForCards: [QuestionForCard] = []
    
    init() {
        var id = 0
        while let image = ImagesStorage().load(forCard: id) {
            self.questionsForCards.append(QuestionForCard(cardId: id, text: nil, image: image))
            id += 1
        }
        amountOfQuestions = questionsForCards.count
    }
    
    func load(cardId: Int) -> QuestionForCard {
        return questionsForCards[cardId]
    }
}
