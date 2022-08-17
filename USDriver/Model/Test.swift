//
//  Test.swift
//  USDriver
//
//  Created by Sergey on 8/16/22.
//

import Foundation

enum Option {
    case test
    case study
}

protocol TestProtocol {
    var option: Option { get set }
    var numberOfCards: Int { get set }
    var cards: [Card] { get set }
    
}

struct Test: TestProtocol {
    var option: Option
    var numberOfCards: Int
    var cards: [Card]
}
