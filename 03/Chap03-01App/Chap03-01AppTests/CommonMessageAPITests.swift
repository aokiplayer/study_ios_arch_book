//
//  CommonMessageAPITests.swift
//  Chap03-01AppTests
//
//  Created by Hiroyuki Aoki on 2019/09/16.
//  Copyright © 2019 MyCompany. All rights reserved.
//

import XCTest
@testable import Chap03_01App

struct Stub必ず成功するTextMessageAPI: CommonMessageAPIProtocol {
    func fetchAll(ofUserId: Int, completion: @escaping ([Message]?) -> Void) {
        DispatchQueue.main.async {
            completion([TextMessage(id: 1, text: "成功1"),
                        ImageMessage(id: 2, text: "成功2", image: UIImage())])
        }
    }

    func fetch(id: Int, completion: @escaping (Message?) -> Void) {
        DispatchQueue.main.async {
            completion(TextMessage(id: 1, text: "成功"))
        }
    }

    func sendTextMessage(text: String, completion: @escaping (TextMessage?) -> Void) {
        DispatchQueue.main.async {
            completion(TextMessage(id: 1, text: "成功"))
        }
    }

    func sendImageMessage(image: UIImage, text: String?,
                          completion: @escaping (ImageMessage?) -> Void) {
        DispatchQueue.main.async {
            completion(ImageMessage(id: 1, text: "成功", image: UIImage()))
        }
    }
}

struct 必ず失敗するTextMessageAPI: CommonMessageAPIProtocol {
    func fetchAll(ofUserId: Int, completion: @escaping ([Message]?) -> Void) {
        DispatchQueue.main.async {
            completion(nil)
        }
    }

    func fetch(id: Int, completion: @escaping (Message?) -> Void) {
        DispatchQueue.main.async {
            completion(nil)
        }
    }

    func sendTextMessage(text: String, completion: @escaping (TextMessage?) -> Void) {
        DispatchQueue.main.async {
            completion(nil)
        }
    }

    func sendImageMessage(image: UIImage, text: String?,
                          completion: @escaping (ImageMessage?) -> Void) {
        DispatchQueue.main.async {
            completion(nil)
        }
    }
}

class CommonMessageAPITests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
