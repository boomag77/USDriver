//
//  Card.swift
//  USDriver
//
//  Created by Sergey on 8/16/22.
//

import Foundation
import UIKit

protocol CardProtocol {
    var cardId: Int { get set }
    var question: Question { get set }
    var answer: [Answer] { get set }
}

struct Card: CardProtocol {
    var cardId: Int
    var question: Question
    var answer: [Answer]
    
}
