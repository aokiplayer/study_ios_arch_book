//
//  ViewController.swift
//  Chap05-02App
//
//  Created by Hiroyuki Aoki on 2019/09/17.
//  Copyright © 2019 MyCompany. All rights reserved.
//

import UIKit

final class ViewController: UIViewController {
    var myModel: Model? {
        didSet {
            // View と Model を結合し、 Model の監視を開始する
            registerModel()
        }
    }

    private(set) lazy var myView: View = View()

    override func loadView() {
        view = myView
    }

    deinit {
        myModel?.notificationCenter.removeObserver(self)
    }

    private func registerModel() {
        guard let model = myModel else { return }

        myView.label.text = model.count.description
        myView.minusButton.addTarget(self, action: #selector(onMinusTapped), for: .touchUpInside)
        myView.plusButton.addTarget(self, action: #selector(onPlusTapped), for: .touchUpInside)

        model.notificationCenter.addObserver(forName: .init("count"), object: nil, queue: nil) { [unowned self] notification in
            if let count = notification.userInfo?["count"] as? Int {
                self.myView.label.text = "\(count)"
            }
        }
    }

    @objc func onMinusTapped() { myModel?.countDown() }
    @objc func onPlusTapped() { myModel?.countUp() }
}

