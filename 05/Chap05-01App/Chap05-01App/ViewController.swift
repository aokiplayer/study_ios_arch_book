//
//  ViewController.swift
//  Chap05-01App
//
//  Created by Hiroyuki Aoki on 2019/09/16.
//  Copyright © 2019 MyCompany. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    private lazy var myView = View()

    override func loadView() {
        view = myView
        view.backgroundColor = .white
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // 外部から View に Model を渡しているイメージ
        myView.myModel = Model()
    }
}
