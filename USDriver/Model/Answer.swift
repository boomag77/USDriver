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



struct Answer: Equatable, Sequence, IteratorProtocol     {
    var text: String?
    var isRight: IsRight?
    var current = 0
}

extension Answer {
    static func ==(lhs: Answer, rhs: Answer) -> Bool {
        return lhs.text! == rhs.text!
    }
    
    mutating func next() -> Int? {
        defer {
            current += 1
        }
        return current
    }
}
