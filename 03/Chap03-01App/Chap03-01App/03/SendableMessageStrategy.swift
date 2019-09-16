//
//  SendableMessageType.swift
//  Chap03-01App
//
//  Created by Hiroyuki Aoki on 2019/09/16.
//  Copyright © 2019 MyCompany. All rights reserved.
//

import Foundation

enum SendableMessageStrategy {
    case text(api: TextMessageSenderAPI, input: TextMessageInput)
    case image(api: ImageMessageSenderAPI, input: ImageMessageInput)

    mutating func update(input: Any) {
        // input を書き換える
    }
    func send(completion: @escaping (Message?) -> Void) {
        // case ごとに通信を行う
    }
}
