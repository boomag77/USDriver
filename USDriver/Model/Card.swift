//
//  Card.swift
//  USDriver
//
//  Created by Sergey on 8/16/22.
//

import Foundation
import UIKit

protocol CardProtocol {
    var number: Int { get set }
    var image: CardImage { get set }
    var questions: [QuestionProtocol] { get set }
}

struct Card: CardProtocol {
    var number: Int
    var image: CardImage
    var questions: [QuestionProtocol]
    
    init(number: Int) {
        self.number = number
        self.questions = QuestionsStorage().load(card: self.number)
        self.image = ImagesStorage().load(forCard: self.number)
    }
}
