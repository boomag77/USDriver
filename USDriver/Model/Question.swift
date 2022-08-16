//
//  Question.swift
//  USDriver
//
//  Created by Sergey on 8/16/22.
//

import Foundation

enum IsRight {
    case yes
    case no
}

protocol QuestionProtocol {
    var forCard: Int { get }
    var text: String { get }
    var isRight: IsRight { get set }
}

struct Question: QuestionProtocol {
    var forCard: Int
    var text: String
    var isRight: IsRight
}

