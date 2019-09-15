//
//  MessageInputValidator.swift
//  Chap03-01App
//
//  Created by Hiroyuki Aoki on 2019/09/15.
//  Copyright © 2019 MyCompany. All rights reserved.
//

import UIKit

enum TextMessageInputError: Error {
    case tooLongText(count: Int)
}

struct TextMessageInput {
    var text: String?

    // MARK: - Validation

    func validate() throws -> String? {
        if let text = text, text.count > 300 {
            throw TextMessageInputError.tooLongText(count: text.count)
        }
        return text
    }
}
