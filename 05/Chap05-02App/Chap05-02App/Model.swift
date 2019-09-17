//
//  Model.swift
//  Chap05-02App
//
//  Created by Hiroyuki Aoki on 2019/09/17.
//  Copyright © 2019 MyCompany. All rights reserved.
//

import Foundation

final class Model {
    let notificationCenter = NotificationCenter()

    private(set) var count = 0 {
        didSet {
            notificationCenter.post(name: .init("count"),
                                    object: nil,
                                    userInfo: ["count": count])
        }
    }

    func countDown() { count -= 1 }
    func countUp() { count += 1 }
}
