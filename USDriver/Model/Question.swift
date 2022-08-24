//
//  Question.swift
//  USDriver
//
//  Created by Sergey on 8/17/22.
//

import Foundation
import UIKit

protocol QuestionProtocol {
    var text: String? { get set }
    var image: UIImage? { get set }
}

struct Question: QuestionProtocol {
    var text: String?
    var image: UIImage?
}
