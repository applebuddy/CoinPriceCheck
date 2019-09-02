//
//  SettingView.swift
//  CoinCheck
//
//  Created by Min Kyeong Tae on 26/06/2019.
//  Copyright © 2019 Min Kyeong Tae. All rights reserved.
//

import UIKit

class ExchangeSettingView: UIView {
    // MARK: - UIs

    let exchangeSettingTableView: UITableView = {
        let settingExchangeTableView = UITableView(frame: CGRect.zero, style: UITableView.Style.grouped)
        settingExchangeTableView.backgroundColor = .tableViewBackground
        return settingExchangeTableView
    }()

    // MARK: - Initialization

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setSubView()
        self.setConstraint()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}

extension ExchangeSettingView: UIViewSettingProtocol {
    func setConstraint() {
        self.exchangeSettingTableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            exchangeSettingTableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            exchangeSettingTableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            exchangeSettingTableView.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor),
            exchangeSettingTableView.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor),
        ])
    }

    func setSubView() {
        addSubview(self.exchangeSettingTableView)
    }
}
