//
//  MainTableHearderView.swift
//  CoinCheck
//
//  Created by Min Kyeong Tae on 23/06/2019.
//  Copyright © 2019 Min Kyeong Tae. All rights reserved.
//

import UIKit

class MainTableHeaderView: UIView {
    // MARK: - UIs

    private let titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.text = "암호화폐 정보"
        titleLabel.textColor = UIColor.headerTitle
        return titleLabel
    }()

    // MARK: - Initialization

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.cellHeaderBackground
        self.setSubView()
        self.setConstraint()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    // MARK: - Set Method

    private func setTitleLabelConstraint() {
        self.titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.centerYAnchor.constraint(equalTo: safeAreaLayoutGuide.centerYAnchor, constant: 0),
            titleLabel.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor, constant: ViewData.Insets.leftInset),
        ])
    }
}

extension MainTableHeaderView: UIViewSettingProtocol {
    func setConstraint() {
        self.setTitleLabelConstraint()
    }

    func setSubView() {
        addSubview(self.titleLabel)
    }
}
