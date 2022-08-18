//
//  Question.swift
//  USDriver
//
//  Created by Sergey on 8/17/22.
//

import Foundation
import UIKit

protocol QuestionForCardProtocol {
    var cardId: Int { get set }
    var text: String? { get set }
    var image: CardImage? { get set }
}

struct QuestionForCard: QuestionForCardProtocol {
    var cardId: Int
    var text: String?
    var image: CardImage?
}
