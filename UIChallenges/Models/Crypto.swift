//
//  Crypto.swift
//  UIChallenges
//
//  Created by Andrei Bakos on 14.12.2023.
//

import Foundation

struct Crypto {
    var imageId: UUID
    var imageName: String
    var containerDescription: String

    init(imageName: String, containerDescription: String) {
        self.imageId = UUID()
        self.imageName = imageName
        self.containerDescription = containerDescription
    }
}

var cryptoList: [Crypto] = [
    Crypto(imageName: "ContentImage", containerDescription: "Equarium preview"),
    Crypto(imageName: "ContentImage2", containerDescription: "Crypto preview"),
    Crypto(imageName: "ContentImage3", containerDescription: "Cube Tech preview")
]
