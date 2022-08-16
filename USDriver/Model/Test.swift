//
//  Test.swift
//  USDriver
//
//  Created by Sergey on 8/16/22.
//

import Foundation

enum Variant {
    case test
    case quiz
}

protocol TestProtocol {
    var variant: Variant { get set }
    var numberOfCards: Int { get set }
    var cards: [Card] { get set }
    func isRight(answer: QuestionProtocol) -> Bool
    
}
