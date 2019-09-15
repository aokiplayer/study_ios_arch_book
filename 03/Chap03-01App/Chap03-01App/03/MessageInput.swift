//
//  MessageInput.swift
//  Chap03-01App
//
//  Created by Hiroyuki Aoki on 2019/09/15.
//  Copyright © 2019 MyCompany. All rights reserved.
//

import UIKit

struct MessageInput {
    let messageType: MessageType
    var image: UIImage?
    var text: String?

    // MARK: - Validation

    func validate() -> (success: Bool, image: UIImage?, text: String?) {
        var result: Bool = false

        do {
            switch messageType {
            case .text:
                let _ = try TextMessageInput(text: text).validate()
                result = true
            case .image:
                let _ = try ImageMessageInput(image: image, text: text).validate()
                result = true
            case .official:
                result = false
            }
        } catch TextMessageInputError.tooLongText(let count) {
            print("長すぎ: \(count)")
        } catch ImageMessageInputError.tooLongText(let count) {
            print("長すぎ: \(count)")
        } catch ImageMessageInputError.noImage {
            print("画像がない")
        } catch {
            print("不明なエラー")
        }

        return (result, image, text)
    }
}
