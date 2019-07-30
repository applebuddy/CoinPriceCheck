//
//  SettingView.swift
//  CoinCheck
//
//  Created by Min Kyeong Tae on 26/06/2019.
//  Copyright © 2019 Min Kyeong Tae. All rights reserved.
//

import UIKit

internal class SettingExchangeView: UIView {
    // MARK: - UIs

    let settingExchangeTableView: UITableView = {
        let settingExchangeTableView = UITableView(frame: CGRect.zero, style: UITableView.Style.grouped)
        settingExchangeTableView.backgroundColor = UIColor.tableViewBackground
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

extension SettingExchangeView: UIViewSettingProtocol {
    func setConstraint() {
        self.settingExchangeTableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            settingExchangeTableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            settingExchangeTableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            settingExchangeTableView.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor),
            settingExchangeTableView.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor),
        ])
    }

    func setSubView() {
        addSubview(self.settingExchangeTableView)
    }
}
