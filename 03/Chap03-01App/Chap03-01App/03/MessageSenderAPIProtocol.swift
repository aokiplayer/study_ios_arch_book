//
//  CommonMessageAPI.swift
//  Chap03-01App
//
//  Created by Hiroyuki Aoki on 2019/09/16.
//  Copyright © 2019 MyCompany. All rights reserved.
//

import UIKit

protocol MessageSenderAPIProtocol {
    func fetchAll(ofUserId: Int, completion: @escaping ([Message]?) -> Void)
    func fetch(id: Int, completion: @escaping (Message?) -> Void)
    func sendTextMessage(text: String, completion: @escaping (TextMessage?) -> Void)
    func sendImageMessage(image: UIImage, text: String?, completion: @escaping (ImageMessage?) -> Void)
}

final class TextMessageSenderAPI: MessageSenderAPIProtocol {
    func fetchAll(ofUserId: Int,
                  completion: @escaping ([Message]?) -> Void) {
        // Some code...
    }
    func fetch(id: Int,
               completion: @escaping (Message?) -> Void) {
        // Some code...
    }
    func sendTextMessage(text: String,
                         completion: @escaping (TextMessage?) -> Void) {
        // Some code...
    }
    func sendImageMessage(image: UIImage, text: String?,
                          completion: @escaping (ImageMessage?) -> Void) {
        // Some code...
    }
}

final class ImageMessageSenderAPI: MessageSenderAPIProtocol {
    func fetchAll(ofUserId: Int,
                  completion: @escaping ([Message]?) -> Void) {
        // Some code...
    }
    func fetch(id: Int,
               completion: @escaping (Message?) -> Void) {
        // Some code...
    }
    func sendTextMessage(text: String,
                         completion: @escaping (TextMessage?) -> Void) {
        // Some code...
    }
    func sendImageMessage(image: UIImage, text: String?,
                          completion: @escaping (ImageMessage?) -> Void) {
        // Some code...
    }
}
