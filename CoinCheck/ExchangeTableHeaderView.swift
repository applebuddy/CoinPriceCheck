//
//  SettingHeaderView.swift
//  CoinCheck
//
//  Created by Min Kyeong Tae on 26/06/2019.
//  Copyright © 2019 Min Kyeong Tae. All rights reserved.
//

import UIKit

internal class ExchangeTableHeaderView: UIView {
    // MARK: - UIs

    let headerTitleLabel: UILabel = {
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

    func setHeaderTitleLabelConstraint() {
        self.headerTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            headerTitleLabel.centerYAnchor.constraint(equalTo: safeAreaLayoutGuide.centerYAnchor),
            headerTitleLabel.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor, constant: ViewInsets.leftInset),
            headerTitleLabel.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor, constant: -ViewInsets.rightInset),
        ])
    }
}

extension ExchangeTableHeaderView: UIViewSettingProtocol {
    func setConstraint() {
        self.setHeaderTitleLabelConstraint()
    }

    func setSubView() {
        addSubview(self.headerTitleLabel)
    }
}
