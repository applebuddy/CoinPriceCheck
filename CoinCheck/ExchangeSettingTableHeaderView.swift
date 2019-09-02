//
//  SettingHeaderView.swift
//  CoinCheck
//
//  Created by Min Kyeong Tae on 26/06/2019.
//  Copyright © 2019 Min Kyeong Tae. All rights reserved.
//

import UIKit

class ExchangeSettingTableHeaderView: UIView {
    // MARK: - UIs

    private let headerTitleLabel: UILabel = {
        let headerTitleLabel = UILabel()
        headerTitleLabel.text = "암호화폐 거래소를 선택해주세요."
        headerTitleLabel.textColor = UIColor.headerTitle
        return headerTitleLabel
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

    private func setHeaderTitleLabelConstraint() {
        self.headerTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            headerTitleLabel.centerYAnchor.constraint(equalTo: safeAreaLayoutGuide.centerYAnchor),
            headerTitleLabel.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor, constant: ViewData.Insets.leftInset),
            headerTitleLabel.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor, constant: -ViewData.Insets.rightInset),
        ])
    }
}

extension ExchangeSettingTableHeaderView: UIViewSettingProtocol {
    func setConstraint() {
        self.setHeaderTitleLabelConstraint()
    }

    func setSubView() {
        addSubview(self.headerTitleLabel)
    }
}
