//
//  MessageSender.swift
//  Chap03-01App
//
//  Created by Hiroyuki Aoki on 2019/09/15.
//  Copyright © 2019 MyCompany. All rights reserved.
//

import UIKit

protocol Message {
    var id: Int { get }
}
class TextMessage: Message{
    var id: Int

    let text: String
    init(id: Int, text: String) {
        self.id = id
        self.text = text
    }
}
class ImageMessage: TextMessage{
    let image: UIImage
    init(id: Int, text: String, image: UIImage) {
        self.image = image
        super.init(id: id, text: text)
    }
}

protocol MessageSenderDelegate {
//    func validではないことを伝える()
//    func 通信完了を伝える()
    func stateの変化を伝える()
}

protocol MessageInput {
    associatedtype Payload
    func validate() throws -> Payload
}

protocol MessageSenderAPI {
    associatedtype Payload
    associatedtype Response: Message
    func send(payload: Payload, completion: @escaping (Response?) -> Void)
}

final class MessageSender<API: MessageSenderAPI, Input: MessageInput>
where API.Payload == Input.Payload {
    enum State {
        case inputting(validationError: Error?)
        case sending
        case sent(API.Response)
        case connectionFailed

        init(evaluating input: Input) {
            // Some code...
        }

        mutating func accept(response: API.Response?) {
            // Some code...
        }
    }

    private(set) var state: State {
        didSet { delegate?.stateの変化を伝える() }
    }

    let api: API

    var input: Input {
        didSet { state = State(evaluating: input) }
    }

    var delegate: MessageSenderDelegate?

    init(api: API, input: Input) {
        self.api = api
        self.input = input
        self.state = State(evaluating: input)
    }

    func send() {
        do {
            let payload = try input.validate()
            state = .sending
            api.send(payload: payload) { [weak self] in
                self?.state.accept(response: $0)
            }
        } catch let e {
            state = .inputting(validationError: e)
        }
    }
}
