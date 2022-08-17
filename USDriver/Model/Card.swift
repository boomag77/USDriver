//
//  Card.swift
//  USDriver
//
//  Created by Sergey on 8/16/22.
//

import Foundation
import UIKit

protocol CardProtocol {
    var id: Int { get set }
    var question: QuestionForCard { get set }
    var answers: [Answer] { get set }
}

struct Card: CardProtocol {
    var id: Int
    var question: QuestionForCard
    var answers: [Answer]
    
    init(id: Int) {
        self.id = id
        self.answers = AnswersStorage().load(card: self.id)
        self.question = QuestionsForCardsStorage().load(id: self.id)
    }
}
