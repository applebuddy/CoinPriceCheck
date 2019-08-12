//
//  MainView.swift
//  CoinCheck
//
//  Created by Min Kyeong Tae on 23/06/2019.
//  Copyright © 2019 Min Kyeong Tae. All rights reserved.
//

import UIKit

class MainCurrencyView: UIView {
    // MARK: - UIs

    let mainCurrencyTableView: UITableView = {
        let mainTableView = UITableView(frame: CGRect.zero, style: UITableView.Style.grouped)
        mainTableView.backgroundColor = UIColor.tableViewBackground
        return mainTableView
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

    // MARK: - Setting Methods

    func setMainTableViewConstraint() {
        self.mainCurrencyTableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            mainCurrencyTableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            mainCurrencyTableView.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor),
            mainCurrencyTableView.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor),
            mainCurrencyTableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
        ])
    }
}

extension MainCurrencyView: UIViewSettingProtocol {
    func setConstraint() {
        self.setMainTableViewConstraint()
    }

    func setSubView() {
        addSubview(self.mainCurrencyTableView)
    }
}
