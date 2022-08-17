//
//  Question.swift
//  USDriver
//
//  Created by Sergey on 8/17/22.
//

import Foundation
import UIKit

protocol QuestionForCardProtocol {
    var id: Int { get set }
    var text: String? { get set }
    var image: UIImage? { get set }
}

struct QuestionForCard: QuestionForCardProtocol {
    var id: Int
    var text: String?
    var image: UIImage?
}
