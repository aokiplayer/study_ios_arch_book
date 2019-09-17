//
//  View.swift
//  Chap05-01App
//
//  Created by Hiroyuki Aoki on 2019/09/16.
//  Copyright © 2019 MyCompany. All rights reserved.
//

import UIKit

final class View: UIView {
    private let label: UILabel = UILabel()
    private let minusButton: UIButton = UIButton()
    private let plusButton: UIButton = UIButton()

    var defaultControllerClass: Controller.Type = Controller.self
    private var myController: Controller?

    var myModel: Model? {
        didSet {
            // Controller 生成と、 Model の監視を開始する
            registerModel()
        }
    }
    deinit {
        myModel?.notificationCenter.removeObserver(self)
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setSubViews()
        setLayout()
    }
    required init?(coder: NSCoder) {
        return nil
    }

    private func setSubViews() {
        addSubview(label)
        addSubview(minusButton)
        addSubview(plusButton)

        label.textAlignment = .center

        label.backgroundColor = .clear
        minusButton.backgroundColor = .lightGray
        plusButton.backgroundColor = .gray

        minusButton.setTitle("-1", for: .normal)
        plusButton.setTitle("+1", for: .normal)
    }

    private func setLayout() {
        label.translatesAutoresizingMaskIntoConstraints = false
        minusButton.translatesAutoresizingMaskIntoConstraints = false
        plusButton.translatesAutoresizingMaskIntoConstraints = false

        label.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor).isActive = true
        label.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor).isActive = true
        label.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor).isActive = true
        label.heightAnchor.constraint(equalTo: minusButton.heightAnchor).isActive = true
        label.bottomAnchor.constraint(equalTo: minusButton.topAnchor, constant: 16).isActive = true
        minusButton.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor).isActive = true
        minusButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor).isActive = true
        plusButton.leadingAnchor.constraint(equalTo: minusButton.trailingAnchor, constant: 16).isActive = true
        plusButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor).isActive = true
        plusButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor).isActive = true
        plusButton.heightAnchor.constraint(equalTo: minusButton.heightAnchor).isActive = true
        plusButton.widthAnchor.constraint(equalTo: minusButton.widthAnchor).isActive = true
    }

    private func registerModel() {
        guard let model = myModel else { return }

        let controller = defaultControllerClass.init()
        controller.myModel = model
        myController = controller
        label.text = model.count.description
        minusButton.addTarget(controller,
                              action: #selector(controller.onMinusTapped), for: .touchUpInside)
        plusButton.addTarget(controller,
                             action: #selector(controller.onPlusTapped), for: .touchUpInside)
        model.notificationCenter.addObserver(
            forName: .init("count"),
            object: nil, queue: nil) { [unowned self] notification in
            if let count = notification.userInfo?["count"] as? Int {
                self.label.text = count.description
            }
        }
    }
}
