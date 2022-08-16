//
//  Test.swift
//  USDriver
//
//  Created by Sergey on 8/16/22.
//

import Foundation

protocol TestProtocol {
    var numberOfCards: Int { get set }
    var cards: [Card] { get set }
    func isRight(answer: QuestionProtocol) -> Bool
    
}
