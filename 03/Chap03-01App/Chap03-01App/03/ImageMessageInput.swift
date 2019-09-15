//
//  ImageMessageInputValidator.swift
//  Chap03-01App
//
//  Created by Hiroyuki Aoki on 2019/09/15.
//  Copyright © 2019 MyCompany. All rights reserved.
//

import UIKit

enum ImageMessageInputError: Error {
    case noImage, tooLongText(count: Int)
}

struct ImageMessageInput {
    var image: UIImage?
    var text: String?

    // MARK: - Validation

    func validate() throws -> (image: UIImage, text: String?) {
        guard let image = image
            else { throw ImageMessageInputError.noImage }
        if let text = text, text.count >= 80
            { throw ImageMessageInputError.tooLongText(count: text.count) }
        return (image, text)
    }
}
