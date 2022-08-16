//
//  Image.swift
//  USDriver
//
//  Created by Sergey on 8/17/22.
//

import Foundation
import UIKit

protocol CardImageProtocol {
    var id: Int { get }
    var path: String { get set }
}

struct CardImage: CardImageProtocol {
    var id: Int
    var path: String
}
