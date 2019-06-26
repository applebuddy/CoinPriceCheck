//
//  SettingView.swift
//  CoinCheck
//
//  Created by Min Kyeong Tae on 26/06/2019.
//  Copyright © 2019 Min Kyeong Tae. All rights reserved.
//

import UIKit

class SettingView: UIView {
    
    let settingTableView: UITableView = {
        let settingTableView = UITableView(frame: CGRect.zero, style: UITableView.Style.grouped)
        settingTableView.backgroundColor = UIColor.tableViewBackground
        return settingTableView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews()
        setConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func addSubviews() {
        addSubview(settingTableView);
    }
    
    func setConstraints() {
        self.settingTableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            settingTableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            settingTableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            settingTableView.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor),
            settingTableView.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor)
            ])
    }
}
