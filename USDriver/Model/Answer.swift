//
//  Answer.swift
//  USDriver
//
//  Created by Sergey on 8/16/22.
//

import Foundation

enum IsRight {
    case yes
    case no
}

protocol AnswerProtocol {
    var forCard: Int { get set }
    var text: String { get set }
    var isRight: IsRight { get set }
}

struct Answer: AnswerProtocol {
    var forCard: Int
    var text: String
    var isRight: IsRight
}

