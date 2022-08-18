//
//  ImagesStorage.swift
//  USDriver
//
//  Created by Sergey on 8/17/22.
//

import Foundation
import UIKit

protocol ImagesStorageProtocol {
    var images: [CardImage] { get set }
    func load(forCard: Int) -> CardImage?
}

class ImagesStorage: ImagesStorageProtocol {
    var images: [CardImage] = []
    
    init() {
        var id: Int = 0
        while let image = UIImage(named: "\(id)") {
            self.images.append(CardImage(cardId: id, image: image))
            id += 1
        }
    }
    
    func load(forCard: Int) -> CardImage? {
        return images.filter { $0.cardId == forCard }.first
    }
}
