//
//  ImagesStorage.swift
//  USDriver
//
//  Created by Sergey on 8/17/22.
//

import Foundation

protocol ImagesStorageProtocol {
    func load(forCard: Int) -> CardImage
}

class ImagesStorage: ImagesStorageProtocol {
    func load(forCard: Int) -> CardImage {
        let images: [CardImage] = [
            CardImage(id: 0, path: "path"),
            CardImage(id: 1, path: "anotherPath")
        ]
        // TO-DO
        return images.filter { $0.id == forCard }[0]
    }
}
