//
//  ImageMessageInputValidator.swift
//  Chap03-01App
//
//  Created by Hiroyuki Aoki on 2019/09/15.
//  Copyright © 2019 MyCompany. All rights reserved.
//

import UIKit

struct ImageMessageInput {
    var image: UIImage?
    var text: String?

    // MARK: - Validation

    var isValid: Bool {
        if image == nil { return false }
        if let text = text, text.count > 80 { return false }
        return true
    }
}
