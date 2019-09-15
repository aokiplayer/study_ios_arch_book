//
//  MessageInputValidator.swift
//  Chap03-01App
//
//  Created by Hiroyuki Aoki on 2019/09/15.
//  Copyright © 2019 MyCompany. All rights reserved.
//

import UIKit

struct MessageInput {
    let messageType: MessageType
    let image: UIImage?
    let text: String?

    var isValid: Bool {
        switch messageType {
        case .text:
            return TextMessageInput(text: text).isValid
        case .image:
            return ImageMessageInput(image: image, text: text).isValid
        case .official:
            return false
        }
    }
}
