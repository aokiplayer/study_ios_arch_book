//
//  MessageInputValidator.swift
//  Chap03-01App
//
//  Created by Hiroyuki Aoki on 2019/09/15.
//  Copyright © 2019 MyCompany. All rights reserved.
//

import UIKit

struct TextMessageInput {
    var text: String?

    // MARK: - Validation

    var isValid: Bool {
        if text == nil { return false }
        if let text = text, text.count > 300 { return false }
        return true
    }
}
