//
//  View.swift
//  Chap05-02App
//
//  Created by Hiroyuki Aoki on 2019/09/17.
//  Copyright © 2019 MyCompany. All rights reserved.
//

import UIKit

final class View: UIView {
    let label: UILabel = UILabel()
    let minusButton: UIButton = UIButton()
    let plusButton: UIButton = UIButton()

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
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

        label.backgroundColor = .brown
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
        label.bottomAnchor.constraint(equalTo: minusButton.topAnchor, constant: -16).isActive = true
        minusButton.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor).isActive = true
        minusButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor).isActive = true
        plusButton.leadingAnchor.constraint(equalTo: minusButton.trailingAnchor, constant: 16).isActive = true
        plusButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor).isActive = true
        plusButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor).isActive = true
        plusButton.heightAnchor.constraint(equalTo: minusButton.heightAnchor).isActive = true
        plusButton.widthAnchor.constraint(equalTo: minusButton.widthAnchor).isActive = true
    }
}
