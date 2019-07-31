//
//  MainView.swift
//  CoinCheck
//
//  Created by Min Kyeong Tae on 23/06/2019.
//  Copyright © 2019 Min Kyeong Tae. All rights reserved.
//

import UIKit

internal class MainView: UIView {
    // MARK: - UIs

    let mainTableView: UITableView = {
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
        self.mainTableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            mainTableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            mainTableView.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor),
            mainTableView.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor),
            mainTableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
        ])
    }
}

extension MainView: UIViewSettingProtocol {
    func setConstraint() {
        self.setMainTableViewConstraint()
    }

    func setSubView() {
        addSubview(self.mainTableView)
    }
}
