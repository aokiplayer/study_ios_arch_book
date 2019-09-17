//
//  Controller.swift
//  Chap05-01App
//
//  Created by Hiroyuki Aoki on 2019/09/16.
//  Copyright © 2019 MyCompany. All rights reserved.
//

import Foundation

class Controller {
    weak var myModel: Model?
    required init() {}
    @objc func onMinusTapped() { myModel?.countDown() }
    @objc func onPlusTapped() { myModel?.countUp() }
}
