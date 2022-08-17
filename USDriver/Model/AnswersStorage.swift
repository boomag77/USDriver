//
//  AnswersStorage.swift
//  USDriver
//
//  Created by Sergey on 8/16/22.
//

import Foundation

protocol AnswersStorageProtocol {
    func load(card: Int) -> [Answer]
}

class AnswersStorage: AnswersStorageProtocol {
    func load(card: Int) -> [Answer] {
        let testAnswers: [Answer] = [
            Answer(forCard: 0, text: "Answer 1 for Question 1 jkbefvwbefewblfbefrbefv", isRight: .yes),
            Answer(forCard: 0, text: "Answer 2 for Question 1", isRight: .no),
            Answer(forCard: 0, text: "Answer 3 for Question 1", isRight: .no),
            Answer(forCard: 1, text: "Answer 1 for Question 2", isRight: .yes),
            Answer(forCard: 1, text: "Answer 2 for Question 2", isRight: .no),
            Answer(forCard: 1, text: "Answer 3 for Question 2", isRight: .no)
        ]
        return testAnswers.filter { $0.forCard == card }.shuffled().shuffled()
    }
}
