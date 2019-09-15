//
//  MessageSender.swift
//  Chap03-01App
//
//  Created by Hiroyuki Aoki on 2019/09/15.
//  Copyright © 2019 MyCompany. All rights reserved.
//

import UIKit

final class CommonMessageAPI {
    func fetchAll(ofUserId: Int,
                  completion: ([Message]?) -> Void) {
        // Some code...
    }
    func fetch(id: Int,
               completion: (Message?) -> Void) {
        // Some code...
    }
    func sendTextMessage(text: String,
                         completion: (TextMessage?) -> Void) {
        // Some code...
    }
    func sendImageMessage(image: UIImage, text: String?,
                          completion: (ImageMessage?) -> Void) {
        // Some code...
    }
}

final class MessageSender {
    private let api = CommonMessageAPI()
    let messageType: MessageType
    var delegate: MessageSenderDelegate?
    var isValid: Bool {
        MessageInput(messageType: messageType, image: image, text: text).isValid
    }

    // MessageType.official をセットアップするのは禁止！！
    init(messageType: MessageType) {
        self.messageType = messageType
    }
    // 送信するメッセージの入力値
    var text: String? { // TextMessage, ImageMessage どちらの場合も使う
        didSet { if !isValid { delegate?.validではないことを伝える() } }
    }
    var image: UIImage? {// ImageMessage の場合に使う
        didSet { if !isValid { delegate?.validではないことを伝える() } }
    }
    // 通信結果
    private(set) var isLoading: Bool = false
    private(set) var result: Message? // 送信成功したら値が入る

    // MARK: - Sending

    func send() {
        guard isValid else { delegate?.validではないことを伝える(); return }
        isLoading = true
        switch messageType {
        case .text:
            api.sendTextMessage(text: text!) { [weak self] in
                self?.isLoading = false
                self?.result = $0
                self?.delegate?.通信完了を伝える()
            }
        case .image:
            api.sendImageMessage(image: image!, text: text) { _ in
                // Some code...
            }
        case .official:
            fatalError()
        }
    }
}

class Message {
    // Members...
}
class TextMessage: Message{
    // Members...
}
class ImageMessage: Message{
    // Members...
}

enum MessageType {
    case text
    case image
    case official
}

protocol MessageSenderDelegate {
    func validではないことを伝える()
    func 通信完了を伝える()
}
