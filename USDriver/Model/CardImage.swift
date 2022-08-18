//
//  Image.swift
//  USDriver
//
//  Created by Sergey on 8/17/22.
//

import Foundation
import UIKit

protocol CardImageProtocol {
    var cardId: Int { get }
    var image: UIImage? { get set }
}

struct CardImage: CardImageProtocol {
    var cardId: Int
    var image: UIImage?
}
